numLongChains :: Int
numLongChains = length (filter (\xs-> length xs > 15) map chain [1..100])

addThree :: (Num a) => a -> a -> a
addThree = \x -> \y -> \z -> x + y + z 
--(gimmick to illustrate currying)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x