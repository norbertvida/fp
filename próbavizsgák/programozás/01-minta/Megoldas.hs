module Megoldas where

import Data.List (isSubsequenceOf, findIndex, tails)
import Data.Maybe (listToMaybe)

-- Verseny (2 pont)
points :: Integral a => [(String, a, a)] -> [(String, a)]
points [] = []
points ((n, t, p) : rs)
  | p == 100 || x <= 0 = points rs
  | otherwise = (n, x) : points rs
  where x = 100 - p - t `div` 2
-- points = filter ((\n -> 0 < n && n < 100) . snd) . map (\(n, t, p) -> (n, 100 - p - t `div` 2))

-- Ryuk almái (2 pont)
type Apple = (Bool, Int)
type Tree = [Apple]
type Garden = [Tree]

ryuksApples :: Garden -> Int
ryuksApples [] = 0
ryuksApples (xs : xss) = ryuksApples' xs + ryuksApples xss where
  ryuksApples' :: Tree -> Int
  ryuksApples' [] = 0
  ryuksApples' ((r, h) : xs)
    | r && h <= 3 = 1 + ryuksApples' xs
    | otherwise = ryuksApples' xs
-- ryuksApples = length . filter (\(r, h) -> r && h <= 3) . concat

-- Szöveg a szövegben (2 pont)
doesContain :: String -> String -> Bool
doesContain "" _ = True
doesContain _ "" = False
doesContain (a : as) (b : bs)
  | a == b = doesContain as bs
  | otherwise = doesContain (a : as) bs
-- doesContain = isSubsequenceOf -- mivel jelenleg a feladatleírás nem tiltja :PP

-- Barbie (2 pont)
barbie :: [String] -> String
barbie ps = barbie' ps False where
  barbie' :: [String] -> Bool -> String
  barbie' [] _ = "farmer"
  barbie' ("rozsaszin" : ps) _ = "rozsaszin"
  barbie' ("fekete" : ps) s = barbie' ps (not s)
  barbie' (p : ps) True = p
  barbie' (_ : ps) _ = barbie' ps True
-- barbie = maybe "farmer" id . listToMaybe . map snd . filter (\(i, p) -> p == "rozsaszin" || even i && p /= "fekete") . zip [1..]

-- Első teljesülő predikátum (2 pont)
firstValid :: [a -> Bool] -> a -> Maybe Int
firstValid ps a = firstValid' ps a 0 where
  firstValid' :: [a -> Bool] -> a -> Int -> Maybe Int
  firstValid' [] a _ = Nothing
  firstValid' (p : ps) a i
    | p a = Just i
    | otherwise = firstValid' ps a (i + 1)
-- firstValid ps a = findIndex ($ a) ps

-- Alkalmazott szűrés (2 pont)
combineListsIf :: (a -> b -> Bool) -> (a -> b -> c) -> [a] -> [b] -> [c]
combineListsIf _ _ [] _ = []
combineListsIf _ _ _ [] = []
combineListsIf p f (a : as) (b : bs)
  | p a b = f a b : combineListsIf p f as bs
  | otherwise = combineListsIf p f as bs
-- combineListsIf p f as = map (uncurry f) . filter (uncurry p) . zip as

-- Tömegközlekedés (3 pont)
data Line = Tram Integer [String]
          | Bus Integer [String]
          deriving (Eq, Show)

whichBusStop :: String -> [Line] -> [Integer]
whichBusStop _ [] = []
whichBusStop s (Bus n ss : ls)
  | s `elem` ss = n : whichBusStop s ls
  | otherwise = whichBusStop s ls
whichBusStop s (_ : ls) = whichBusStop s ls
-- whichBusStop s = map fst . filter (elem s . snd) . map (\l -> case l of Bus n ss -> (n, ss); Tram _ _ -> (0, []))

-- Színházi helyfoglalás (3 pont)
isReservable :: Int -> String -> Bool
isReservable n "" = n == 0
isReservable n s
  | take n s == replicate n 'x' = True
  | otherwise = isReservable n $ drop 1 s
-- isReservable n = not . null . filter ((== replicate n 'x') . take n) . tails
