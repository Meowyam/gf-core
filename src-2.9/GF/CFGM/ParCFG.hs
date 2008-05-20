{-# OPTIONS -fglasgow-exts -cpp #-}
module GF.CFGM.ParCFG where
import GF.CFGM.AbsCFG
import GF.CFGM.LexCFG
import GF.Data.ErrM
import Array
#if __GLASGOW_HASKELL__ >= 503
import GHC.Exts
#else
import GlaExts
#endif

-- parser produced by Happy Version 1.15

newtype HappyAbsSyn  = HappyAbsSyn (() -> ())
happyIn4 :: (Ident) -> (HappyAbsSyn )
happyIn4 x = unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> (Ident)
happyOut4 x = unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: (Integer) -> (HappyAbsSyn )
happyIn5 x = unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> (Integer)
happyOut5 x = unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (String) -> (HappyAbsSyn )
happyIn6 x = unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> (String)
happyOut6 x = unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (SingleQuoteString) -> (HappyAbsSyn )
happyIn7 x = unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (SingleQuoteString)
happyOut7 x = unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: (Grammars) -> (HappyAbsSyn )
happyIn8 x = unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> (Grammars)
happyOut8 x = unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (Grammar) -> (HappyAbsSyn )
happyIn9 x = unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (Grammar)
happyOut9 x = unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: ([Grammar]) -> (HappyAbsSyn )
happyIn10 x = unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> ([Grammar])
happyOut10 x = unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (Flag) -> (HappyAbsSyn )
happyIn11 x = unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> (Flag)
happyOut11 x = unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: ([Flag]) -> (HappyAbsSyn )
happyIn12 x = unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> ([Flag])
happyOut12 x = unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Rule) -> (HappyAbsSyn )
happyIn13 x = unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> (Rule)
happyOut13 x = unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: ([Rule]) -> (HappyAbsSyn )
happyIn14 x = unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> ([Rule])
happyOut14 x = unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (Fun) -> (HappyAbsSyn )
happyIn15 x = unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> (Fun)
happyOut15 x = unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (Profiles) -> (HappyAbsSyn )
happyIn16 x = unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> (Profiles)
happyOut16 x = unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: ([Profile]) -> (HappyAbsSyn )
happyIn17 x = unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> ([Profile])
happyOut17 x = unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (Profile) -> (HappyAbsSyn )
happyIn18 x = unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> (Profile)
happyOut18 x = unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: ([Integer]) -> (HappyAbsSyn )
happyIn19 x = unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> ([Integer])
happyOut19 x = unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (Symbol) -> (HappyAbsSyn )
happyIn20 x = unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> (Symbol)
happyOut20 x = unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: ([Symbol]) -> (HappyAbsSyn )
happyIn21 x = unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> ([Symbol])
happyOut21 x = unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Category) -> (HappyAbsSyn )
happyIn22 x = unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (Category)
happyOut22 x = unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyInTok :: Token -> (HappyAbsSyn )
happyInTok x = unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> Token
happyOutTok x = unsafeCoerce# x
{-# INLINE happyOutTok #-}

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x00\x00\x36\x00\x00\x00\x29\x00\x35\x00\x00\x00\x32\x00\x00\x00\x30\x00\x38\x00\x19\x00\x2e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x37\x00\x34\x00\x00\x00\x2d\x00\x00\x00\x00\x00\x2f\x00\x00\x00\x31\x00\xfd\xff\x00\x00\x2c\x00\x2a\x00\x23\x00\x22\x00\x2b\x00\x25\x00\x20\x00\x00\x00\xfd\xff\x00\x00\x00\x00\x00\x00\x17\x00\x1c\x00\x00\x00\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x28\x00\x00\x00\x00\x00\x00\x00\x1e\x00\x00\x00\x21\x00\x05\x00\x01\x00\x00\x00\x1d\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x1a\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x0d\x00\x02\x00\x00\x00\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xf8\xff\x00\x00\xfe\xff\x00\x00\xfa\xff\xf7\xff\x00\x00\xf5\xff\xf2\xff\x00\x00\x00\x00\x00\x00\xe0\xff\xf6\xff\xfb\xff\xf0\xff\x00\x00\x00\x00\xef\xff\x00\x00\xf4\xff\xf9\xff\x00\x00\xf1\xff\x00\x00\xed\xff\xe9\xff\x00\x00\xec\xff\xe8\xff\x00\x00\x00\x00\xe7\xff\x00\x00\xfd\xff\xed\xff\xee\xff\xeb\xff\xea\xff\xe8\xff\x00\x00\xe4\xff\xe2\xff\xf3\xff\xe5\xff\xe3\xff\xfc\xff\xe6\xff\xe1\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x02\x00\x03\x00\x06\x00\x02\x00\x03\x00\x03\x00\x03\x00\x07\x00\x0c\x00\x00\x00\x0a\x00\x00\x00\x08\x00\x01\x00\x10\x00\x11\x00\x12\x00\x10\x00\x11\x00\x12\x00\x12\x00\x12\x00\x0d\x00\x0e\x00\x0d\x00\x0e\x00\x01\x00\x0f\x00\x00\x00\x05\x00\x03\x00\x0c\x00\x00\x00\x09\x00\x05\x00\x0d\x00\x0c\x00\x09\x00\x07\x00\x0b\x00\x0f\x00\x0e\x00\x0f\x00\x04\x00\x08\x00\x06\x00\x04\x00\x0d\x00\x0f\x00\x08\x00\x07\x00\x03\x00\x06\x00\x02\x00\x0a\x00\x01\x00\x01\x00\x11\x00\x0b\x00\xff\xff\x0f\x00\x0c\x00\x0a\x00\xff\xff\xff\xff\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x29\x00\x0c\x00\x1e\x00\x29\x00\x0c\x00\x0c\x00\x0c\x00\x09\x00\x03\x00\x1a\x00\x0a\x00\x1a\x00\x08\x00\x20\x00\x2a\x00\x30\x00\x2c\x00\x2a\x00\x2b\x00\x2c\x00\x1f\x00\x0d\x00\x25\x00\x1c\x00\x1b\x00\x1c\x00\x20\x00\x2f\x00\x0f\x00\x13\x00\x2e\x00\x18\x00\x07\x00\x14\x00\x05\x00\x23\x00\x03\x00\x10\x00\x27\x00\x11\x00\x21\x00\x2f\x00\x0f\x00\x03\x00\x28\x00\x04\x00\x29\x00\x23\x00\x0f\x00\x24\x00\x25\x00\x1f\x00\x1a\x00\x17\x00\x16\x00\x18\x00\x15\x00\xff\xff\x0c\x00\x00\x00\x0f\x00\x03\x00\x07\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = array (1, 31) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31)
	]

happy_n_terms = 18 :: Int
happy_n_nonterms = 19 :: Int

happyReduce_1 = happySpecReduce_1 0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn4
		 (Ident happy_var_1
	)}

happyReduce_2 = happySpecReduce_1 1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn5
		 ((read happy_var_1) :: Integer
	)}

happyReduce_3 = happySpecReduce_1 2# happyReduction_3
happyReduction_3 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TL happy_var_1)) -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_4 = happySpecReduce_1 3# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_SingleQuoteString happy_var_1)) -> 
	happyIn7
		 (SingleQuoteString (happy_var_1)
	)}

happyReduce_5 = happySpecReduce_1 4# happyReduction_5
happyReduction_5 happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	happyIn8
		 (Grammars (reverse happy_var_1)
	)}

happyReduce_6 = happyReduce 6# 5# happyReduction_6
happyReduction_6 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut4 happy_x_2 of { happy_var_2 -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut14 happy_x_4 of { happy_var_4 -> 
	happyIn9
		 (Grammar happy_var_2 (reverse happy_var_3) (reverse happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_7 = happySpecReduce_0 6# happyReduction_7
happyReduction_7  =  happyIn10
		 ([]
	)

happyReduce_8 = happySpecReduce_2 6# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn10
		 (flip (:) happy_var_1 happy_var_2
	)}}

happyReduce_9 = happySpecReduce_2 7# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (StartCat happy_var_2
	)}

happyReduce_10 = happySpecReduce_0 8# happyReduction_10
happyReduction_10  =  happyIn12
		 ([]
	)

happyReduce_11 = happySpecReduce_3 8# happyReduction_11
happyReduction_11 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn12
		 (flip (:) happy_var_1 happy_var_2
	)}}

happyReduce_12 = happyReduce 7# 9# happyReduction_12
happyReduction_12 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	case happyOut22 happy_x_5 of { happy_var_5 -> 
	case happyOut21 happy_x_7 of { happy_var_7 -> 
	happyIn13
		 (Rule happy_var_1 happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}}

happyReduce_13 = happySpecReduce_0 10# happyReduction_13
happyReduction_13  =  happyIn14
		 ([]
	)

happyReduce_14 = happySpecReduce_3 10# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	case happyOut13 happy_x_2 of { happy_var_2 -> 
	happyIn14
		 (flip (:) happy_var_1 happy_var_2
	)}}

happyReduce_15 = happySpecReduce_1 11# happyReduction_15
happyReduction_15 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (Cons happy_var_1
	)}

happyReduce_16 = happySpecReduce_1 11# happyReduction_16
happyReduction_16 happy_x_1
	 =  happyIn15
		 (Coerce
	)

happyReduce_17 = happySpecReduce_3 12# happyReduction_17
happyReduction_17 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { happy_var_2 -> 
	happyIn16
		 (Profiles happy_var_2
	)}

happyReduce_18 = happySpecReduce_0 13# happyReduction_18
happyReduction_18  =  happyIn17
		 ([]
	)

happyReduce_19 = happySpecReduce_1 13# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	happyIn17
		 ((:[]) happy_var_1
	)}

happyReduce_20 = happySpecReduce_3 13# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn17
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_21 = happySpecReduce_3 14# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_2 of { happy_var_2 -> 
	happyIn18
		 (UnifyProfile happy_var_2
	)}

happyReduce_22 = happySpecReduce_1 14# happyReduction_22
happyReduction_22 happy_x_1
	 =  case happyOut4 happy_x_1 of { happy_var_1 -> 
	happyIn18
		 (ConstProfile happy_var_1
	)}

happyReduce_23 = happySpecReduce_0 15# happyReduction_23
happyReduction_23  =  happyIn19
		 ([]
	)

happyReduce_24 = happySpecReduce_1 15# happyReduction_24
happyReduction_24 happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 ((:[]) happy_var_1
	)}

happyReduce_25 = happySpecReduce_3 15# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_26 = happySpecReduce_1 16# happyReduction_26
happyReduction_26 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (CatS happy_var_1
	)}

happyReduce_27 = happySpecReduce_1 16# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (TermS happy_var_1
	)}

happyReduce_28 = happySpecReduce_1 17# happyReduction_28
happyReduction_28 happy_x_1
	 =  happyIn21
		 ([]
	)

happyReduce_29 = happySpecReduce_1 17# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ((:[]) happy_var_1
	)}

happyReduce_30 = happySpecReduce_2 17# happyReduction_30
happyReduction_30 happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	case happyOut21 happy_x_2 of { happy_var_2 -> 
	happyIn21
		 ((:) happy_var_1 happy_var_2
	)}}

happyReduce_31 = happySpecReduce_1 18# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn22
		 (Category happy_var_1
	)}

happyNewToken action sts stk [] =
	happyDoAction 17# (error "reading EOF!") action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS ";") -> cont 1#;
	PT _ (TS ":") -> cont 2#;
	PT _ (TS ".") -> cont 3#;
	PT _ (TS "->") -> cont 4#;
	PT _ (TS "_") -> cont 5#;
	PT _ (TS "[") -> cont 6#;
	PT _ (TS "]") -> cont 7#;
	PT _ (TS ",") -> cont 8#;
	PT _ (TS "end") -> cont 9#;
	PT _ (TS "grammar") -> cont 10#;
	PT _ (TS "startcat") -> cont 11#;
	PT _ (TV happy_dollar_dollar) -> cont 12#;
	PT _ (TI happy_dollar_dollar) -> cont 13#;
	PT _ (TL happy_dollar_dollar) -> cont 14#;
	PT _ (T_SingleQuoteString happy_dollar_dollar) -> cont 15#;
	_ -> cont 16#;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [Token] -> Err a
happyError' = happyError

pGrammars tks = happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut8 x))

happySeq = happyDontSeq

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ if null ts then [] else (" before " ++ unwords (map prToken (take 4 ts)))

myLexer = tokens
{-# LINE 1 "GenericTemplate.hs" #-}
-- $Id: ParCFG.hs,v 1.8 2005/05/17 14:04:37 bringert Exp $













{-# LINE 27 "GenericTemplate.hs" #-}



data Happy_IntList = HappyCons Int# Happy_IntList






































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
	= {- nothing -}


	  case action of
		0#		  -> {- nothing -}
				     happyFail i tk st
		-1# 	  -> {- nothing -}
				     happyAccept i tk st
		n | (n <# (0# :: Int#)) -> {- nothing -}

				     (happyReduceArr ! rule) i tk st
				     where rule = (I# ((negateInt# ((n +# (1# :: Int#))))))
		n		  -> {- nothing -}


				     happyShift new_state i tk st
				     where new_state = (n -# (1# :: Int#))
   where off    = indexShortOffAddr happyActOffsets st
	 off_i  = (off +# i)
	 check  = if (off_i >=# (0# :: Int#))
			then (indexShortOffAddr happyCheck off_i ==#  i)
			else False
 	 action | check     = indexShortOffAddr happyTable off_i
		| otherwise = indexShortOffAddr happyDefActions st











indexShortOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ > 500
	narrow16Int# i
#elif __GLASGOW_HASKELL__ == 500
	intToInt16# i
#else
	(i `iShiftL#` 16#) `iShiftRA#` 16#
#endif
  where
#if __GLASGOW_HASKELL__ >= 503
	i = word2Int# ((high `uncheckedShiftL#` 8#) `or#` low)
#else
	i = word2Int# ((high `shiftL#` 8#) `or#` low)
#endif
	high = int2Word# (ord# (indexCharOffAddr# arr (off' +# 1#)))
	low  = int2Word# (ord# (indexCharOffAddr# arr off'))
	off' = off *# 2#





data HappyAddr = HappyA# Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 169 "GenericTemplate.hs" #-}


-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case unsafeCoerce# x of { (I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k -# (1# :: Int#)) sts of
	 sts1@((HappyCons (st1@(action)) (_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where sts1@((HappyCons (st1@(action)) (_))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n -# (1# :: Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n -# (1#::Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off    = indexShortOffAddr happyGotoOffsets st
	 off_i  = (off +# nt)
 	 new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail  0# tk old_st _ stk =
--	trace "failing" $ 
    	happyError_ tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
	happyDoAction 0# tk action sts ( (unsafeCoerce# (I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
