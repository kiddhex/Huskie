lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number seven"
lucky x = "Sorry, no luck."

sayMe :: (Integral a) => a -> String
sayMe 1 = "Un!"
sayMe 2 = "Deux!"
sayMe 3 = "Trois!"
sayMe 4 = "Quatre!"
sayMe 5 = "Cinq!"
sayMe x = "C'est pas entre un et cinq!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- charName 'h' will yield an error. Always include a catch-all pattern for unexpected values.

-- without pattern matching:
-- addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
-- addVectors a b = (fst a + fst b, snd a + snd b)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- boomBang :: (Enum a, Num a) => [a] -> [Char]
-- boomBang x = "always"

head' :: [a] -> a
head' [] = error "Can't call head on empty."
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long The first two elements are " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

initials :: String -> String -> String
initials (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h| (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

--There's also a thing called as patterns. Those are a handy way of breaking something up according to a pattern and binding it to names whilst
--keeping a reference to the whole thing. You do that by putting an @ in front of a pattern. For instance xs@(x:y:ys). This pattern will match
--the same thing as x:y:ys but you can easily get the whole list via xs instead of x:y:ys.

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

