module Cnchar.Idiom where

import Prelude (map)

data IdiomOptions
  = Char
  | IdiomStroke
  | Spell
  | IdiomTone

idiomOptionsToString :: IdiomOptions -> String
idiomOptionsToString = case _ of
  Char -> "char"
  IdiomStroke -> "stroke"
  Spell -> "spell"
  IdiomTone -> "tone"

-- | Use this over the underscore version
idiom :: String -> Array IdiomOptions -> Array String
idiom word opts = _idiom word (map idiomOptionsToString opts)

-- | Use this over the underscore version
idiomArray :: Array String -> Array IdiomOptions -> Array String
idiomArray word opts = _idiomArray word (map idiomOptionsToString opts)

foreign import _idiom :: String -> Array String -> Array String

foreign import _idiomArray :: Array String -> Array String -> Array String
