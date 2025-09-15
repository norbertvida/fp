### 01. Az alábbi állítások közül melyik igaz a Haskell nyelvre?

a) Haskellben kötelező megadni minden kifejezés típusát. \
b) Haskellben nem lehet operátorokat definiálni, csak a beépítetteket lehet használni. \
c) A Haskell egy szigorú kiértékelésű, tisztán funkcionális nyelv. \
***d) A Haskell egy lusta kiértékelésű, tisztán funkcionális nyelv.***

*Magyarázat:* \
Az *a)* opciónál: nem kötelező megadni, amennyiben nem adjuk meg, akkor megfejti a kifejezés típusát. \
A *b)* opciónál: lehet definiálni, pl.: `(@) a b = a`. \
A *c)* opciónál: nem szigorú kiértékelésű, hanem lusta.

### 02. Melyik függvény definíciója totális (nem parciális) az alábbiak közül?

a) `tail` \
b) `init` \
c) `last` \
***d) `take`***

*Magyarázat:* \
A `tail`, `init` és `last` függvények üres listára nem definiáltak, futási idejű hibát dobnak. \
A `take` üres listánál üres listát állít elő, az első paraméterként megadott számtól függetlenül.

### 03. Melyik állítás hamis az alábbiak közül?

a) Ha egy függvény rekurzív, közvetve vagy közvetlenül magára hivatkozik. \
b) A foldr rekurzívan definiált függvény. \
c) Egy rekurzív függvénynek tetszőleges számú paramétere lehet. \
***d) Minden rekurzív függvénynek meg kell adni legalább egy alapesetet.***

*Magyarázat:* \
Nem kell megadni alapesetet, ellenpélda:
```hs
a :: Int -> [Int]
a n = n : a (n + 1)
```

### 04. Mi igaz a lambda függvényekre Haskellben?

a) Új típus bevezetésével definiálhatók. \
***b) Magasabbrendű függvényeknek adhatók paraméterként.*** \
c) A kompozíciós műveletek egy másik elnevezése. \
d) A lambda kifejezéseknek nem vezethető le vagy adható meg a típusa.

*Magyarázat:* \
Az *a)* opciónál: nem szükséges új típus a lambdafüggvényeknek, a többi függvénnyel azonos módon definiálható a típusuk, pl.:
```hs
a1, a2 :: Int -> Int
a1 n = n + 1
a2 = \n -> n + 1
```
A *b)* opciónál: a magasabbrendű függvények olyan függvények, amelyek függvényt várnak paraméterül, pl. `filter`, `map`, `foldr`. \
A *d)* opciónál: lásd: az *a)* opció.

### 05. Melyik típusosztály?

a) `Int` \
b) `Bool` \
***c) `Integral`*** \
d) `Double`

*Magyarázat:* \
Az `Int`, `Bool`, `Double` konkrét típusok, míg az `Integral` egy típusosztály (az egész számokat tartalmazó típusok osztálya).

### 06. Melyik kifejezés helyes nyelvtanilag az alábbiak közül?

a) `8 mod 5` \
***b) ``3 `mod` 5``*** \
c) `6 (mod) 6` \
d) `(1) mod (7)`

*Magyarázat:* \
Speciális karaktereket nem tartalmazó függvények infix használatánál backtickekbe (`` ` ``) csomagoljuk a függvény nevét, pl. ``7 `div` 2``, ami ekvivalens a `div 7 2` kifejezéssel (kiértékelési sorrendtől eltekintve). \
A speciális karaktereket tartalmazó függvények (operátorok) prefix használatánál zárójelbe (`()`) csomagoljuk a függvény nevét, pl. `(*) 2 3`, ami ekvivalens a `2 * 3` kifejezéssel (kiértékelési sorrendtől eltekintve).

### 07. Mi a `1 < (1,2)` kifejezés eredménye?

***a) Fordítási idejű hiba.*** \
b) `True` \
c) `False` \
d) Futási idejű hiba.

*Magyarázat:* \
A `(<)` operátor típusdefiníciója `Ord a => a -> a -> Bool`, amiből látszik, hogy mindkét paraméterének ugyan olyan típusúnak kell lennie. \
Az `1` típusa `Num a => a`, míg az `(1, 2)` típusa `(Num a, Num b) => (a, b)`, amik eltérő típusok, így már fordítási időben kapunk hibát.

### 08. Mit nevezünk részleges függvényalkalmazásnak?

a) Amikor egy parciális függvényt egy olyan paraméterre hívunk meg, amire nem lett definiálva. \
b) Amikor egy függvényt átadunk paraméterül egy másiknak. \
c) Amikor egy függvény önmagára hivatkozik, hogy egy részfeladatot megoldjon. \
***d) Amikor egy `n` darab paraméterrel rendelkező függvénynek kevesebb, mint `n` paramétert adunk át.***

*Magyarázat:* \
A *b)* opciónál: ezek a magasabbrendű függvények. \
A *c)* opciónál: ez a rekurzió. \
A *d)* opciónál: pl. a `take` függvény típusa `Int -> [a] -> [a]`, amiből látszik hogy két paramétert vár, a `take 1` kifejezés típusa pedig `[a] -> [a]`, amiből látszik hogy egy paramétert már megkapott, így már csak egy paramétert vár.

### 09. Mikor mondjuk egy programozási nyelvről, hogy tisztán funkcionális?

a) Ha magasabbrendű függvények használhatók benne. \
***b) Ha nincsenek mellékhatások.*** \
c) Ha megtalálható benne a Curry-módszer. \
d) Ha lusta kiértékelésű.

*Magyarázat:* \
Nincs benne mellékhatás = csak a függvény bemeneti paraméteritől függ a függvény működése, nincsenek változók, amik külsőleg befolyásolnák a függvény működését.

### 10. Melyik lehet a `map (even . (+1))` kifejezés típusa?

a) `Integral a => (a -> a) -> [a] -> [a]` \
***b) `Integral a => [a] -> [Bool]`*** \
c) `Integral a => [a] -> [a]` \
d) `[a] -> [Bool]`

*Magyarázat:* \
A `map` függvény típusa `(a -> b) -> [a] -> [b]`, a `(+1)` típusa `Num a => a -> a`, az `even` típusa `Integral a => a -> Bool`. \
Az `(even . (+1))` függvény típusa `Integral a => a -> Bool`, így a `map (even . (+1))` típusa `Integral a => (a -> Bool) -> [a] -> [Bool]` (a `map` típusában az `a` típusparaméter megfeleltethető az `Integral a => a` típusnak, a `b` típusparaméter a `Bool` típusnak).

### 11. Az alábbi kifejezések közül melyik ekvivalens az `[f x | x <- ls]` kifejezéssel véges, hiba nélkül kiértékelhető `ls` lista esetén?

a) `foldr f [] ls` \
***b) `map f ls`*** \
c) `filter f ls` \
d) `any f ls`

*Magyarázat:* \
A listagenerátor egyesével kiveszi az `ls` elemeit, lefuttatja rá az `f` függvényt, majd egy új listába pakolja azt. \
Ez a működés megfelel a `map` függvénynek. \
A *c)* opció (egy) listagenerátoros megvalósítása: `[ x | x <- ls, f x ]`. \
A *d)* opció (egy) listagenerátoros megvalósítása: `not (null [ x | x <- ls, f x ])` (elkerülhetetlen extra függvény használata, a listagenerátor listát állít elő).

### 12. Mi a `(\x -> x:[x])` kifejezés típusa?

a) `a -> [[a]]` \
b) `a -> a` \
***c) `a -> [a]`*** \
d) `[a] -> a`

*Magyarázat:* \
Az `x:[x]` kifejezés ekvivalens az `x:x:[]` és `[x,x]` kifejezésekkel. \
Ebből látszik, hogy a függvény csak egy `a` típusú értékből csinál egy `[a]` típusú listát, amiben az érték kétszer szerepel.

### 13. Mi az eredménye a `length []:[]` kifejezésnek?

a) `0` \
***b) `[0]`*** \
c) Fordítás idejű hiba \
d) Futás idejű hiba

*Magyarázat:* \
A prefix módon használt függvények értékelődnek ki, zárójelezve a kifejezés így nézne ki: `(length []) : []`. \
Ebből látszik, hogy a `length [] == 0`, így a kifejezés `0 : []`, ami ekvivalens a `[0]` kifejezéssel.

### 14. Mi a különbség az `_` és `x` minták közt?

a) Az `x` csak a lista fejelemeként, az `_` pedig bárhol használható a mintában. \
b) Az `_` akkor használandó, ha a típus deklarációban adott típusoktól eltérő értékeket is kezelni szeretnénk. \
***c) Egy mintában az `_` többször is szerepelhet, míg az `x` legfeljebb egyszer.*** \
d) Egy mintában az `_` többször is szerepelhet, a függvény törzsében véletlenszerű értéket képvisel.

*Magyarázat:* \
Az underscore (`_`) karaktert olyan paramétereknél használjuk, ahol nem érdekel minket a paraméter értéke. \
Ezt akár többször is megtehetjük, pl.:
```hs
const3 :: a -> b -> c -> a
const3 a _ _ = a
```

### 15. Mit jelent az `(xs:x:y)` minta?

a) Tetszőleges listára illeszkedik. \
***b) Egy legalább kételemű listára illeszkedik.*** \
c) Pontosan három elemből álló listára illeszkedik. \
d) Legalább kételemű lista, melynek utolsó két eleme lesz az `x` és `y`.

*Magyarázat:* \
A mintákban a mintaillesztett paraméterek neve nem számít, így az `(xs:x:y)` minta egy legalább két elemű listára illeszkedik, aminek az első eleme az `xs`, második eleme az `x` és a maradék lista pedig az `y`. 

### 16. Melyik kifejezésre illeszkedik a `[]:x` minta?

a) `[[1], [2]]` \
***b) `[[]]`*** \
c) `[]` \
d) `[[1,2]]`

*Magyarázat:* \
Az `[]:x` minta olyan listákra illeszkedik, amik legalább egy eleműek és az első elemük egy üres lista.

### 17. Mi az eredménye az alábbi kifejezésnek?

```hs
filter (== 2) ([1..] ++ [1,2])
```

a) `[2,2]` \
***b) Kiír egy kettest, majd végtelen ideig fut.*** \
c) Fordítási idejű hiba. \
d) Nem áll le, nem ír ki semmit.

*Magyarázat:* \
Ha egy *végtelen* lista *végéhez* hozzáfűzünk egy bármilyen listát, annak értékeit sose fogjuk tudni elérni. \
Így a `filter` megtalálja a végtelen lista egyetlen `2`-esét, majd a végtelenségig keresi tovább a többi `2`-est.

### 18. Melyik állítás igaz Haskellben a listákra?

a) A listák heterogének, azaz különböző típusú elemekből is állhatnak. \
***b) A listák homogének, azaz kizárólag azonos típusú elemekből állhatnak.*** \
c) A listák mindenképpen véges hosszúak. \
d) Minden listát csak egyféleképpen lehet megkonstruálni, a `(:)` operátorral.

*Magyarázat:* \
Az *a)* opcióhoz: a listák kizárólag ugyanolyan típusú elemekből állhatnak (a lista heterogén adatszerkezet). \
A *c)* opcióhoz: egyik előnye a nyelv lusta kiértékelésének, hogy végtelen listákat is tudunk "tárolni", ellenpélda:
```hs
ls :: [Int]
ls = 1 : ls
```
A *d)* opcióhoz: ellenpélda: `[]`, illetve esetleg `[1, 2, 3]` (bár ez csak szintaktikai cukorka az `1 : 2 : 3 : []` kifejezésre).

### 19. Az alábbiak közül melyik NEM lehet a `Just "true"` kifejezés típusa?

a) `Maybe [Char]` \
b) `Maybe String` \
***c) `Maybe Bool`*** \
d) A fentiek közül bármelyik lehet

*Magyarázat:* \
A `String` típus egy típusszinoníma a `[Char]` típusra:
```hs
type String = [Char]
```
(Ezt az `:i String` paranccsal meg is tekinthetjük.)

### 20. Tekintsük az alábbi definíciót! Mi a `B 42` kifejezés típusa?

```hs
data D = A Int | B Int [Char]
```

a) `D` \
***b) `String -> D`*** \
c) `B Int` \
d) `D -> String`

*Magyarázat:* \
Önmagában a `B` függvény típusa `Int -> [Char] -> D`. \
Ha ennek a függvénynek a `42`-t adjuk paraméterként, így a `B 42` kifejezést vizsgálva, akkor az `[Char] -> D` típust kapjuk. \
Mivel a `String` egy típusszinoníma a `[Char]` típusra, így ez a típus ekvivalens a `String -> D` típussal.

### 21. Melyik helyes kifejezés?

a) `6 div 3` \
***b) ``6 `div` 3``*** \
c) `6 (div) 3` \
d) `(6) div (3)`

*Magyarázat:* \
Lásd: 06. kérdés.

### 22. Melyik helyes kifejezés, ha `f :: Int -> Int -> String -> Bool`?

a) `f (1 2 "str") || True` \
b) `f (1 2 "str" || True)` \
***c) `(f 1 2 "str") || True`*** \
d) `f(1,2,"str") || True`

*Magyarázat:* \
Az *a)* opcióhoz: mivel az `(1 2 "str")` kifejezés van zárójelezve, így az `1`-et, mint függvényt akarjuk használni, annak átadni paraméterül a `2`-t és `"str"`-t, ami természetesen helytelen. \
A *b)* opcióhoz: az előző opcióhoz hasonlóan az `1`-et akarjuk kétparaméteres függvényként használni. \
A *d)* opcióhoz: az f függvény `Int`, `Int` és `String` paramétereket vár, az `(1, 2, "str")` kifejezés azonban `(Int, Int, String)` rendezett hármas típusú.

### 23. Melyik állítás hamis az alábbiak közül?

```hs
f ([a]:[b]) -- 1.
f (a:b:[]) -- 2.
f ((a:[]):b:[]) -- 3.
```

a) Az 1. és 3. minták ugyanarra illeszkednek \
b) Amire illeszkedik az 1. minta, arra illeszkedik a 2. minta is \
***c) Amire illeszkedik az 2. minta, arra illeszkedik a 3. minta is*** \
d) A minták közül legalább egy illeszkedik a(z) `[[],[]]` értékre

*Magyarázat:* \
TODO...

### 24. Melyik kifejezés nem lista típusú?

a) `([[1,2],[]])` \
b) `[(1,2),(3,4)]` \
c) `([1,2]:[])` \
***d) `([1,2],[])`***

*Magyarázat:* \
TODO...

### 25. Mi az eredménye a következő kifejezésnek: `head [1,2,3] == take 1 [3,2,1]`?

a) `True` \
b) `False` \
***c) Fordítási idejű hiba*** \
d) Futási idejű hiba

*Magyarázat:* \
TODO...

### 26. Melyik sor hagyható el a függvényből úgy, hogy működése változatlan maradjon?

```hs
f [x,y] = x `min` y
f [x] = x
f (x:rest) = x `min` f rest
```

***a) Az első*** \
b) A második \
c) A harmadik \
d) Egyik sem

*Magyarázat:* \
TODO...

### 27. Mi lehet a típusa az alábbi kifejezésnek: `map (filter (\x -> x))`?

a) `[a] -> [a]` \
b) `[Bool] -> [Bool]` \
c) `[[a]] -> [[a]]` \
***d) `[[Bool]] -> [[Bool]]`***

*Magyarázat:* \
TODO...

### 28. Mi lehet a típusa az alábbi függvénynek?

```hs
f (x,xs) = init x
f _ = "default"
```

a) `f :: [a] -> String` \
b) `f :: [String] -> String` \
c) `f :: (a,b) -> String` \
***d) `f :: ([Char],a) -> [Char]`***

*Magyarázat:* \
TODO...

### 29. Mi a típusa az alábbi függvénynek?

```hs
f [] = []
f [x] = [x]
f [x:xs] = [xs]
```

a) `f :: [a] -> [a]` \
b) `f :: [[a]] -> [a]` \
c) `f :: [a] -> [[a]]` \
***d) `f :: [[a]] -> [[a]]`***

*Magyarázat:* \
TODO...

### 30. Mi az eredménye a következő kifejezésnek: `zip [1..] "almafa"`?

a) Nem áll le, nem ír ki semmit \
b) Nem áll le, végtelen eredményt ad \
***c) Véges eredménnyel leáll*** \
d) Fordítási hiba

*Magyarázat:* \
TODO...

### 31. Mi igaz a `foldl (++) x ls` és `foldr (++) x ls` kifejezésekre?

a) Eredményük és futási költségük mindenképp azonos \
b) Eredményük és futási költségük azonos, ha ls véges és kiértékelhető \
c) Csak az egyik lehet típushelyes \
***d) Típushelyesek, de eredményük vagy futási költségük eltérő lehet***

*Magyarázat:* \
TODO...

### 32. Melyik kifejezés hoz létre helyes `T` típusú értéket, ha `data T = A Int Bool | B String | C`?

a) `A "almafa"` \
b) `A True 3` \
c) `B 3` \
***d) `C`***

*Magyarázat:* \
TODO...

### 33. Az alábbi függvények közül melyik ad-hoc polimorf (azaz "esetlegesen" polimorf)?

a) `f :: a -> (a, [a])` \
b) `g :: a -> Maybe a` \
***c) `h :: Eq a => a -> a -> a -> Bool`*** \
d) `I :: a -> b -> c -> d -> ((a,b), (c,d))`

*Magyarázat:* \
TODO...

### 34. Melyik kifejezés típushelyes: `(1 + 2.1) :: Double` vagy `((1 :: Int) + 2.1) :: Double`?

***a) Az első.*** \
b) A második. \
c) Egyik kifejezés se típushelyes. \
d) Mindkettő.

*Magyarázat:* \
TODO...

### 35. Melyik állítás teljesül a `reverse` függvényre?

*(Megjegyzés: Ha mindkét kifejezés futási idejű hibát okoz, az megegyyező eredményként van értelmezve.)*

a) `reverse a ++ reverse b == reverse (a ++ b)` \
b) `reverse (a:b) == b ++ [a]` \
c) `reverse (a ++ b) == b ++ a` \
***d) `head (reverse a) == last a`***

*Magyarázat:* \
TODO...

### 36. Melyik típusosztály?

a) `Char` \
b) `Bool` \
c) `Integer` \
***d) `Num`***

*Magyarázat:* \
TODO...

### 37. Mi az `(\x -> head (snd x))` kifejezés típusa?

***) `(a, [b]) -> b`*** \
b) `([a], b) -> a` \
c) `(a, (b,c)) -> b` \
d) `((a,b),c) -> a`

*Magyarázat:* \
TODO...

### 38. Mi a `(\x y -> map y x)` kifejezés típusa?

***a) `[a] -> (a -> b) -> [b]`*** \
b) `(a -> b) -> [a] -> [b]` \
c) `([a] -> [b]) -> ([b] -> [a])` \
d) `(a -> b) -> [b] -> [a]`

*Magyarázat:* \
TODO...

### 39. Legyen `f x = take 1 (drop 1 x)` és `g x = drop 1 (take 2 x)`. Minden bemenetre ugyanazt adja a két függvény?

***a) Igen, bármely `x` esetén `f x` és `g x` megegyezik.***
b) Nem, mert van olyan `x` amelyre az egyik függvény futási idejű hibával leáll, de a másik nem.
c) Nem, mert van olyan `x`, amire különböző eredményt adnak.
d) Nem, minden listára különböző eredményt adnak.

*Magyarázat:* \
TODO...

### 40. Melyik minta illeszkedik a `((1,10):(3,8):[])` kifejezésre?

a) `(x:(2,9):_:[])` \
b) `[(x,y)]` \
***c) `((1,x):(_,8):_)`*** \
d) `(x:[])`

*Magyarázat:* \
TODO...

### 41. Mi lesz az alábbi kifejezés értéke?

```hs
head map (\x -> x^3) [0, 2]
```

a) Futási idejű hibát kapunk. \
b) `0` \
c) `8` \
***d) Fordítási idejű hibát kapunk***

*Magyarázat:* \
TODO...

### 42. Mi lehet a `Just (Nothing, Nothing)` kifejezés típusa az alábbiak közül?

a) `Maybe [a]` \
b) `Maybe (Maybe (a,b))` \
c) `Maybe (a -> b)` \
***d) `Maybe (Maybe a, Maybe b)`***

*Magyarázat:* \
TODO...

### 43. Mi a `(1,2) < (1,2,4)`?

***a) Fordítási idejű hiba.*** \
b) `True` \
c) `False` \
d) Futási idejű hiba.

*Magyarázat:* \
TODO...

### 44. Adott `data T a = P [(a,a)] | L [a]` mellett mi az `L [('a', 'b')]` kifejezés típusa?

a) `T Char` \
***b) `T (Char, Char)`*** \
c) `T [(Char, Char)]` \
d) `T [Char]`

*Magyarázat:* \
TODO...

### 45. Melyik kifejezés azonos a `foldr f e [1..4]` kifejezéssel?

***a) ``1 `f` (2 `f` (3 `f` (4 `f` e)))``*** \
b) ``(((e `f` 1) `f` 2) `f` 3) `f` 4`` \
c) ``e `f` (1 `f` (2 `f` (3 `f` 4)))`` \
d) ``(((1 `f` 2) `f` 3) `f` 4) `f` e``

*Magyarázat:* \
TODO...

### 46. Melyik állítás igaz az algebrai adattípusokra?

a) A definícióban csak egy konstruktor lehet. \
b) Nem lehetnek rekurzívak. \
c) Nem lehet típus paraméterük. \
***d) Az adatkonstruktorok nevének nagybetűvel kell kezdődniük.***

*Magyarázat:* \
TODO...

### 47. Adott az alábbi `f` függvény, hány olyan `x` egész van amelyre `length (f x) == 3`?

```hs
f :: Int -> [Int]
f x
  | even x = replicate x 3
  | otherwise = replicate x x
```

a) 0 \
***b) 1*** \
c) 2 \
d) Végtelen sok.

*Magyarázat:* \
TODO...

### 48. Mi az `(\x -> zip x (tail x)) [1]` kifejezése értéke?

a) `[(1,1)]` \
b) Futási idejű hiba. \
***c) `[]`*** \
d) `[(1,1),(1,1)]`

*Magyarázat:* \
TODO...

#### *Forrás: [Funkcprog beugró (Quizlet)](https://quizlet.com/hu/874315627/funkcprog-beugro-flash-cards/)*
