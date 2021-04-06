module Cnchar.Xhy where

import Prelude (map)

data XhyOptions
  = Fuzzy
  | Answer
  | Second

xhyOptionsToString :: XhyOptions -> String
xhyOptionsToString = case _ of
  Fuzzy -> "fuzzy"
  Answer -> "answer"
  Second -> "second"

-- | Use this over the undescore version
xhy :: String -> Array XhyOptions -> Array String
xhy word opts = _xhy word (map xhyOptionsToString opts)

foreign import _xhy :: String -> Array String -> Array String
