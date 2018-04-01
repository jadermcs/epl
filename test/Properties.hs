module Properties
    (
         -- evalCommutes
    -- , evalNeutralElement
    ) where

import Lib
import Test.Hspec.QuickCheck

instance Arbitrary Expr where
    arbitrary = do
        x <- frequency [ (10, choose (0, 1000))
                       , (5, choose (1001, 10000))
                       , (1, choose (10001, 50000))]
        return $ 


-- evalCommutes :: Integer -> Integer -> Bool
-- evalCommutes a b = a + b == b + a

-- evalCommutes :: Expr -> Expr -> Bool
-- evalCommutes a b = eval (Add a b) == eval (Add b a)

-- evalNeutralElement :: Expr a -> Bool
-- evalNeutralElement a = eval $ Add a (Literal 0) == eval a
