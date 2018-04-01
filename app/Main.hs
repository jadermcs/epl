module Main where

import Lib

main :: IO ()
main =
    let a = Add (Literal 3) (Add (Literal 2) (Literal 5)) in
        putStrLn $ show a ++ " = " ++ show (eval a)
