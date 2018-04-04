module Properties
    ( 
        -- evalCommutes
    -- , evalNeutralElement
    ) where

import Lib
import Control.Monad
import Test.QuickCheck
import Test.Hspec.QuickCheck

-- instance Arbitrary Literal where
--     arbitrary = x

-- instance (Expr l, Expr r) => Arbitrary (Add l r)where
--     arbitrary = sized expr'
--       where expr' 0 = fmap Literal arbitrary
--             expr' n | n > 0 = oneof [fmap Literal arbitrary,
--                                     liftM2 Add subexpr subexpr]
--                     where subexpr = expr' (n `div` 2)

-- evalCommutes :: Expr e => e -> e -> Bool
-- evalCommutes a b = eval (Add a b) == eval (Add b a)

-- evalNeutralElement :: Expr e -> e -> Bool
-- evalNeutralElement a = eval (Add a (Literal 0)) == eval a
