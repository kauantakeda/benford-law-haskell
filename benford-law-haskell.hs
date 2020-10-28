--Lucas Waki - 147021
--Kauan Takeda - 156104
--Camila


import Data.List

main = do
       contents <- getContents
       let occurrence = countOccurrence contents
       let frequencies = computeFrequency occurrence (computeTotal occurrence)
       putStr (tupleToString frequencies)

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
groupStringByEqualsElements x = group $ sort (x ++ "123456789")

makeOccurrenceTuplesList :: String -> [(String, Int)]
makeOccurrenceTuplesList [] = []
makeOccurrenceTuplesList firstNumbers = map makeOccurrenceTuple $ groupStringByEqualsElements firstNumbers
  where makeOccurrenceTuple (x:xs) = ([x], length (x:xs) - 1)

countOccurrence :: String -> [(String, Int)]
countOccurrence [] = [("", 0)]
countOccurrence text = makeOccurrenceTuplesList $ getFirstNumbers text False
  
computeTotal :: [(String, Int)] -> Int
computeTotal [] = 0
computeTotal (x:xs) = snd x + computeTotal xs

computeFrequency :: [(String, Int)] -> Int -> [(String, Float)]
computeFrequency [] total = []
computeFrequency (x:xs) total = (fst x, fromIntegral (snd x) / fromIntegral total) : computeFrequency xs total

tupleToString :: [(String, Float)] -> String
tupleToString [] = ""
tupleToString (x:xs) = fst x ++ " : " ++ show ( snd x ) ++ "\n" ++ tupleToString xs
