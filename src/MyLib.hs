module MyLib (someFunc) where

import Data.Char (toUpper)
import Lens.Micro

someFunc :: String -> String
someFunc s = s & traversed %~ toUpper
