sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map' :: (a -> b) -> a -> b
map' f xs = foldr (\x acc -> f x : acc) [] xs

--we coud also use a left fold, the thing is that ++ is 
--more expensive

--right folds work on infinite lists, left folds dont Folds can be used to implement any function where you traverse a list once, element by element, and then  return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold

--When making a fold think about the empty list. If it doesn't make sense when given an empty list you can probably use a foldl1 or foldr1 to implement it

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

boomBang :: (Num a) => [a] -> String
boomBang = foldl (\acc x -> if x `mod` 15 == 0 then "boomBang" : acc else if x `mod` 3 == 0 then "boom" : acc else if x `mod` 5 == 0 then "bang" : acc else show x : acc) "" 