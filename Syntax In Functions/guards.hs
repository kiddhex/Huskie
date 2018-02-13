-- Guards are a way of testing whether some property of a value (or several of them) are true or false.

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're an underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pfffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"

-- While big if else trees are usually frowned upon, sometimes a problem is defined in such a discrete way that
-- you can't get around them. Guards are a very nice alternative for this.
-- Otherwise catches everything.

-- We can use multiple parameters:

bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
    | weight / height ^ 2 <= 18.5 = "You're an underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pfffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT