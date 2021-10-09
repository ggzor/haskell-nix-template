module MyLibTest where

import MyLib
import Test.Hspec as H

spec :: H.Spec
spec = do
  describe "someFunc" $ do
    it "returns uppercase parameter name" $ do
      someFunc "someFunc" `shouldBe` "SOMEFUNC"
