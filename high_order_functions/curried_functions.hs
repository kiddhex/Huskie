multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x*y*z

--compareWithHundred :: (Num a, Ord a) => a -> Ordering
--compareWithHundred x = compare 100 x

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

--(-4) is minus four not substract four (substract 4)
--functions aren't instances of the Show typeclass

