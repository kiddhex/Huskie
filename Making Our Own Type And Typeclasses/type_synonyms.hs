--Here's how the standard library defines string as a synonym for [Char]

type String = [Char]

phoneBook :: [(String, String)]
phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

type PhoneBook = [(String, String)]
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

--Giving the String type synonyms is something that Haskell programmers do when they want to convery more information about what strings in their functions should
--be used as and what they represent

--So now, when we implement a function that takes a name and a number and sees if that name and number combo is in our phonebook. We can give it a very
--pretty and descriptive type declaration:

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, number) `elem` pbook

data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

--Nothing does not convey a lot of information other than something has failed. That's fine for functions that only fall one way or if we're just not interested
--in how and what failed. When we're interested in how some function failed or why we use Either a b. Where a is some sort of type that can tell us something
--about the possible failure and b is the type of a successfull computation. Hence errors use the Left value constructor while results use Right