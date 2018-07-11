data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

--or record syntax:
--data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)

-- fixit:
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

--this is how ++ is defined for normal lists:
-- infixr 5 ++
-- (++) :: [a] -> [a] -> [a]
-- []     ++ ys = ys
-- (x:xs) ++ ys = x : (xs ++ ys)

--For our list:
infixr 5 .++
(.++) :: List -> List -> List
Empty      .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)