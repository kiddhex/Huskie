module Formatter (module Variables, module Formatter) where
import Variables

numberOfCards :: Int
numberOfCards = length cards

nummer :: [Int]
nummer = [x*2 | x<-[1..(length cards)]] --the register number (associated with line number)

setZerosFor :: (Num a, Show a) => a -> Int -> [a]
setZerosFor number amount = take (amount - length(show number)) (repeat 0)

listToString :: (Show a) => [a] -> String
listToString [] = ""
listToString (x:xs) = show x ++ (listToString xs)

insertZeros :: Int -> Int -> String
insertZeros x y = (listToString $ setZerosFor x y) ++ show x

tabConstantAdder :: String -> String
tabConstantAdder x = "TAB" ++ x

taaConstantAdder :: String -> String
taaConstantAdder x = "TAA" ++ x

tfhConstantAdder :: String -> String
tfhConstantAdder x = "TFH" ++ x

tbtConstantAdder :: String -> String
tbtConstantAdder x = "TBT" ++ x

getFileName :: String
getFileName = "filename" ++ transactionDate ++ "_" ++ transactionTime

tabFormatter :: Int -> String -> String
tabFormatter x y = tabConstantAdder $ insertZeros x 8 ++ insertZeros 0 15 ++ taaRegistryNum ++ billingCode ++ blankSpaces 2 ++ blankSpaces 10 ++ approvalCode ++ y ++ blankSpaces 4 ++ cardValidTo ++ transactionDateTime ++ insertZeros 0 3 ++ chargeAmountInCents ++ processingCode ++ countryCurrencyCode ++ sharePlanDataCode ++ providerId ++ providerLocation ++ providerContactInformation ++ terminalId ++ posDataCode ++ insertZeros 0 3 ++ insertZeros 0 12 ++ blankSpaces 3 ++ referenceNumber ++ blankSpaces 451

taaFormatter :: Int -> String
taaFormatter x = taaConstantAdder $ insertZeros x 8 ++ transactionOutputId ++ blankSpaces 2 ++ attachmentTypeCode ++ locationName ++ locationAddress ++ locationCity ++ regionCode ++ countryCode ++ zipCode ++ blankSpaces 4 ++ blankSpaces 548

insertTfhHeader :: String -> String
insertTfhHeader string = tfhConstantAdder $ firstLineNumber ++ emitterId ++ blankSpaces 21 ++ documentId ++ "000000000" ++ transactionDateTime ++ documentationVersion ++ blankSpaces 617 ++ string

insertTbtFooter :: String -> String
insertTbtFooter string = string ++ (tbtConstantAdder $ secondToLastLineNumber ++ providerId ++ blankSpaces 15  ++ transactionOutputId ++ transactionDate ++ numberOfTransactions ++insertZeros 0 3 ++ tbtTotal ++ tbtSign ++ countryCurrencyCode ++ insertZeros 0 23 ++ blankSpaces 3 ++ blankSpaces 8 ++ blankSpaces 567)

insertTfsFooter :: String -> String
insertTfsFooter string = string ++ "TFS" ++ lastLineNumber ++ numberOfTransactions ++ insertZeros 0 3 ++ tbtTotal ++ creditTotal ++ insertZeros 0 3 ++ totalCredit ++ insertZeros 0 3 ++ grandTotal ++ blankSpaces 604

bodyFormatter :: (Int, String) -> String
bodyFormatter (x, y) = (tabFormatter x y) ++ taaFormatter(x+1)

folder :: Foldable t => t [Char] -> [Char]
folder = foldl (\acc x-> acc ++ x) ""

blankSpaces :: Int -> String
blankSpaces integer = take integer (repeat ' ')

secondToLastLineNumber :: String
secondToLastLineNumber = insertZeros (length cards * 2 + 2) 8

lastLineNumber :: String
lastLineNumber = insertZeros (length cards * 2 + 3) 8

providerLocation :: String
providerLocation = blankSpaces 15

providerContactInformation :: String
providerContactInformation = blankSpaces 40

terminalId :: String
terminalId = blankSpaces 8

numberOfTransactions :: String
numberOfTransactions = insertZeros numberOfCards 8

tbtTotal :: String
tbtTotal = insertZeros (numberOfCards * price * 100) 20

grandTotal :: String
grandTotal = insertZeros ((read totalCredit) + (read tbtTotal)) 20

calc :: String
calc = insertTfsFooter $ insertTbtFooter $ insertTfhHeader $ folder $ map bodyFormatter $ zip nummer cards

createFile :: IO ()
createFile = writeFile getFileName $ show calc