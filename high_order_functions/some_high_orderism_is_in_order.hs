applyTwice :: (a -> a) -> a -> a
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