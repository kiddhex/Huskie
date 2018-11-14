import qualified Data.Map as M
--The Functor typeclass is for things which can be mapped over.
--The list type is part of the Functor tc.

--This is how it's implemented:

class Functor f where
    fmap :: (a->b) -> f a -> f b

--f is not a concrete type, it's a type constructor which takes one parameter
--the type signature of map is:

--map :: (a->b) -> [a] -> [b]
--map is just fmap which works only on lists.

--Here is how the list is an instance of the Funcor typeclass.

instance Main.Functor [] where
    fmap = map

--instances of the functor tc are types that can act as boxes.
--Think of a list as a box with infinite compartments and they can all be empty, once can be full
--and a number of them can be full.

--Here's how Maybe is a functor:

instance Main.Functor Maybe where 
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing

-- instance Main.Functor Tree where
--  fmap f EmptyTree = EmptyTree
--  fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

--Here's how Either a is a functor in the standard libraries:

instance Main.Functor (Either a) where
    fmap f (Right x) = Right (f x)
    fmap f (Left x) = Left x

--Map k -> v:

instance Main.Functor (M.Map k) where
    fmap f m = M.map f m