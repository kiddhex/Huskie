--Typeclasses are like interfaces. A typeclass defines some behaviour and types that behave in that way
--are made instances of it. The behaviour of typeclasses is achieved by defining functions or
--just type declarations that we then implement.

--This is how the eq class is defined in the standard prelude.

class Eq a where
	(==) :: alettercasewordletterepingthetypevariable -> alettercasewletterepingingthetypevariable -> Bool
	(/=) :: alettercasewordletterepingthetypevariable -> alettercasewletterepingingthetypevariable -> Bool
	x == y = not (x /= y)
	x /= y = not (x == y)

--its not mandatory to include the functions bodies. Just the type declarations.
--the mutual recursion is unnecessary but it helps us because?

--a class by itself doesnt do much (like an interface) but once you start making types instances of it
--you get some nice functionality:

data Suit = Spade | Club | Diamond | Heart

instance Eq Suit where
	Spade == Spade = True
	Club == Club = True
	Diamond == Diamond = True
	Heart == Heart = True
	_ == _ = False

--because of the earlier mutual recursion this is the minimum of functions needed to define the whole.

--Let's make this an instance of show by hand too:

instance Show Suit where
	show Spade = "Spades"
	show Club = "Clubs"
	show Diamond = "Diamonds"
	show Heart = "Hearts"

--By making the instance declaration by hand we can customize the type (by adding an s in this case)

--You can also make typeclasses that are subclasses of other tcs. Here is the first part of Num:
--class (Eq a) => Num a where

--Since Maybe isn't a concrete type we can't write:
--instance Maybe where

--We write it out like so:
--instance Eq (Maybe m) where
--	Just x == Just y = x == y
--	Nothing == Nothing = True
--	_ == _ = False

--However we're using Eq on the contents of Maybe's type parameter. So we have to add a class constraint
instance (Eq m) => Eq (Maybe m) where
	Just x == Just y = x == y
	Nothing == Nothing = True
	_ == _ = False

--Most of the times:
--Class constraints in class declarations are used to make a class a subclass of another tc.
--Class constraints in instance declarations are used to express requirements of the contents of some type.
