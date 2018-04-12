module Properties
    ( evalCommutes
    , evalNeutralElement
    ) where

import Lib
import Control.Monad
import Test.QuickCheck
import Test.Hspec.QuickCheck

evalCommutes :: Expr e => e -> e -> Bool
evalCommutes a b = eval (Add a b) == eval (Add b a)

evalNeutralElement :: Expr e => e -> Bool
evalNeutralElement a = eval (Add a (Literal 0)) == eval a
