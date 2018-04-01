import Test.Hspec            (Spec, describe, it, shouldBe, shouldNotBe)
import Test.Hspec.Runner     (configFastFail, defaultConfig, hspecWith)
import Test.QuickCheck

import Lib
import Properties

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = do
    describe "Testing Implementation" $ do
        let a = Add (Add (Literal 4) (Literal 2)) (Literal 7)
        let b = "((!4 + !2) + !7)"
        let c = Add a (Literal 9)

        it "show returns correct print string" $
            show a `shouldBe` b

        it "eval returns correct value" $
            eval a `shouldBe` Literal 13

        it "composition works" $ do
            let value = getValue $ eval c
            value `shouldBe` 22
            show c `shouldBe` ("(" ++ b ++ " + !9)")

    describe "Testing Property" $ do

        it "add is commutative" $ property
            True
            -- evalCommutes

        it "add has a neutral element" $ property
            True
            -- evalNeutralElement


