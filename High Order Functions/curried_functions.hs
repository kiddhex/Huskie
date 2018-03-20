multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- when we do multThree 3 5 9 or ((multThree 3) 5) 9 . First 3 is applied to multThree that takes one parameter and returns a function. So then 5 is applied 
-- to that, which creates a function that will take a parameter and multiply it by 15s

-- let multTwoWithNine = multThree 9

-- let multWithEighteen = multTwoWithNine 2

-- compareWithHundred :: (Num a, Ord a) => a -> Ordering
-- compareWithHundred x = compare 100 x

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)