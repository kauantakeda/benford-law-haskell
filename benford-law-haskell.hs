--Kauan Takeda - 156104
--Waki
--Camila

import Data.List

isNumberOrDot :: Char -> Bool
isNumberOrDot x = x `elem` "1234567890."

isZeroOrDot :: Char -> Bool
isZeroOrDot x = x `elem` "0."

getFirstNumbers :: String -> Bool -> String
getFirstNumbers [] y = ""
getFirstNumbers [x] alreadyGot = if (isNumberOrDot x) && (not (isZeroOrDot x || alreadyGot))
                                    then [x]
                                  else
                                    ""
getFirstNumbers (x:xs) alreadyGot = if isNumberOrDot x
                                      then
                                        if not (isZeroOrDot x || alreadyGot)
                                          then x : getFirstNumbers xs True
                                        else
                                          getFirstNumbers xs alreadyGot
                                    else
                                      getFirstNumbers xs False

groupStringByEqualsElements :: String -> [String]
groupStringByEqualsElements [] = []
groupStringByEqualsElements x = group $ sort x

countOccurrence :: String -> [(String, Int)]
countOccurrence [] = [("", 0)]
countOccurrence text = map makeOccurrenceTuples $ groupStringByEqualsElements $ getFirstNumbers text False
  where makeOccurrenceTuples (x:xs) = ([x], length (x:xs))
