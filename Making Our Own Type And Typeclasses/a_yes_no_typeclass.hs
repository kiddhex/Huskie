--In javascript and other weakly typed languages you can evaluate the "truthiness" of almost anything.
--Eg an empty string evaluates as false.

--We can take that behavior and define a tc which implements it.

class Truthymeter a where
	truthymeter :: a -> Bool

instance Truthymeter Int where
	truthymeter 0 = False
	truthymeter _ = True

instance Truthymeter [a] where
	truthymeter [] = False
	truthymeter _ = True

--we include the "a" to make it a concrete type even though we don't make any asumptions about it.

instance Truthymeter Bool where
	truthymeter = id

instance Truthymeter (Maybe a) where
	truthymeter (Just _) = True
	truthymeter Nothing = False

--Not in Scope:
--instance Truthymeter (Tree a) where
--	truthymeter EmptyTree = False
--	truthymeter _ = True

truthymeterIf :: (Truthymeter y) => y -> a -> a -> a
truthymeterIf truthymeterVal truthyResult falsyResult = if truthymeter truthymeterVal then truthyResult else falsyResult

