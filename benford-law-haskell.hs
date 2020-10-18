--Kauan Takeda - 156104
--Waki
--Camila

import Data.List

isNumberOrDot :: Char -> Bool
isNumberOrDot x = x `elem` "1234567890."

isLastNumber :: Char -> Char -> Bool
isLastNumber actualChar nextChar = if (isNumberOrDot actualChar) && (not (isNumberOrDot nextChar))
                                          then True
                                        else
                                          False

getLastNumbers :: String -> Char -> String
getLastNumbers [] nextChar = ""
getLastNumbers [x] nextChar = if isNumberOrDot x
                              then [x]
                            else
                              ""
getLastNumbers (x:xs) nextChar = if isLastNumber x nextChar
                                      then x : getLastNumbers xs (xs !! 1)
                                    else
                                      getLastNumbers xs (xs !! 1)

getFirstNumbers :: String -> String
getFirstNumbers [] = ""
getFirstNumbers [x] = if isNumberOrDot x
                        then [x]
                      else
                        ""
getFirstNumbers text = reverse $ getLastNumbers (reverse text) ((reverse text) !! 1)

groupStringByEqualsElements :: String -> [String]
groupStringByEqualsElements [] = []
groupStringByEqualsElements x = group $ sort x

countOccurrence :: String -> [(String, Int)]
countOccurrence [] = [("", 0)]
countOccurrence text = map makeOccurrenceTuples $ groupStringByEqualsElements $ getFirstNumbers text
  where makeOccurrenceTuples (x:xs) = ([x], length (x:xs))