module Lib
    ( eval
    , toString
    , Expr
    , Literal(..)
    , Neg(..)
    , Add(..)
    ) where

class Expr e where
    eval :: e -> Int
    toString :: e -> String

newtype Literal = Literal Int
newtype Neg e = Neg e
data Add l r = Add l r

instance Expr Literal where
    eval (Literal x) = x
    toString (Literal x) = '!':show x

instance Expr e => Expr (Neg e) where
    eval (Neg x) = negate $ eval x
    toString (Neg x) = '-':toString x

instance (Expr l, Expr r) => Expr (Add l r) where
    eval (Add x y) = eval x + eval y
    toString (Add x y) = "(" ++ toString x ++ " + " ++ toString y ++ ")"

-- instance Expr e => Show e where
--     show x = show $ eval x
