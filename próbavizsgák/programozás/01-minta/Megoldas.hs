module Megoldas where

import Data.List

-- Verseny (2 pont)

points :: Integral a => [(String, a, a)] -> [(String, a)]

-- rekurzívan:
points [] = []
points ((n, t, p) : rs)
  | p == 100 || x <= 0 = points rs
  | otherwise = (n, x) : points rs
  where x = 100 - p - t `div` 2

-- magasabbrendű függvényekkel:
-- points = filter ((\n -> 0 < n && n < 100) . snd) . map (\(n, t, p) -> (n, 100 - p - t `div` 2))



-- Ryuk almái (2 pont)

type Apple = (Bool, Int)
type Tree = [Apple]
type Garden = [Tree]

ryuksApples :: Garden -> Int

-- rekurzívan:
ryuksApples [] = 0
ryuksApples (xs : xss) = ryuksApples' xs + ryuksApples xss where
  ryuksApples' :: Tree -> Int
  ryuksApples' [] = 0
  ryuksApples' ((r, h) : xs)
    | r && h <= 3 = 1 + ryuksApples' xs
    | otherwise = ryuksApples' xs

-- magasabbrendű függvényekkel:
-- ryuksApples = length . filter (\(r, h) -> r && h <= 3) . concat



-- Szöveg a szövegben (2 pont)

doesContain :: String -> String -> Bool

-- rekurzívan:
doesContain "" _ = True
doesContain _ "" = False
doesContain (a : as) (b : bs)
  | a == b = doesContain as bs
  | otherwise = doesContain (a : as) bs

-- "csalva":
-- doesContain = isSubsequenceOf -- mivel jelenleg a feladatleírás nem tiltja :PP



-- Barbie (2 pont)

barbie :: [String] -> String

-- rekurzívan:
barbie ps = barbie' ps False where
  barbie' :: [String] -> Bool -> String
  barbie' [] _ = "farmer"
  barbie' ("rozsaszin" : ps) _ = "rozsaszin"
  barbie' ("fekete" : ps) s = barbie' ps (not s)
  barbie' (p : ps) True = p
  barbie' (_ : ps) _ = barbie' ps True

-- magasabbrendű függvényekkel:
-- barbie = maybe "farmer" snd . find (\(i, s) -> even i && s /= "fekete" || s == "rozsaszin") . zip [1..]



-- Első teljesülő predikátum (2 pont)

firstValid :: [a -> Bool] -> a -> Maybe Int

-- rekurzívan:
firstValid ps a = firstValid' ps a 0 where
  firstValid' :: [a -> Bool] -> a -> Int -> Maybe Int
  firstValid' [] a _ = Nothing
  firstValid' (p : ps) a i
    | p a = Just i
    | otherwise = firstValid' ps a (i + 1)

-- magasabbrendű függvényekkel:
-- firstValid ps a = findIndex ($ a) ps



-- Alkalmazott szűrés (2 pont)

combineListsIf :: (a -> b -> Bool) -> (a -> b -> c) -> [a] -> [b] -> [c]

-- rekurzívan:
combineListsIf _ _ [] _ = []
combineListsIf _ _ _ [] = []
combineListsIf p f (a : as) (b : bs)
  | p a b = f a b : combineListsIf p f as bs
  | otherwise = combineListsIf p f as bs

-- magasabbrendű függvényekkel:
-- combineListsIf p f as = map (uncurry f) . filter (uncurry p) . zip as

-- listagenerátorral:
-- combineListsIf p f xs ys = [ f x y | (x, y) <- zip xs ys, p x y ]



-- Tömegközlekedés (3 pont)
data Line = Tram Integer [String]
          | Bus Integer [String]
          deriving (Eq, Show)

whichBusStop :: String -> [Line] -> [Integer]

-- rekurzívan:
whichBusStop _ [] = []
whichBusStop s (Bus n ss : ls)
  | s `elem` ss = n : whichBusStop s ls
  | otherwise = whichBusStop s ls
whichBusStop s (_ : ls) = whichBusStop s ls

-- magasabbrendű függvényekkel:
-- whichBusStop s = map fst . filter (elem s . snd) . map (\l -> case l of Bus n ss -> (n, ss); Tram _ _ -> (0, []))



-- Színházi helyfoglalás (3 pont)

-- rekurzívan:
isReservable :: Int -> String -> Bool
isReservable n "" = n == 0
isReservable n s
  | take n s == replicate n 'x' = True
  | otherwise = isReservable n $ drop 1 s

-- magasabbrendű függvényekkel:
-- isReservable n = any (replicate n 'x' `isPrefixOf`) . tails
