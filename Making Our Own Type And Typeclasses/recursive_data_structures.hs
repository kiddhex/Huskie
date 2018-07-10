data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

--or record syntax:
--data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)

--fixit:
--infixr 5 :-:
--data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)