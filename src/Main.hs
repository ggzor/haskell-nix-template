module Main where

import Data.Char
import Lens.Micro

main :: IO ()
main = print $ "Hello World" & each %~ toUpper
