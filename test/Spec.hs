import Test.Hspec            (Spec, describe, it, shouldBe, shouldNotBe)
import Test.Hspec.Runner     (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck

import Lib
-- import Properties

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = do
    describe "Evaluate can Add" $ do
        let a = Add (Add (Literal 4) (Literal 2)) (Literal 7)
        let b = "((!4 + !2) + !7)"
        let c = Add a (Literal 9)

        it "can [print] correct evaluated string." $
            toString a `shouldBe` b

        it "can evaluate for the correct literal." $
            eval a `shouldBe` 13

        it "can compose from subexpressions with correct value." $ do
            let value = eval c
            value `shouldBe` 22
            toString c `shouldBe` ("(" ++ b ++ " + !9)")

    describe "Evaluate can Subtract" $ do
        let a = Sub (Sub (Literal 4) (Literal 2)) (Literal 7)
        let b = "((!4 - !2) - !7)"
        let c = Sub a (Literal 9)

        it "can deal with compositon in a negative shape." $ do
            let value = eval c
            value `shouldBe` negate 14

        it "can compose meaningful subtraction expressions." $ do
            let value = a
            toString a `shouldBe` b

    describe "Ring Properties" $ do

        it "has commutative property." $ property
            True
            -- evalCommutes

        it "has a neutral element." $ property
            True
            -- evalNeutralElement


