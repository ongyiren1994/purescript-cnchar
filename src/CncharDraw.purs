module Cnchar.Draw where

import Prelude (Unit)
import Data.Functor.Contravariant (cmap)
import Data.Options (Options, Option, opt)
import Data.Options as Opt
import Effect (Effect)
import Foreign (Foreign)

data DrawOptions

data LineOptions

data AnimationOptions

data StyleOptions

data TestOptions

el :: Option DrawOptions String
el = opt "el"

_type' :: Option DrawOptions String
_type' = opt "type"

clear :: Option DrawOptions Boolean
clear = opt "clear"

style :: Option DrawOptions (Options StyleOptions)
style = cmap Opt.options (opt "style")

backgroundColor :: Option StyleOptions String
backgroundColor = opt "backgroundColor"

showOutline :: Option StyleOptions Boolean
showOutline = opt "showOutline"

showCharacter :: Option StyleOptions Boolean
showCharacter = opt "showCharacter"

currentColor :: Option StyleOptions String
currentColor = opt "currentColor"

length :: Option StyleOptions Number
length = opt "length"

padding :: Option StyleOptions Number
padding = opt "padding"

outlineColor :: Option StyleOptions String
outlineColor = opt "outlineColor"

strokeColor :: Option StyleOptions String
strokeColor = opt "strokeColor"

radicalColor :: Option StyleOptions String
radicalColor = opt "radicalColor"

strokeFadeDuration :: Option StyleOptions Number
strokeFadeDuration = opt "strokeFadeDuration"

line :: Option DrawOptions (Options LineOptions)
line = cmap Opt.options (opt "line")

lineStraight :: Option LineOptions Boolean
lineStraight = opt "lineStraight"

lineCross :: Option LineOptions Boolean
lineCross = opt "lineCross"

lineWidth :: Option LineOptions Number
lineWidth = opt "lineWidth"

lineColor :: Option LineOptions String
lineColor = opt "lineColor"

lineDash :: Option LineOptions Boolean
lineDash = opt "lineDash"

border :: Option LineOptions Boolean
border = opt "border"

borderWidth :: Option LineOptions Number
borderWidth = opt "borderWidth"

borderColor :: Option LineOptions String
borderColor = opt "borderColor"

borderDash :: Option LineOptions Boolean
borderDash = opt "borderDash"

animation :: Option DrawOptions (Options AnimationOptions)
animation = cmap Opt.options (opt "animation")

strokeAnimationSpeed :: Option AnimationOptions Number
strokeAnimationSpeed = opt "strokeAnimationSpeed"

delayBetweenStrokes :: Option AnimationOptions Number
delayBetweenStrokes = opt "delayBetweenStrokes"

delayBetweenLoops :: Option AnimationOptions Number
delayBetweenLoops = opt "delayBetweenLoops"

autoAnimate :: Option AnimationOptions Boolean
autoAnimate = opt "autoAnimate"

stepByStep :: Option AnimationOptions Boolean
stepByStep = opt "stepByStep"

loopAnimate :: Option AnimationOptions Boolean
loopAnimate = opt "loopAnimate"

test :: Option DrawOptions (Options TestOptions)
test = cmap Opt.options (opt "test")

strokeHighlightSpeed :: Option TestOptions Number
strokeHighlightSpeed = opt "strokeHighlightSpeed"

highlightColor :: Option TestOptions Number
highlightColor = opt "hightlightColor"

drawingColor :: Option TestOptions Number
drawingColor = opt "drawingColor"

drawingWidth :: Option TestOptions Number
drawingWidth = opt "drawingWidth"

showHintAfterMisses :: Option TestOptions Number
showHintAfterMisses = opt "showHintAfterMisses"

highlightOnComplete :: Option TestOptions Number
highlightOnComplete = opt "highlightOnCmomplete"

highlightCompleteColor :: Option TestOptions Number
highlightCompleteColor = opt "highlightCompleteColor"

-- | Use this over the underscore version
draw :: String -> Options DrawOptions -> Effect Unit
draw word opts = _draw word (Opt.options opts)

foreign import _draw :: String -> Foreign -> Effect Unit
