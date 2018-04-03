import Test.Hspec            (Spec, describe, it, shouldBe, shouldNotBe)
import Test.Hspec.Runner     (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck

import Lib
import Properties

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = do
    describe "Evaluate" $ do
        let a = Add (Add (Literal 4) (Literal 2)) (Literal 7)
        let b = "((!4 + !2) + !7)"
        let c = Add a (Literal 9)

        it "can [show] correct evaluated string." $
            toString a `shouldBe` b

        it "can evaluate for the correct literal." $
            eval a `shouldBe` 13

        it "can compose from subexpressions with correct value." $ do
            let value = eval c
            value `shouldBe` 22
            toString c `shouldBe` ("(" ++ b ++ " + !9)")

    describe "Ring Properties" $ do

        it "has commutative property." $ property
            evalCommutes

        it "has a neutral element." $ property
            evalNeutralElement


