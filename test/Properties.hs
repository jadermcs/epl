module Properties
    ( evalCommutes
    , evalNeutralElement
    ) where

import Lib
import Control.Monad
import Test.QuickCheck
import Test.Hspec.QuickCheck

instance Arbitrary Expr where
    arbitrary = sized tree'
      where tree' 0 = fmap Literal arbitrary
            tree' n | n>0 =
                oneof [fmap Literal arbitrary,
                                  liftM2 Add subtree subtree]
              where subtree = tree' (n `div` 2)

evalCommutes :: Expr -> Expr -> Bool
evalCommutes a b = eval (Add a b) == eval (Add b a)

evalNeutralElement :: Expr -> Bool
evalNeutralElement a = eval ( Add a (Literal 0)) == eval a
