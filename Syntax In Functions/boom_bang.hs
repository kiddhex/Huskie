boomBang :: (Show a, Integral a) => [a] -> String
boomBang [] = "esto"
boomBang (x:xs)
    | x `mod` 15 == 0 = "boomBang" ++ boomBang xs
    | x `mod` 3 == 0 = "boom" ++ boomBang xs
    | x `mod` 5 == 0 = "bang" ++ boomBang xs
    | otherwise = show x ++ boomBang xs