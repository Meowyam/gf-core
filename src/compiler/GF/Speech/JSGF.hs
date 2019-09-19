----------------------------------------------------------------------
-- |
-- Module      : GF.Speech.JSGF
--
-- This module prints a CFG as a JSGF grammar.
--
-- FIXME: remove \/ warn \/ fail if there are int \/ string literal
-- categories in the grammar
--
-- FIXME: convert to UTF-8
-----------------------------------------------------------------------------

module GF.Speech.JSGF (jsgfPrinter) where

--import GF.Data.Utilities
import GF.Infra.Option
import GF.Grammar.CFG
import GF.Speech.RegExp
import GF.Speech.SISR
import GF.Speech.SRG
import PGF2

import Data.Char
import Data.List
--import Data.Maybe
import GF.Text.Pretty
--import Debug.Trace

width :: Int
width = 75

jsgfPrinter :: Options
	        -> PGF 
            -> Concr -> String
jsgfPrinter opts pgf cnc = renderStyle st $ prJSGF sisr $ makeNonLeftRecursiveSRG opts pgf cnc
  where st = style { lineLength = width }
        sisr = flag optSISR opts

prJSGF :: Maybe SISRFormat -> SRG -> Doc
prJSGF sisr srg
    = header $++$ mainCat $++$ foldr ($++$) empty (map prRule (srgRules srg))
    where
    header = "#JSGF" <+> "V1.0" <+> "UTF-8" <+> lang <> ';' $$
             comment ("JSGF speech recognition grammar for " ++ srgName srg) $$
             comment "Generated by GF" $$
	     ("grammar " ++ srgName srg ++ ";") 
    lang = maybe empty pp (srgLanguage srg)
    mainCat = rule True "MAIN" [prCat (srgStartCat srg)]
    prRule (SRGRule cat rhs) = rule (isExternalCat srg cat) cat (map prAlt rhs)
    prAlt (SRGAlt mp n rhs) = sep [initTag, p (prItem sisr n rhs), finalTag]
      where initTag | isEmpty t = empty
                    | otherwise = "<NULL>" <+>  t
                where t = tag sisr (profileInitSISR n)
            finalTag = tag sisr (profileFinalSISR n)
            p = if isEmpty initTag && isEmpty finalTag then id else parens

prCat :: Cat -> Doc
prCat c = '<' <> c <> '>'

prItem :: Maybe SISRFormat -> CFTerm -> SRGItem -> Doc
prItem sisr t = f 0
  where
    f _ (REUnion [])  = pp "<VOID>"
    f p (REUnion xs) 
        | not (null es) = brackets (f 0 (REUnion nes))
        | otherwise = (if p >= 1 then parens else id) (alts (map (f 1) xs))
      where (es,nes) = partition isEpsilon xs
    f _ (REConcat []) = pp "<NULL>"
    f p (REConcat xs) = (if p >= 3 then parens else id) (fsep (map (f 2) xs))
    f p (RERepeat x)  = f 3 x <> '*'
    f _ (RESymbol s)  = prSymbol sisr t s

prSymbol :: Maybe SISRFormat -> CFTerm -> SRGSymbol -> Doc
prSymbol sisr cn (NonTerminal n@(c,_)) = prCat c <+> tag sisr (catSISR cn n)
prSymbol _ cn (Terminal t) | all isPunct t = empty  -- removes punctuation
                           | otherwise = pp t -- FIXME: quote if there is whitespace or odd chars

tag :: Maybe SISRFormat -> (SISRFormat -> SISRTag) -> Doc
tag Nothing _ = empty
tag (Just fmt) t = case t fmt of
                     [] -> empty
                     ts -> '{' <+> (e $ prSISR ts) <+> '}'
  where e [] = []
        e ('}':xs) = '\\':'}':e xs
        e ('\n':xs) = ' ' : e (dropWhile isSpace xs)
        e (x:xs) = x:e xs

isPunct :: Char -> Bool
isPunct c = c `elem` "-_.;.,?!"

comment :: String -> Doc
comment s = "//" <+> s

alts :: [Doc] -> Doc
alts = fsep . prepunctuate ("| ")

rule :: Bool -> Cat -> [Doc] -> Doc
rule pub c xs = p <+> prCat c <+> '=' <+> nest 2 (alts xs) <+> ';'
  where p = if pub then pp "public" else empty

-- Pretty-printing utilities

emptyLine :: Doc
emptyLine = pp ""

--prepunctuate :: Doc -> [Doc] -> [Doc]
prepunctuate _ [] = []
prepunctuate p (x:xs) = x : map (p <>) xs

($++$) :: Doc -> Doc -> Doc
x $++$ y = x $$ emptyLine $$ y

