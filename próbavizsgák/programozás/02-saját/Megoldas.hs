module Megoldas where

import Data.List (maximumBy)
import Data.Function (on)

-- Eltérések indexelése (2 pont)
indexDifferences :: (Eq a, Num b) => [a] -> [a] -> [a] -> [b]
indexDifferences xs ys zs = indexDifferences' xs ys zs 0 where
  indexDifferences' :: (Eq a, Num b) => [a] -> [a] -> [a] -> b -> [b]
  indexDifferences' (x : xs) (y : ys) (z : zs) i
    | x /= y || x /= z || y /= z = i : indexDifferences' xs ys zs (i + 1)
    | otherwise = indexDifferences' xs ys zs (i + 1)
  indexDifferences' _ _ _ _ = []
-- indexDifferences xs ys zs = map (fromIntegral . fst) . filter snd . zip [0..] $ zipWith3 (\a b c -> a /= b || a /= c || b /= c) xs ys zs

-- Predikátumok (2 pont)
countPredicates :: Num b => [a -> Bool] -> [a] -> b
countPredicates [] _ = 0
countPredicates (p : ps) xs = countPredicates' p xs + countPredicates ps xs where
  countPredicates' :: Num b => (a -> Bool) -> [a] -> b
  countPredicates' _ [] = 0
  countPredicates' p (x : xs)
    | p x = 1 + countPredicates' p xs
    | otherwise = countPredicates' p xs
-- countPredicates ps xs = sum [ 1 | p <- ps, x <- xs, p x ]

-- Többszörös szűrés (2 pont)
multipleFilter :: [a -> Bool] -> [a] -> [a]
multipleFilter [] xs = xs
multipleFilter (p : ps) xs = multipleFilter ps (filter p xs)
-- multipleFilter ps xs = filter (\x -> all ($ x) ps) xs

-- Bal és jobb oldal egyesítése (3 pont)
uniteLeftAndRight :: [Either a b] -> (a -> c) -> (b -> c) -> [c]
uniteLeftAndRight [] _ _ = []
uniteLeftAndRight (Left a : xs) f g = f a : uniteLeftAndRight xs f g 
uniteLeftAndRight (Right b : xs) f g = g b : uniteLeftAndRight xs f g
-- uniteLeftAndRight xs f g = map (either f g) xs

-- Ciklikus függvényapplikáció (3 pont)
cyclicFunctionApplication :: [a -> b] -> [a] -> [b]
cyclicFunctionApplication fs xs = cyclicFunctionApplication' fs fs xs where
  cyclicFunctionApplication' :: [a -> b] -> [a -> b] -> [a] -> [b]
  cyclicFunctionApplication' _ _ [] = []
  cyclicFunctionApplication' [] os xs = cyclicFunctionApplication' os os xs
  cyclicFunctionApplication' (f : fs) os (x : xs) = f x : cyclicFunctionApplication' fs os xs
-- cyclicFunctionApplication fs xs = zipWith ($) (cycle fs) xs

-- Hármas-válogatás (3 pont)
-- ... Algebrai adatszerkezet
data Threeither a b c = Left' a | Middle' b | Right' c deriving (Eq, Show)

-- ... Szétválogatás
separateThreeithers :: [Threeither a b c] -> ([a], [b], [c])
separateThreeithers [] = ([], [], [])
separateThreeithers (Left' l : xs) = let (ls, ms, rs) = separateThreeithers xs in (l : ls, ms, rs)
separateThreeithers (Middle' m : xs) = let (ls, ms, rs) = separateThreeithers xs in (ls, m : ms, rs)
separateThreeithers (Right' r : xs) = let (ls, ms, rs) = separateThreeithers xs in (ls, ms, r : rs)
-- separateThreeithers xs = ([ x | Left' x <- xs ], [ x | Middle' x <- xs ], [ x | Right' x <- xs ])

-- Eredmények (3 pont)
-- ... Algebrai adatszerkezet
data Competitor = Competitor String [Integer] deriving (Eq, Show)

-- ... Legjobb versenyző
bestCompetitor :: [Competitor] -> Maybe String
bestCompetitor [] = Nothing
bestCompetitor (c : cs) = bestCompetitor' cs c where
  bestCompetitor' :: [Competitor] -> Competitor -> Maybe String
  bestCompetitor' [] (Competitor n _) = Just n
  bestCompetitor' (c1@(Competitor _ ss1) : cs) c2@(Competitor _ ss2)
    | sum ss1 > sum ss2 = bestCompetitor' cs c1
    | otherwise = bestCompetitor' cs c2
-- bestCompetitor = (\(Competitor n _) -> Just n) . maximumBy (compare `on` (\(Competitor _ xs) -> sum xs))
