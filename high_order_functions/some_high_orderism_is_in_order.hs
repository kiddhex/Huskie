--applyTwice :: (a -> a) -> a -> a
appyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

--flip' :: (a -> b -> c) -> (b -> a -> c)
--flip' f = g
--    where g x y = f y x

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x 

--map :: (a -> b) -> [a] -> [b]
--map _ [] = []
--map f (x:xs) = f x : map f xs

--map (map (^2)) [[1,2],[3,4,5,6],[7,8]]

--map (+3) [4,5,6,7,8,9] is equivalent to writing
--[x+3 | x <- [4,5,6,7,8,9]] which one you use is up to readability.

--filter :: (a -> Bool) -> [a] -> [a]
--filter p (x:xs)
--    | p x = x : p xs
--    | otherwise = p xs

--quicksort :: (Ord a) -> [a] -> [a]
quicksort (x:xs) =
    let smallerSorted = filter (<=x) xs
        biggerSorted = filter (>x) xs
    in smallerSorted ++ [x] ++ biggerSorted

--largestDivisible :: (Integral a) => a
--largestDivisible = head (filter p [100000,99999 ..])
--    where p x = x `mod` 3829 == 0

--find the sum of the squared odds less than 10'000

--sum (takewhile (<10000) (filter odd (map (^2) [1..])))
--sum (takewhile (<10000) [n^2 | n <- [1..], odd n^2    ])

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n*3 + 1)

numLongChains :: num a
numLongChains = fromIntegral (length (filter isLong (map chain [1..100])))
    where isLong xs = length xs > 15


