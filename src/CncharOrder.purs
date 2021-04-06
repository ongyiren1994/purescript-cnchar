module Cnchar.Order where

import Prelude (map)

data OrderOptions
  = Start
  | OrderSimple
  | Match
  | Matchorder
  | Contain

orderOptionsToString :: OrderOptions -> String
orderOptionsToString = case _ of
  Start -> "start"
  OrderSimple -> "simple"
  Match -> "match"
  Matchorder -> "matchorder"
  Contain -> "contain"

-- | Use this over the undescore version
orderToWord :: Array String -> Array OrderOptions -> String
orderToWord word opts = _orderToWord word (map orderOptionsToString opts)

-- | Use this over the underscore version
orderToWordArray :: Array String -> Array OrderOptions -> Array String
orderToWordArray word opts = _orderToWordArray word (map orderOptionsToString opts)

foreign import _orderToWordArray :: Array String -> Array String -> Array String

foreign import _orderToWord :: Array String -> Array String -> String
