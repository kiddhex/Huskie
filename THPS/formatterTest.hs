import Formatter

runTests :: Bool
runTests = transactionDateTimeTest && prefixTest && documentIdTest && transactionDateTest && transactionOutputIdLengthTest && secondToLastLineNumberLengthTest && numberOfTransactionsTest && transactionDateLengthTest && tbtTotalLengthTest && lastLineNumberTest && creditTotalTest && totalCreditLengthTest && testGrandTotalLength && documentationVersionTest && testLocationName && locationAddressTest && locationCityTest && regionCodeTest && countryCodeTest && testReferenceNumber && zipCodeTest && tfhHeaderLengthTest && bodyFormatterTest && tbtFooterLengthTest && tabFormatterLengthTest && taaFormatterLengthTest && tfsFooterLengthTest

documentationVersionTest :: Bool
documentationVersionTest = (length documentationVersion) == 8

testReferenceNumber :: Bool
testReferenceNumber = length referenceNumber == 30

testLocationName :: Bool
testLocationName = length locationName == 38

tfhHeaderLengthTest :: Bool
tfhHeaderLengthTest = (length $ insertTfhHeader "four") == 704

tbtFooterLengthTest :: Bool
tbtFooterLengthTest = (length $ insertTbtFooter "four") == 704

tfsFooterLengthTest :: Bool
tfsFooterLengthTest = (length $ insertTfsFooter "four") == 704

tabFormatterLengthTest :: Bool
tabFormatterLengthTest = (length $ tabFormatter 3 "3") == 686

taaFormatterLengthTest :: Bool
taaFormatterLengthTest = (length $ taaFormatter 3) == 700

bodyFormatterTest :: Bool
bodyFormatterTest = (length $ bodyFormatter (3, "3")) == 1386

documentIdTest :: Bool
documentIdTest = length documentId == 9

prefixTest :: Bool
prefixTest = length prefix == 21

creditTotalTest :: Bool
creditTotalTest = length creditTotal == 8

transactionDateTimeTest :: Bool
transactionDateTimeTest = length transactionDateTime == 14

testGrandTotalLength :: Bool
testGrandTotalLength = length grandTotal == 20

tbtTotalLengthTest :: Bool
tbtTotalLengthTest = length tbtTotal == 20

totalCreditLengthTest :: Bool
totalCreditLengthTest = length totalCredit == 20

numberOfTransactionsTest :: Bool
numberOfTransactionsTest = length numberOfTransactions == 8

transactionDateLengthTest :: Bool
transactionDateLengthTest = length transactionDate == 8

lastLineNumberTest :: Bool
lastLineNumberTest = length lastLineNumber == 8

secondToLastLineNumberLengthTest :: Bool
secondToLastLineNumberLengthTest = length secondToLastLineNumber == 8

transactionOutputIdLengthTest :: Bool
transactionOutputIdLengthTest = length transactionOutputId == 15

transactionDateTest :: Bool
transactionDateTest = length transactionDate == 8

countryCodeTest :: Bool
countryCodeTest = length countryCode == 3

zipCodeTest :: Bool
zipCodeTest = length zipCode == 15

locationAddressTest :: Bool
locationAddressTest = length locationAddress == 38

locationCityTest :: Bool
locationCityTest = length locationCity == 21

regionCodeTest :: Bool
regionCodeTest = length regionCode == 3