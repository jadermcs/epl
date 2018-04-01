module Lib
    ( eval
    , getValue
    , Expr(..)
    ) where

data Expr = Add Expr Expr | Literal Int

instance Show Expr where
    show (Literal x) = '!':show x
    show (Add el er) = "(" ++ show el ++ " + " ++ show er ++ ")"

instance Eq Expr where
    Literal x == Literal y = x == y
    Add x y == Add x' y' = getValue x + getValue y == getValue x' + getValue y'

getValue :: Expr -> Int
getValue expr =
    case expr of Literal x -> x
                 Add el er -> getValue el + getValue er

-- | Documentation for 'eval'
eval :: Expr -> Expr
eval (Literal x) = Literal x
eval (Add el er) = Literal (getValue el + getValue er)
