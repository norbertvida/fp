# Próbavizsga #2

## Előzetes tudnivalók

Használható segédanyagok:

- [Haskell könyvtárak dokumentációja](http://lambda.inf.elte.hu/haskell/doc/libraries/),
- [Hoogle](http://lambda.inf.elte.hu/haskell/hoogle/),
- [a tárgy honlapja](http://lambda.inf.elte.hu/), és a
- [Haskell szintaxis összefoglaló](http://lambda.inf.elte.hu/CheatSheet.xml).

Ha bármilyen kérdés, észrevétel felmerül, azt a felügyelőknek kell jelezni, **nem** a diáktársaknak!

**FONTOS:**

- A megoldásban legalább az egyik (tetszőleges) függvényt
**rekurzívan** kell megadni. Azaz a vizsga csak akkor érvényes, ha az egyik feladatot rekurzív függvénnyel adtátok meg és az helyes megoldása a feladatnak. A megoldást akkor is elfogadjuk, ha annak egy segédfüggvénye definiált rekurzívan. A könyvtári függvények (length, sum, stb.) rekurzív definíciója nem fogadható el rekurzív megoldásként.

- A programozási részből **legalább 7** pontot kell szerezni az érvényes vizsgához!

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

- Minden teszten átmenő megoldás ér teljes pontszámot.
- Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.
- Fordítási hibás vagy hiányzó megoldás esetén a **teljes megoldás** 0 pontos.

Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

*Tekintve, hogy a tesztesetek - bár odafigyelés mellett íródnak - nem fedik le minden esetben a függvény teljes működését, ezért határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt vagy megkérdezni a felügyelőket!*

A *Visual Studio Code Haskell Syntax Highlighting* bővítmény a csatolt fájlok között megtalálható.

Telepítés:

1. Bővítmények megnyitása bal oldalt (4 kicsi négyzet) (`Ctrl + Shift + X`)
2. `...` a megnyíló ablak jobb felső sarkában
3. `Install from VSIX...`, majd a letöltött állomány kitallózása

# Feladatok

## Eltérések indexelése (2 pont)

Definiáld a `indexDifferences` függvényt, amely három listából megadja azokat a sorszámokat (0-tól kezdve), ahol bármilyen eltérés szerepel!

Amennyiben az egyik listából hamarabb fogynának el az elemek, hagyjuk abba a keresést.

```hs
indexDifferences :: (Eq a, Num b) => [a] -> [a] -> [a] -> [b]
```

**Tesztesetek:**

```hs
indexDifferences [] [] [] == []
indexDifferences [1] [] [] == []
indexDifferences [] [1] [] == []
indexDifferences [] [] [1] == []
indexDifferences [1] [1] [1] == []
indexDifferences [2] [1] [1] == [0]
indexDifferences [1] [2] [1] == [0]
indexDifferences [1] [1] [2] == [0]
indexDifferences [1, 2, 3] [2, 3, 1] [3, 1, 2] == [0, 1, 2]
indexDifferences [] [0..] [1..] == []
indexDifferences [0..] [] [1..] == []
indexDifferences [0..] [1..] [] == []
indexDifferences "log" "fog" "dog" == [0]
indexDifferences "test" "test" "test" == []
indexDifferences "text" "test" "test" == [2]
indexDifferences "test" "text" "test" == [2]
indexDifferences (repeat 'a') (repeat 'b') (replicate 100 'c') == [0..99]
```

## Többszörös szűrés (2 pont)

Definiáld a `multipleFilter` függvényt, amely egy predikátumlista alapján szűr kiszűri egy listából azokat az értékeket, amelyek minden predikátumnak megfeleltek!

```hs
multipleFilter :: [a -> Bool] -> [a] -> [a]
```

**Tesztesetek:**

```hs
multipleFilter [] [] == []
multipleFilter [] [1..10] == [1..10]
multipleFilter [undefined] [] == []
multipleFilter [even] [1..10] == [2,4..10]
multipleFilter [odd] [1..10] == [1,3..9]
multipleFilter [even, odd] [1..10] == []
multipleFilter [(\x -> x `mod` 2 == 0), (\x -> x `mod` 3 == 0)] [1..100] == [6,12..100]
multipleFilter [const False] [undefined] == []
```

## Predikátumok (2 pont)

Definiáld a `countPredicates` függvényt, amely kap egy predikátumlistát és egy értéklistát, majd megszámolja, hogy az összes (állítás, érték) pár között mennyi igaz van!

```hs
countPredicates :: Num b => [a -> Bool] -> [a] -> b
```

**Tesztesetek:**

```hs
countPredicates [] [] == 0
countPredicates [] [undefined] == 0
countPredicates [undefined] [] == 0
countPredicates [even] [1..100] == 50
countPredicates [odd] [1..100] == 50
countPredicates [(\n -> n `mod` 10 == 0)] [1..100] == 10
countPredicates [even, odd, (\n -> n `mod` 10 == 0)] [1..100] == 110
countPredicates [(\n -> n `mod` 3 == 0)] [1..100] == 33
countPredicates [(\n -> n `mod` 3 /= 0)] [1..100] == 67
countPredicates [id] [True, False, True, True, False] == 3
countPredicates [not . id] [True, False, True, True, False] == 2
countPredicates [id, not . id] [True, False, True, True, False] == 5
countPredicates [(\(a, b) -> a + b < 50)] [ (a, b) | a <- [0..99], b <- [0..99] ] == 1275
```

## Bal és jobb oldal egyesítése (3 pont)

Definiáld a `uniteLeftAndRight` függvényt, amely egy bal és jobb oldali értékekből álló listát két függvény alapján átalakít egy listává!

```hs
uniteLeftAndRight :: [Either a b] -> (a -> c) -> (b -> c) -> [c]
```

**Tesztesetek:**

```hs
uniteLeftAndRight [] undefined undefined == []
uniteLeftAndRight [Left "bal"] id undefined == ["bal"]
uniteLeftAndRight [ Left n | n <- [1..100] ] id undefined == [1..100]
uniteLeftAndRight [Right "jobb"] undefined id == ["jobb"]
uniteLeftAndRight [ Right n | n <- [1..100] ] undefined id == [1..100]
uniteLeftAndRight [Left "bal", Right "jobb"] id id == ["bal","jobb"]
uniteLeftAndRight [Left 1, Right "2", Left 3, Right "4", Left 5, Right "6"] id read == [1..6]
uniteLeftAndRight [Left "1", Right 2, Left "3", Right 4, Left "5", Right 6] read id == [1..6]
uniteLeftAndRight [Left 1, Right 2, Left 3, Right 4, Left 5, Right 6] (+2) (*2) == [3,4,5,8,7,12]
uniteLeftAndRight [Left 1, Right 2, Left 3, Right 4, Left 5, Right 6] (*2) (+2) == [2,4,6,6,10,8]
uniteLeftAndRight [Left 1, Right "2", Left 3, Right "4", Left 5, Right "6"] show id == map show [1..6]
uniteLeftAndRight [Left "1", Right 2, Left "3", Right 4, Left "5", Right 6] id show == map show [1..6]
```

## Ciklikus függvényapplikáció (3 pont)

Definiáld a `cyclicFunctionApplication` függvényt, amely egy függvénylistát ciklikusan applikál egy értékekből álló listára!

Garantált, hogy legalább egy függvény van a listában.

```hs
cyclicFunctionApplication :: [a -> b] -> [a] -> [b]
```

**Tesztesetek:**

```hs
cyclicFunctionApplication [id] [] == []
cyclicFunctionApplication [id] [1] == [1]
cyclicFunctionApplication [(*1)] [1] == [1]
cyclicFunctionApplication [(*7)] [1] == [7]
cyclicFunctionApplication [(*2), (*7)] [1..5] == [2, 14, 6, 28, 10]
cyclicFunctionApplication [show, const ""] [1..10] == ["1", "", "3", "", "5", "", "7", "", "9", ""]
cyclicFunctionApplication [(+1), (+2), (+3)] (replicate 10 1) == [2, 3, 4, 2, 3, 4, 2, 3, 4, 2]
cyclicFunctionApplication [length, sum, product] (replicate 5 [1..5]) == [5, 15, 120, 5, 15]
cyclicFunctionApplication [not, id] [False, False, False, True, True, False, True, True] == [True, False, True, True, False, False, False, True]
```

## Hármas-válogatás (3 pont)

### Algebrai adatszerkezet

Definiáld a `Threeither` algebrai adatszerkezetet három típusparaméterrel (`a`, `b` és `c`) és az alábbi három konstruktorral:

- `Left' :: a -> Threeither a b c`;
- `Middle' :: b -> Threeither a b c`;
- `Right' :: c -> Threeither a b c`!

Kérd az `Eq` és `Show` típusosztályok automatikus implementálását a fordítótól!

**Tesztesetek:**
```hs
Left' 1 == Left' 1
Left' 1 /= Left' 2
Middle' 1 == Middle' 1
Middle' 1 /= Middle' 2
Right' 1 == Right' 1
Right' 1 /= Right' 2
Left' 1 /= Middle' 1
Left' 1 /= Right' 1
Middle' 1 /= Right' 1
Left' "text" == Left' "text"
Middle' "text" == Middle' "text"
Right' "text" == Right' "text"
Left' "text" /= Middle' "text"
Middle' "text" /= Right' "text"
show (Left' 1) == "Left' 1"
show (Middle' 2) == "Middle' 2"
show (Right' 3) == "Right' 3"
show (Left' True) == "Left' True"
show (Middle' False) == "Middle' False"
show (Right' True) == "Right' True"
show (Left' "text") == "Left' \"text\""
show (Middle' "test") == "Middle' \"test\""
show (Right' "text") == "Right' \"text\""
```

### Szétválogatás

Definiáld a `separateThreeithers` függvényt, amely szétválogat egy `Threeither a b c` típusú értékeket tartalmazó listát három listába, az alábbiak szerint:
- az első listába a `Left'` konstruktorba csomagolt értékek kerüljenek,
- a második listába a `Middle'` konstruktorba csomagolt értékek kerüljenek,
- a harmadik listába a `Right'` konstruktorba csomagolt értékek kerüljenek!

```hs
separateThreeithers :: [Threeither a b c] -> ([a], [b], [c])
```

**Tesztesetek:**

```hs
separateThreeithers [] == ([], [], [])
separateThreeithers [Left' 1] == ([1], [], [])
separateThreeithers [Middle' True] == ([], [True], [])
separateThreeithers [Right' "text"] == ([], [], ["text"])
separateThreeithers [Left' True, Middle' "text", Right' 1] == ([True], ["text"], [1])
separateThreeithers [Left' True, Middle' "text", Right' 1, Right' 2, Middle' "test", Left' False] == ([True, False], ["text", "test"], [1, 2])
let (xs, _, _) = separateThreeithers (map Left' [1..]) in take 100 xs == [1..100]
let (_, xs, _) = separateThreeithers (map Middle' [1..]) in take 100 xs == [1..100]
let (_, _, xs) = separateThreeithers (map Right' [1..]) in take 100 xs == [1..100]
let ((x : _), _, _) = separateThreeithers (repeat (Left' "text")) in x == "text"
let (_, (x : _), _) = separateThreeithers (repeat (Middle' 1)) in x == 1
let (_, _, (x : _)) = separateThreeithers (repeat (Right' True)) in x
```

## Eredmények (3 pont)

### Algebrai adatszerkezet

Definiáld a `Competitor` algebrai adatszerkezetet, egyetlen konstruktorral:

- `Competitor :: String -> [Integer] -> Competitor`, ahol az első paraméter a versenyző neve, a második paraméter a versenyen kapott részpontszámai!

Kérd az `Eq` és `Show` típusosztályok automatikus implementálását a fordítótól!

**Tesztesetek:**

```hs
Competitor "CompA" [] == Competitor "CompA" []
Competitor "CompA" [0] == Competitor "CompA" [0]
Competitor "CompA" [] /= Competitor "CompB" []
Competitor "CompA" [] /= Competitor "CompA" [1]
Competitor "CompA" [0] /= Competitor "CompA" [1]
Competitor "CompA" [0, 0, 0, 0] /= Competitor "CompA" [0, 0, 1, 0]
show (Competitor "CompA" []) == "Competitor \"CompA\" []"
show (Competitor "CompA" [1, 2, 3]) == "Competitor \"CompA\" [1,2,3]"
show (Competitor "CompA" [1..100]) == "Competitor \"CompA\" " ++ show [1..100]
```

### Legjobb versenyző

Definiáld a `bestCompetitor` függvényt, amely megadja a legtöbb összpontszámmal (részpontszámok összege) rendelkező versenyző nevét! Ha nincs versenyző, adjunk vissza `Nothing`-ot.

Garantált, hogy minden versenyzőnek az összpontszáma különbözik (azaz nincs holtverseny).

**Segítség:** Hasznos lehet a `maximumBy` függvény a `Data.List` modulból, illetve az `on` függvény a `Data.Function` modulból.

```hs
bestCompetitor :: [Competitor] -> Maybe String
```

**Tesztesetek:**

```hs
bestCompetitor [] == Nothing
bestCompetitor [Competitor "CompA" []] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3]] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 2]] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 4]] == Just "CompB"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 4], Competitor "CompC" [4, 3, 2], Competitor "CompD" [1, 1, 1]] == Just "CompC"
```