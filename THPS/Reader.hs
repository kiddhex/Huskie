import Data.List

main = do  
        contents <- readFile "file.txt"
        let splitIntoLinesList = lines contents
        let filtered = filter (isInfixOf "needle") splitIntoLinesList
        let firstNCharacters = map (take firstNCharacters) filtered
        let stringify = foldl (\acc x -> acc ++ "/" ++ x) "" firstNCharacters
        writeFile "output.txt" stringify

        return 0
