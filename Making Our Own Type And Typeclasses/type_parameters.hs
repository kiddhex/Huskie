data Maybe a = Nothing | Just a

--we could change our car data type from this

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)

-- to this

data Car a b c = Car { company :: a  
                     , model :: b  
                     , year :: c   
                     } deriving (Show)

--but would we really benefit?

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

--if car was car a b c:

tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

--Don't put type constraints into data declarations even if it makes sense. You'll end up putting it in functions that need it anyway.