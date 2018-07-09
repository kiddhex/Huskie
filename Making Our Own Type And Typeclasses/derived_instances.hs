data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)
}

--When we derive the EQ instance for a type and then try to compare their values with == and /=, Haskell will see if the value constructors match and then it
--will check if all the data contained inside matches by testing each pair of fields with == and /=

--We can't do Just (*3) > Just (*2) because functions aren't part of the ord typeclass.
--If we compare two values of the same type that were made using different constructors, the value which was defined first is considered smaller.

--Consider the following data type:

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

--because all the values are nullary (take no parameters) we can make this type part of the Enum tc. We can also make it part of the bound tc.
--[minBound..maxBound] :: [Day]
--[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]

--succ Monday
--Tuesday