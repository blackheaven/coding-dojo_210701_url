module UrlSpec (spec) where

import Test.Hspec
import Universum
import Url

spec :: Spec
spec = do
  describe "matchingUrl" $ do
    it "'invoices' should match '/invoices' (full prefix matching)" $
      matchingUrl (mkPattern "invoices") (mkUrl "/invoices") `shouldBe` True
    it "'invoics' should not match '/invoices' (typo)" $
      matchingUrl (mkPattern "invoics") (mkUrl "/invoices") `shouldBe` False
    it "'inv' should match '/invoices' (partial prefix matching)" $
      matchingUrl (mkPattern "inv") (mkUrl "/invoices") `shouldBe` True
    it "'invoices, products' should match '/invoices/products' (multiple parts matching)" $
      matchingUrl (mkPattern "invoices, products") (mkUrl "/invoices/products") `shouldBe` True
    it "'inv, prod should match '/invoices/products' (multiple parts partial matching)" $
      matchingUrl (mkPattern "inv, prod") (mkUrl "/invoices/products") `shouldBe` True
    it "'inv, pord should not match '/invoices/products' (multiple parts partial typo matching)" $
      matchingUrl (mkPattern "inv, pord") (mkUrl "/invoices/products") `shouldBe` False
  -- it "'invoices, products' should match '/invoices/42/products' (multiple parts sparse matching)" $
  --   matchingUrl (mkPattern "invoices, products") (mkUrl "/invoices/42/products") `shouldBe` True
  describe "mkUrl" $ do
    it "'/invoices' should be equivalent to ['invoices'']" $
      mkUrl "/invoices" `shouldBe` mkUrl "invoices"
