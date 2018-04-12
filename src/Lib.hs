module Lib
    ( eval
    , toString
    , Expr
    , Literal(..)
    , Neg(..)
    , Add(..)
    , Sub(..)
    , Mult(..)
    ) where

class Expr e where
    eval :: e -> Int
    toString :: e -> String

newtype Literal = Literal Int
newtype Neg e = Neg e
data Add l r = Add l r
data Sub l r = Sub l r
data Mult l r = Mult l r

instance Expr Literal where
    eval (Literal x) = x
    toString (Literal x) = '!':show x

instance Expr e => Expr (Neg e) where
    eval (Neg x) = negate $ eval x
    toString (Neg x) = "(-" ++ toString x ++ ")"

instance (Expr l, Expr r) => Expr (Add l r) where
    eval (Add x y) = eval x + eval y
    toString (Add x y) = "(" ++ toString x ++ " + " ++ toString y ++ ")"

instance (Expr l, Expr r) => Expr (Sub l r) where
    eval (Sub x y) = eval x - eval y
    toString (Sub x y) = "(" ++ toString x ++ " - " ++ toString y ++ ")"

instance (Expr l, Expr r) => Expr (Mult l r) where
    eval (Mult x y) = eval x * eval y
    toString (Mult x y) = "(" ++ toString x ++ " * " ++ toString y ++ ")"
