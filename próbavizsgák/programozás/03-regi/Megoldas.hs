module Megoldas where

import Data.List
import Data.Maybe

-- Hatványozás másként (2 pont)

weirdoPow :: Integral a => [a] -> [a]

-- rekurzívan:
weirdoPow (x:p:xs) = x ^ p : weirdoPow (p:xs)
weirdoPow xs = xs

-- magasabbrendű függvényekkel:
-- weirdoPow xs = zipWith (^) xs (drop 1 xs ++ [1])

-- listagenerátorral:
-- weirdoPow [] = []
-- weirdoPow xs = [ x ^ y | (x, y) <- zip xs (drop 1 xs) ] ++ [last xs]


-- Elemek cseréje (2 pont)

replacePunctuation :: String -> Char -> String

-- rekurzívan:
replacePunctuation "" _ = ""
replacePunctuation (c:cs) r
  | c `elem` ",;?.!" = r : rest
  | otherwise        = c : rest
  where rest = replacePunctuation cs r

-- magasabbrendű függvényekkel:
-- replacePunctuation cs r = map (\c -> if c `elem` ",;?.!" then r else c) cs

-- listagenerátorral:
-- replacePunctuation cs r = [ if c `elem` ",;?.!" then r else c | c <- cs ]



-- Átlagos szóhossz (2 pont)

avgWordLength :: String -> Int

-- rekurzívan:
avgWordLength s = avgWordLength' 0 0 $ words s where
  avgWordLength' len 0 [] = 0
  avgWordLength' len count [] = len `div` count
  avgWordLength' len count (x : xs) = avgWordLength' (len + length x) (count + 1) xs
 
-- magasabbrendű függvényekkel:
-- avgWordLength = (\(len, count) -> if count /= 0 then len `div` count else 0) . foldl (\(len, count) w -> (len + length w, count + 1)) (0, 0) . words



-- Sorszámok (2 pont)

indicesOfNothings :: Integral b => [Maybe a] -> [b]

-- rekurzívan:
indicesOfNothings xs = indicesOfNothings' xs 0 where
  indicesOfNothings' [] _ = []
  indicesOfNothings' (Nothing:xs) i = i : indicesOfNothings' xs (i + 1)
  indicesOfNothings' (_:xs) i = indicesOfNothings' xs (i + 1)

-- magasabbrendű függvényekkel:
-- indicesOfNothings = map fst . filter (isNothing . snd) . zip [0..]

-- listagenerátorral:
-- indicesOfNothings xs = [ i | (i, Nothing) <- zip [0..] xs ]



-- Sorozatok összehasonlítása (2 pont)

juxtapose :: Eq a => [a] -> [a] -> Maybe [a]

-- rekurzívan:
juxtapose [] _ = Nothing
juxtapose xs [] = Just xs
juxtapose (x:xs) (y:ys)
  | x == y = juxtapose xs ys
  | otherwise = Just (x:xs)



-- Több függvény szerinti szűrés (2 pont)

strictFilter :: [a -> Bool] -> [a] -> [a]

-- rekurzívan:
strictFilter ps [] = []
strictFilter ps (x:xs)
  | strictFilter' ps x = x : rest
  | otherwise          = rest
  where
    rest = strictFilter ps xs
    strictFilter' [] _ = True
    strictFilter' (p:ps) x = p x && strictFilter' ps x

-- magasabbrendű függvényekkel:
-- strictFilter ps = filter (\x -> all ($ x) ps)



-- Park (3 pont)

-- ... Algebrai adatszerkezetek

data TreeType = Birch | Oak | Beech | Maple deriving (Eq, Show)

data Tree = Alive TreeType Age
          | Dead TreeType Age
          deriving (Eq, Show)

type Age = Integer

-- ... Fák életkorának növelése

updateTreeAges :: [Tree] -> [Tree]

-- rekurzívan:
updateTreeAges [] = []
updateTreeAges (Alive tipus kor : xs) = Alive tipus (kor + 1) : updateTreeAges xs
updateTreeAges (x : xs) = x : updateTreeAges xs

-- magasabbrendű függvényekkel:
-- updateTreeAges = map (\x -> case x of Alive tipus kor -> Alive tipus (kor + 1); _ -> x)



-- Lokális minimum (3 pont)

localMin :: Ord a => [a]{-véges-} -> Maybe a

-- rekurzívan:
localMin xs
  | null maxs = Nothing
  | otherwise = Just $ maximum maxs
  where
    maxs = localMin' xs []
    localMin' (x:y:z:xs) maxs
      | x > y && y < z = localMin' (y:z:xs) (y:maxs)
      | otherwise      = localMin' (y:z:xs) maxs
    localMin' _ maxs = maxs

-- magasabbrendű függvényekkel:
-- localMin xs = (\maxs -> case maxs of [] -> Nothing; _ -> Just $ maximum maxs) . map snd . filter fst $ zipWith3 (\x y z -> (x > y && y < z, y)) xs (drop 1 xs) (drop 2 xs)
