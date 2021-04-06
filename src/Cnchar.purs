module Cnchar where

import Prelude (map)

data SpellOptions
  = Up
  | Low
  | First
  | SpellTone
  | SpellPoly
  | SpellSimple

spellOptionsToString :: SpellOptions -> String
spellOptionsToString = case _ of
  Up -> "up"
  Low -> "low"
  First -> "first"
  SpellTone -> "tone"
  SpellPoly -> "poly"
  SpellSimple -> "simple"

-- | Use this over the underscore version
spell :: String -> Array SpellOptions -> String
spell word opts = _spell word (map spellOptionsToString opts)

-- | Use this over the underscore version
spellArray :: String -> Array SpellOptions -> Array String
spellArray word opts = _spellArray word (map spellOptionsToString opts)

foreign import _spell :: String -> Array String -> String

foreign import _spellArray :: String -> Array String -> Array String

data SpellToWordOptions
  = SpellToWordSimple
  | Trad
  | SpellToWordPoly
  | Alltone

spellToWordOptionsToString :: SpellToWordOptions -> String
spellToWordOptionsToString = case _ of
  SpellToWordSimple -> "simple"
  Trad -> "trad"
  SpellToWordPoly -> "poly"
  Alltone -> "tone"

-- | Use this over the underscore version
spellToWord :: String -> Array SpellToWordOptions -> String
spellToWord word opts = _spellToWord word (map spellToWordOptionsToString opts)

-- | Use this over the underscore version
spellToWordArray :: String -> Array SpellToWordOptions -> String
spellToWordArray word opts = _spellToWordArray word (map spellToWordOptionsToString opts)

foreign import _spellToWord :: String -> Array String -> String

foreign import _spellToWordArray :: String -> Array String -> String

data StrokeToWordOptions
  = StrokeToWordSimple
  | StrokeToWordTrad

strokeToWordOptionsToString :: StrokeToWordOptions -> String
strokeToWordOptionsToString = case _ of
  StrokeToWordSimple -> "simple"
  StrokeToWordTrad -> "trad"

-- | Use this over the underscore version
strokeToWord :: Int -> Array StrokeToWordOptions -> String
strokeToWord num strokeToWordOptions = _strokeToWord num (map strokeToWordOptionsToString strokeToWordOptions)

-- | Use this over the underscore version
strokeToWordArray :: Int -> Array StrokeToWordOptions -> Array String
strokeToWordArray num strokeToWordOptions = _strokeToWordArray num (map strokeToWordOptionsToString strokeToWordOptions)

foreign import _strokeToWord :: Int -> Array String -> String

foreign import _strokeToWordArray :: Int -> Array String -> Array String
