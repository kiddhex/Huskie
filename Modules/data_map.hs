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

--Here's a basic rundown of its functions:

--1. fromList:
--Map.fromList :: (Ord k) => [(k,v)] -> Map.Map k v

--It needs keys to be orderable so it can arrange them in a tree
--You should always use Data.Map for key-value associations unless you have keys which can't
--be ordered.

--2. empty represents an empty map. It takes no arguments, it just returns an empty map.
--3. insert takes a key, a value and a map and returns a new map with the new values inserted:
--Map.insert 3 100 Map.empty
--fromList [(3, 100)]

--We can implement our own fromList using the empty map, insert and a fold:

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty

--4. null checks if a map is empty.
--5. size reports the size of a map
--6. singleton takes a key and a value and creates a map that has exactly one mapping.
--7. lookup works like the Data.List lookup, only it operates on maps. It returns Just something
--if it finds something for the key and Nothing if it doesn't.
--8. member is a predicate that takes a key and a map and reports whether the key is in the map
--or not.
--9. map and filter work much like their list equivalents.
--10. toList is the inverse of fromList
--11. keys and elems return list of keys and values respectively
--12. fromListWith acts like fromList only it doesn't discard duplicate keys but it uses a function
--supplied to it to decide what to do with them. 
--13. insertWith is the equivalent

--Should check ever map data type 

