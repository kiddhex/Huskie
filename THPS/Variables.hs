module Variables where

price :: Int
price = 1983

documentationVersion :: String
documentationVersion = "someRandomString"

taaRegistryNum :: String
taaRegistryNum = "someRandomString"

billingCode :: String
billingCode = "someRandomString"

approvalCode :: String
approvalCode = "someRandomString"

cardValidTo :: String
cardValidTo = "someRandomString"

documentId :: String
documentId = "someRandomString"

transactionDateTime :: String
transactionDateTime = "someRandomString"

transactionDate :: String
transactionDate = take 8 transactionDateTime

transactionTime :: String
transactionTime = drop 8 transactionDateTime

creditTotal :: String
creditTotal = "someRandomString"

firstLineNumber :: String
firstLineNumber = "someRandomString"

tbtSign :: String
tbtSign = "someRandomString"

totalCredit :: String
totalCredit = "someRandomString"

transactionOutputId :: String
transactionOutputId = "someRandomString"

chargeAmountInCents :: String
chargeAmountInCents = "someRandomString"

processingCode :: String
processingCode = "someRandomString"

countryCurrencyCode :: String
countryCurrencyCode = "someRandomString"

sharePlanDataCode :: String
sharePlanDataCode = "someRandomString"

providerId :: String
providerId = "someRandomString"

posDataCode :: String
posDataCode = "someRandomString"

attachmentTypeCode :: String
attachmentTypeCode = "someRandomString"

emitterId :: String
emitterId = "someRandomString"

referenceNumber :: String
referenceNumber = "someRandomString"

locationName :: String
locationName = "someRandomString"

locationAddress :: String
locationAddress = "someRandomString"

locationCity :: String
locationCity = "someRandomString"

regionCode :: String
regionCode = "someRandomString"

countryCode :: String
countryCode = "someRandomString"

zipCode :: String
zipCode = "someRandomString"

cards :: [String]
cards = []