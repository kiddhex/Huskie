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