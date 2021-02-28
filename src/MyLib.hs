module MyLib (someFunc) where

import Data.Char (toUpper)
import Lens.Micro

someFunc :: IO ()
someFunc = putStrLn $ "someFunc" & traversed %~ toUpper
