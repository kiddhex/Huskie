--Association lists (also called dictionaries) are lists that are used to store key-value pairs
--where ordering doesn't matter. Eg. a phone directory:

phoneBook =
	[("sypha", "555-2938")
	,("bonnie", "555-3232")
	,("alucard", "555-5555")
	,("leon", "555-5454")
	,("richter", "395-5939")
	,("nick", "293-4954")
	]

--Let's make a function that looks up some value given a key:

--findKey :: (Eq k) => k -> [(k,v)] -> v
--findKey key xs = snd . head . filter (\(k, v) -> k == key) $ xs

--This implementation will crash when no key is found. Let's use the Maybe data type,
--if no key is found we'll return Nothing:

--findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
--findKey key [] = Nothing
--findKey key ((k,v):xs) = if key == k 
--							then Just v
--							else findKey key xs

--This is a textbook recursive function that operates on a list. Edge case, splitting head
--and a tail, recursive calls. The classic fold pattern, so let's see how it would be implemented
--as such:

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

--We just implemented the lookup function from Data.List. We have to tranverse the list to find
--an element. Association lists or maps from Data.Map are much faster because they are 
--implemented using trees. From now on we'll say we're working with maps instead of association
--lists.

--Because Data.Map exports functions that clash with the Prelude and Data.List ones, we'll do
--a qualified import:

import qualified Data.Map as Map


