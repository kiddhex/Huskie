import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Eq, Show)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesnt exist!"
        Just (state, code) -> if state /= Taken 
                              then Right code
                              else Left $ "Locker " ++ show lockerNumber ++ "is taken."

-- We could've used a maybe a as type declaration for the lookup but then we wouldn't know why we can't get the locker
