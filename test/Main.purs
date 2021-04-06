module Test.Main where

import Cnchar (SpellOptions(..), StrokeToWordOptions(..), spell, spellArray, spellToWord, strokeToWord, strokeToWordArray)
import Cnchar.Idiom (IdiomOptions(..), idiom)
import Cnchar.Order (OrderOptions(..), orderToWord, orderToWordArray)
import Cnchar.Radical (radical, radicalArray, radicalArray2)
import Cnchar.Trad (convertSimpleToSpark, convertSimpleToTrad, convertSparkToSimple, convertSparkToTrad, convertTradToSimple, convertTradToSpark)
import Cnchar.Xhy (XhyOptions(..), xhy)
import Data.Array (take)
import Data.String (Pattern(..), contains)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Prelude (Unit, discard, ($))
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  launchAff_
    $ runSpec [ consoleReporter ] do
        describe "Xhy" do
          it "Xhy1"
            $ do
                xhy "大水冲了龙王庙" [] `shouldEqual` [ "大水冲了龙王庙-自家人不识自家人", "大水冲了龙王庙-一家人不认一家人" ]
          it "Xhy2"
            $ do
                xhy "大水" [ Fuzzy ] `shouldEqual` [ "江河里长大水-泥沙俱下", "江河发大水-后浪推前浪", "江河发大水-一浪高一浪", "发大水出丧-天灾人祸", "大水缸里捞芝麻-难上加难", "大水缸里捞芝麻-难上难", "大水冲了菩萨-绝妙", "大水冲了龙王庙-自家人不识自家人", "大水冲了龙王庙-一家人不认一家人", "大水冲崩关帝庙-慌了神" ]
          it "Xhy3"
            $ do
                xhy "大水" [ Fuzzy, Answer ] `shouldEqual` [ "泥沙俱下", "后浪推前浪", "一浪高一浪", "天灾人祸", "难上加难", "难上难", "绝妙", "自家人不识自家人", "一家人不认一家人", "慌了神" ]
          it "Xhy4"
            $ do
                xhy "上晃下摇" [ Fuzzy, Answer, Second ] `shouldEqual` [ "醉汉过铁索桥", "扶着醉汉过破桥" ]
        describe "Radical" do
          it "Radical1"
            $ do
                radical "你" `shouldEqual` "亻"
          it "Radical2"
            $ do
                radical "你好呀" `shouldEqual` "亻女口"
          it "Radical3"
            $ do
                radicalArray [ "你", "好", "呀" ] `shouldEqual` [ "亻", "女", "口" ]
          it "Radical4"
            $ do
                radicalArray2 "你好呀" `shouldEqual` [ "亻", "女", "口" ]
        describe "Idiom" do
          it "Idiom1"
            $ do
                take 5 (idiom "shang" [ Spell ]) `shouldEqual` [ "伤风败化", "伤风败俗", "伤弓之鸟", "伤化败俗", "伤教败俗" ]
          it "Idiom2"
            $ do
                take 5 (idiom "shang4" [ Spell, IdiomTone ]) `shouldEqual` [ "上兵伐谋", "上不着天，下不着地", "上谄下渎", "上窜下跳", "上当学乖" ]
        describe "Trad" do
          it "Trad1"
            $ do
                convertSimpleToTrad "一个人" `shouldEqual` "一個人"
          it "Trad2"
            $ do
                convertSimpleToSpark "一个人" `shouldEqual` "①个亾"
          it "Trad3"
            $ do
                convertTradToSimple "一個人" `shouldEqual` "一个人"
          it "Trad4"
            $ do
                convertTradToSpark "一個人" `shouldEqual` "①个亾"
          it "Trad5"
            $ do
                convertSparkToSimple "①个亾" `shouldEqual` "一个人"
          it "Trad6"
            $ do
                convertSparkToTrad "①个亾" `shouldEqual` "一個人"
        describe "Spell" do
          it "Spell1"
            $ do
                spell "测试" [] `shouldEqual` "CeShi"
          it "Spell2"
            $ do
                spell "测试" [ Up ] `shouldEqual` "CESHI"
          it "Spell3"
            $ do
                spell "测试" [ Low ] `shouldEqual` "ceshi"
          it "Spell4"
            $ do
                spell "测试" [ First ] `shouldEqual` "CS"
          it "Spell5"
            $ do
                spell "测试" [ First, Low ] `shouldEqual` "cs"
          it "Spell6"
            $ do
                spellArray "测试" [] `shouldEqual` [ "Ce", "Shi" ]
          it "Spell7"
            $ do
                spellArray "测试" [ First, Low ] `shouldEqual` [ "c", "s" ]
          it "Spell8"
            $ do
                spell "测试" [ SpellTone ] `shouldEqual` "CèShì"
          it "Spell9"
            $ do
                spell "长大了" [ SpellPoly ] `shouldEqual` "(Zhang|Chang)(Da|Dai)(Le|Liao)"
          it "SpellToWord1"
            $ do
                spellToWord "shàng" [] `shouldEqual` "上尚绱鞝"
          it "SpellToWord2"
            $ do
                spellToWord "lv2" [] `shouldEqual` "驴闾榈驢閭櫚"
          it "StrokeToWord1"
            $ do
                contains (Pattern "鬣馕囔戆攮纛饞躥顱籮蠻廳灣鑲鑰") (strokeToWord 25 []) `shouldEqual` true
          it "StrokeToWord2"
            $ do
                contains (Pattern "鬣馕囔戆攮纛") (strokeToWord 25 [ StrokeToWordSimple ]) `shouldEqual` true
          it "StrokeToWord3"
            $ do
                strokeToWordArray 1 [] `shouldEqual` [ "一", "乙" ]
        describe "SpellOrder" do
          it "SpellOrder1"
            $ do
                spell "長大" [] `shouldEqual` "ZhangDa"
          it "SpellOrder2"
            $ do
                spell "長大" [ SpellSimple ] `shouldEqual` "長Da"
        describe "Order" do
          it "Order1"
            $ do
                orderToWord [ "横", "撇", "捺" ] [] `shouldEqual` "丈大"
          it "Order2"
            $ do
                orderToWord [ "横", "撇", "捺" ] [ Start ] `shouldEqual` "丈大太犬夯夸夺夼奁奄奈奋奔态奎耷套奢瓠鹩奪奮遼"
          it "Order3"
            $ do
                orderToWord [ "横", "撇", "捺" ] [ Start, OrderSimple ] `shouldEqual` "丈大太犬夯夸夺夼奁奄奈奋奔态奎耷套奢瓠鹩"
          it "Order4"
            $ do
                contains (Pattern "丈大仄兮") (orderToWord [ "横", "撇", "捺" ] [ Match ]) `shouldEqual` true
          it "Order5"
            $ do
                contains (Pattern "丈大仄友") (orderToWord [ "横", "撇", "捺" ] [ Matchorder ]) `shouldEqual` true
          it "Order6"
            $ do
                contains (Pattern "丈大天太") (orderToWord [ "横", "撇", "捺" ] [ Contain ]) `shouldEqual` true
          it "Order7"
            $ do
                orderToWordArray [ "横", "撇", "捺" ] [] `shouldEqual` [ "丈", "大" ]
