----------------------------------------------------------------------
-- |
-- Maintainer  : PL
-- Stability   : (stable)
-- Portability : (portable)
--
-- > CVS $Date: 2005/04/12 10:49:44 $ 
-- > CVS $Author: peb $
-- > CVS $Revision: 1.2 $
--
-- Converting GFC to SimpleGFC
--
-- the conversion might fail if the GFC grammar has dependent or higher-order types
-----------------------------------------------------------------------------

module GF.Conversion.GFCtoSimple 
    (convertGrammar) where

import qualified AbsGFC as A
import qualified Ident as I
import GF.Formalism.GCFG
import GF.Formalism.SimpleGFC 
import GF.Conversion.Types

import GFC (CanonGrammar)
import MkGFC (grammar2canon)
import qualified Look (lookupLin, allParamValues, lookupLincat)
import qualified CMacros (defLinType)
import Operations (err, errVal)
--import qualified Modules as M

import GF.System.Tracing
import GF.Infra.Print

----------------------------------------------------------------------

type Env = (CanonGrammar, I.Ident)

convertGrammar :: Env -> SGrammar
convertGrammar gram = trace2 "converting language" (show (snd gram)) $
		      tracePrt "#simpleGFC rules" (show . length) $
		      [ convertAbsFun gram fun typing |
			A.Mod (A.MTAbs modname) _ _ _ defs <- modules,
			A.AbsDFun fun typing _ <- defs ]
    where A.Gr modules = grammar2canon (fst gram)

convertAbsFun :: Env -> I.Ident -> A.Exp -> SRule
convertAbsFun gram fun typing = Rule abs cnc
    where abs = convertAbstract [] fun typing
	  cnc = convertConcrete gram abs

----------------------------------------------------------------------
-- abstract definitions

convertAbstract :: [SDecl] -> Fun -> A.Exp -> Abstract SDecl Name
convertAbstract env fun (A.EProd x a b) 
    = convertAbstract ((x' ::: convertType [] a) : env) fun b
    where x' = if x==I.identC "h_" then anyVar else x
convertAbstract env fun a 
    = Abs (anyVar ::: convertType [] a) (reverse env) name
    where name = Name fun [ Unify [n] | n <- [0 .. length env-1] ]

convertType :: [Atom] -> A.Exp -> SType
convertType args (A.EApp a (A.EAtom at)) = convertType (convertAtom at : args) a
convertType args (A.EAtom at) = convertCat at :@ args

convertAtom :: A.Atom -> Atom
convertAtom (A.AC con) = ACon con
convertAtom (A.AV var) = AVar var

convertCat :: A.Atom -> SCat
convertCat (A.AC (A.CIQ _ cat)) = cat
convertCat at = error $ "convertCat: " ++ show at

----------------------------------------------------------------------
-- concrete definitions

convertConcrete :: Env -> Abstract SDecl Name -> Concrete SLinType (Maybe STerm)
convertConcrete gram (Abs decl args name) = Cnc ltyp largs term
    where term = fmap (convertTerm gram) $ lookupLin gram $ name2fun name
	  ltyp : largs = map (convertCType gram . lookupCType gram) (decl : args)

convertCType :: Env -> A.CType -> SLinType
convertCType gram (A.RecType rec) 
    = RecT [ (lbl, convertCType gram ctype) | A.Lbg lbl ctype <- rec ]
convertCType gram (A.Table ptype vtype) 
    = TblT (convertCType gram ptype) (convertCType gram vtype)
convertCType gram ct@(A.Cn con) = ConT con $ map (convertTerm gram) $ groundTerms gram ct
convertCType gram (A.TStr) = StrT
convertCType gram (A.TInts n) = error "convertCType: cannot handle 'TInts' constructor"

convertTerm :: Env -> A.Term -> STerm
convertTerm gram (A.Arg arg) = convertArgVar arg
convertTerm gram (A.Con con terms) = con :^ map (convertTerm gram) terms
convertTerm gram (A.LI var) = Var var
convertTerm gram (A.R rec) = Rec [ (lbl, convertTerm gram term) | A.Ass lbl term <- rec ]
convertTerm gram (A.P term lbl) = convertTerm gram term +. lbl
convertTerm gram (A.V ctype terms) = Tbl [ (convertTerm gram pat, convertTerm gram term) |
					  (pat, term) <- zip (groundTerms gram ctype) terms ]
convertTerm gram (A.T ctype tbl) = Tbl [ (convertPatt pat, convertTerm gram term) |
					A.Cas pats term <- tbl, pat <- pats ]
convertTerm gram (A.S term sel) = convertTerm gram term +! convertTerm gram sel
convertTerm gram (A.C term1 term2) = convertTerm gram term1 ?++ convertTerm gram term2
convertTerm gram (A.FV terms) = Variants (map (convertTerm gram) terms)
-- 'pre' tokens are converted to variants (over-generating):
convertTerm gram (A.K (A.KP [s] vs))
    = Variants $ Token s : [ Token v | A.Var [v] _ <- vs ]
convertTerm gram (A.K (A.KP _ _)) = error "convertTerm: don't know how to handle string lists in 'pre' tokens"
convertTerm gram (A.K (A.KS tok)) = Token tok
convertTerm gram (A.E) = Empty
convertTerm gram (A.I con) = error "convertTerm: cannot handle 'I' constructor"
convertTerm gram (A.EInt int) = error "convertTerm: cannot handle 'EInt' constructor"

convertArgVar :: A.ArgVar -> STerm
convertArgVar (A.A cat nr) = Arg (fromInteger nr) cat emptyPath
convertArgVar (A.AB cat bindings nr) = Arg (fromInteger nr) cat emptyPath

convertPatt (A.PC con pats) = con :^ map convertPatt pats
convertPatt (A.PV x) = Var x
convertPatt (A.PW) = Wildcard
convertPatt (A.PR rec) = Rec [ (lbl, convertPatt pat) | A.PAss lbl pat <- rec ]
convertPatt (A.PI n) = error "convertPatt: cannot handle 'PI' constructor"

----------------------------------------------------------------------

lookupLin :: Env -> Fun -> Maybe A.Term
lookupLin gram fun = err fail Just $
		     Look.lookupLin (fst gram) (A.CIQ (snd gram) fun)

lookupCType :: Env -> SDecl -> A.CType
lookupCType env decl
    = errVal CMacros.defLinType $ 
      Look.lookupLincat (fst env) (A.CIQ (snd env) (decl2cat decl))

groundTerms :: Env -> A.CType -> [A.Term]
groundTerms gram ctype = err error id $
			 Look.allParamValues (fst gram) ctype

