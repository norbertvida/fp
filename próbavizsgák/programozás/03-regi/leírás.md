# Előzetes tudnivalók

Használható segédanyagok:

- [Haskell könyvtárak dokumentációja](http://lambda.inf.elte.hu/haskell/doc/libraries/),
- [Hoogle](http://lambda.inf.elte.hu/haskell/hoogle/),
- [a tárgy honlapja](http://lambda.inf.elte.hu/), és a
- [Haskell szintaxis összefoglaló](http://lambda.inf.elte.hu/CheatSheet.xml).

Ha bármilyen kérdés, észrevétel felmerül, azt a felügyelőknek kell jelezni, **nem** a diáktársaknak!

**FONTOS:**

- A megoldásban legalább az egyik (tetszőleges) függvényt **rekurzívan** kell megadni. Azaz a vizsga csak akkor érvényes, ha az egyik feladatot rekurzív függvénnyel adtátok meg és az helyes megoldása a feladatnak. A megoldást akkor is elfogadjuk, ha annak egy segédfüggvénye definiált rekurzívan. A könyvtári függvények (length, sum, stb.) rekurzív definíciója nem fogadható el rekurzív megoldásként.

- A programozási részből **legalább 8** pontot kell szerezni az érvényes vizsgához!

- A feladatokat a kiírásnak megfelelően, az ott megadott típusszignatúrának megfelelően kell megoldani. A típusszignatúra nem változtatható meg. Megváltoztatott típusszignatúra esetén a feladat 0 pontot ér.

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

- Minden teszten átmenő megoldás érhet teljes pontszámot.
- Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.
- Fordítási hibás megoldás esetén a **teljes vizsga** 0 pontos.

Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

*Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, **határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt** vagy megkérdezni a felügyelőket!*

A *Visual Studio Code Haskell Syntax Highlighting* bővítmény a csatolt fájlok között megtalálható.

Telepítés:

1. Bővítmények megnyitása bal oldalt (4 kicsi négyzet) (`Ctrl + Shift + X`)
2. `...` a megnyíló ablak jobb felső sarkában
3. `Install from VSIX...`, majd a letöltött állomány kitallózása

# Feladatok

## Hatványozás másként (2 pont)

Add meg azt a függvényt, amely egy lista minden elemét hatványozza, ahol a kitevő a rákövetkező elem lesz! Az utolsó elem maradjon változatlan!
Feltehetjük, hogy a listában minden elem valamilyen nemnegatív egész érték!

```hs
weirdoPow :: Integral a => [a] -> [a]
```

```hs
null (weirdoPow [])
weirdoPow [0] == [0]
weirdoPow [6] == [6]
weirdoPow [6,6] == [46656,6]
weirdoPow [0,6] == [0,6]
weirdoPow [6,0] == [1,0]
weirdoPow [0,0] == [1,0]
weirdoPow [2,2,2] == [4,4,2]
weirdoPow [6,9,10,23] == [10077696,3486784401,100000000000000000000000,23]
weirdoPow [77,2,25,6,38] == [5929,33554432,244140625,371319292745659279662190166016,38]
weirdoPow [1,2,3,4,5,6] == [1,8,81,1024,15625,6]
weirdoPow [0,5,7,3,2,1,4] == [0,78125,343,9,2,1,4]
weirdoPow [0,0,0,0,0,0,0] == [1,1,1,1,1,1,0]
take 10 (weirdoPow [1..]) == [1,8,81,1024,15625,279936,5764801,134217728,3486784401,100000000000]
take 12 (weirdoPow (cycle [4,3,7,2])) == [64,2187,49,16,64,2187,49,16,64,2187,49,16]
```

## Elemek cseréje (2 pont)

Add meg azt a függvényt, amely egy szövegben lecseréli a központozási jeleket a megadott karakterre, a többi elemet pedig változatlanul hagyja!

A feladatban **csak** az alábbi központozási jeleket kell figylembe venni: `,`, `;`, `?`, `.`, `!`

```hs
replacePunctuation :: String -> Char -> String
```

```hs
replacePunctuation "" ' ' == ""
replacePunctuation "Nem kell csere%" '!' == "Nem kell csere%"
replacePunctuation "!!Nem kell csere!!" '!' == "!!Nem kell csere!!"
replacePunctuation "Haskell, what a feeling!:)" '-' == "Haskell- what a feeling-:)"
replacePunctuation ". . , vagy ; es keszen van a fejecske! ;-)" '>' == "> > > vagy > es keszen van a fejecske> >-)"
replacePunctuation "Alma Szilva barack." 'T' == "Alma Szilva barackT"
replacePunctuation "Alma! Szilva; barack." 'T' == "AlmaT SzilvaT barackT"
replacePunctuation "Is Haskell, good? Sure!" '*' == "Is Haskell* good* Sure*"
replacePunctuation "!DFGKJ. ALMA; KALAP" 'K' == "KDFGKJK ALMAK KALAP"
replacePunctuation "!.;?," '+' == "+++++"
take 30 (replacePunctuation (cycle "a.;b?!,") '_') == "a__b___a__b___a__b___a__b___a_"
take 20 (replacePunctuation (cycle "abcdefgh") '_') == "abcdefghabcdefghabcd"
```

## Átlagos szóhossz (2 pont)

Adjuk meg azt a függvényt, amely egy szövegben meghatározza az átlagos
szóhosszt! Az eredmény az átlagos szóhossz alsó egészrésze legyen,
azaz ha nem kerek számról beszélünk, akkor lefelé kerekítsünk.
Amennyiben nincs szó a szövegben, úgy az átlagos hossz legyen `0`.
A szövegről feltehető, hogy véges, illetve a szövegben megjelenő esetleges más írásjelek (pl. `'.'`,`','` stb.) az adott szóhoz tartoznak.

*Segítség:* Használhatjuk a `words` függvényt.

*Megjegyzés:* Egy szó szóköztől szóközig tart, továbbá feltehető, hogy csak szóközökkel lesznek szavak elválasztva. (Tehát `'\t'`-vel, `'\n'`-nel és más elválasztóval, ami mentén a `words` függvény szintén választ, nem.)

```hs
avgWordLength :: String -> Int
```

```hs
avgWordLength "" == 0
avgWordLength "a" == 1
avgWordLength "alma" == 4
avgWordLength "a ab" == 1
avgWordLength "alma fa" == 3
avgWordLength "a ab csa" == 2
avgWordLength "a ab csaa sda" == 2
avgWordLength "a ab csaa sdaa" == 2
avgWordLength "a ab csaa sdaaa" == 3
avgWordLength "alma   szilva   korte  " == 5
avgWordLength "    alma   szilva   korte  " == 5
avgWordLength "   " == 0
avgWordLength "  ,    .  -    * ++   //" == 1
avgWordLength "Nem minden tarka fajta szarka farka tarka, csak a tarka farku szarkafajta szarka farka tarka." == 5
```

## Sorszámok (2 pont)

Definiálj egy függvényt, ami egy `Maybe a` típusú értékeket tartalmazó
lista esetén megadja a `Nothing` értékek indexeit! Az indexelést kezdjük `0`-tól.

```hs
indicesOfNothings :: Integral b => [Maybe a] -> [b]
```

```hs
null (indicesOfNothings [])
null (indicesOfNothings [Just 'a', Just 'b', Just 'c', Just 'd'])
indicesOfNothings [Nothing] == [0]
indicesOfNothings [Just True, Nothing] == [1]
indicesOfNothings [Nothing, Just [1], Nothing] == [0,2]
indicesOfNothings [Nothing, Just [1..], Nothing] == [0,2]
indicesOfNothings [Just [1..], Nothing, Just [2,3,4,1,0], Nothing] == [1,3]
indicesOfNothings [Nothing, Just [1..], Just [2..], Nothing, Nothing, Just[2,1,1]] == [0,3,4]
take 15 (indicesOfNothings (cycle [Nothing, Just [1..], Just [2..], Nothing, Nothing, Just [2,1,1]])) == [0,3,4,6,9,10,12,15,16,18,21,22,24,27,28]
take 10 (indicesOfNothings (cycle [Just [1..], Just [2..], Nothing, Just [2,1,1], Nothing])) == [2,4,7,9,12,14,17,19,22,24]
```

## Sorozatok összehasonlítása (2 pont)

Definiáljuk a `juxtapose` függvényt, mely összehasonlítja két sorozat
azonos pozíción található elemeit. Különbözőség esetén `Just`
adatkonstruktorban visszaadja az **első** sorozat fennmaradó elmeit.
Amennyiben nincs különbség, vagy az első lista prefixe a második
listának, az eredmény legyen `Nothing`.

```hs
juxtapose :: Eq a => [a] -> [a] -> Maybe [a]
```

```hs
juxtapose [] [] == Nothing
juxtapose [] [1] == Nothing
juxtapose [] (repeat 0) == Nothing
fmap (take 10) (juxtapose (repeat 0) []) == Just (replicate 10 0)
juxtapose [1,1] [1] == Just [1]
juxtapose [1,1] [1,1] == Nothing
juxtapose [1,2,3] [1,2,3] == Nothing
juxtapose [1,2,3] [1,2,3,4,5,6] == Nothing
juxtapose "lampa" "lampatest" == Nothing
juxtapose [1,0] [1] == Just [0]
juxtapose [1,0] [1,1,0] == Just [0]
juxtapose [0,1] [1,0,3] == Just [0,1]
juxtapose [3,0,1] [1,0,3] == Just [3,0,1]
juxtapose [1,3,0,1] [1,0,3] == Just [3,0,1]
fmap (take 10) (juxtapose (cycle [1,0,2]) (cycle [1,0,2,1])) == Just [0,2,1,0,2,1,0,2,1,0]
juxtapose "the quick brown fox jumps over the lazy dog" (cycle "the quick brown fox jumps over the lazy dog") == Nothing
juxtapose " the quick brown fox jumps over the lazy dog" (cycle "the quick brown fox jumps over the lazy dog") == Just " the quick brown fox jumps over the lazy dog"
```

## Több függvény szerinti szűrés (2 pont)

Definiáld a `strictFilter` függvényt, amely paraméterül egy logikai függvényekből álló és egy elemeket tartalmazó listát kap, eredményként azokat az elemeket tartja meg a listából, amelyre az összes függvény teljesül! Feltehető, hogy vagy a függvények listája vagy az értékek listája mindig véges, de nem tudjuk, hogy melyik!

```hs
strictFilter :: [a -> Bool] -> [a] -> [a]
```

```hs
null (strictFilter [] [])
strictFilter [] [2,3,4] == [2,3,4]
strictFilter [] [1..10] == [1..10]
strictFilter [even, (<10)] [1..20] == [2,4,6,8]
null (strictFilter [even, odd] [1,2,3,4])
null (strictFilter [even, (>2), (==3)] [])
strictFilter [id, (>False), (==True)] [True, False] == [True]
strictFilter [(>n) | n<-[1..10]] [1..12] == [11,12]
take 10 (strictFilter [(>n) | n<-[1..10]] [1..]) == [11,12,13,14,15,16,17,18,19,20]
null (strictFilter [(> n) | n <- [10..]] [100,99..0])
```

## Park (3 pont)

A feladatunk, hogy a parkban lévő fákat folyamatosan adminisztráljuk. Egy új algebrai adattípust vezetünk be, hogy megkönnyítsük a dolgunkat.

### Algebrai adatszerkezetek

Adjuk meg a `TreeType` típust, amely a különböző fafajokat sorolja fel, ezek lehetnek `Birch, Oak, Beech, Maple`. Kérjük meg a fordítót, hogy példányosítsa nekünk az `Eq` és `Show` típusosztályokat.

Adjuk meg a `Tree` típust, amely segítségével egy fa tulajdonságait írhatjuk le. A típusnak két konstruktora legyen, ezek:

- `Alive :: TreeType -> Age -> Tree` : az első adattag a fa típusát, a második a fa aktuális életkorát írja le,
- `Dead :: TreeType -> Age -> Tree` : az első adattag a fa típusát, a második pedig a fa elpusztulásának évében betöltött életkort adja meg.

Ahol,

```hs
type Age = Integer
```

Kérjük meg a fordítót, hogy példányosítsa nekünk az `Eq` és `Show` típusosztályokat.

### Fák életkorának növelése

Adott egy lista, amely fákról tartalmaz információkat. Definiáljuk azt a függvényt, amely megnöveli eggyel az élő fák korát az elpusztult fákat pedig változatlanul hagyja.

```hs
updateTreeAges :: [Tree] -> [Tree]
```

```hs
null (updateTreeAges [])
updateTreeAges [Alive Birch 5, Dead Maple 23] == [Alive Birch 6,Dead Maple 23]
updateTreeAges [Alive Birch 0, Dead Oak 540] == [Alive Birch 1,Dead Oak 540]
updateTreeAges [Alive Beech 40 , Alive Oak 560, Dead Oak 430, Alive Maple 76] == [Alive Beech 41,Alive Oak 561,Dead Oak 430,Alive Maple 77]
updateTreeAges [status typ age | typ <- [Birch, Oak, Beech, Maple], status <- [Alive, Dead], age <- [30,12,321,453] ] == [Alive Birch 31,Alive Birch 13,Alive Birch 322,Alive Birch 454,Dead Birch 30,Dead Birch 12,Dead Birch 321,Dead Birch 453,Alive Oak 31,Alive Oak 13,Alive Oak 322,Alive Oak 454,Dead Oak 30,Dead Oak 12,Dead Oak 321,Dead Oak 453,Alive Beech 31,Alive Beech 13,Alive Beech 322,Alive Beech 454,Dead Beech 30,Dead Beech 12,Dead Beech 321,Dead Beech 453,Alive Maple 31,Alive Maple 13,Alive Maple 322,Alive Maple 454,Dead Maple 30,Dead Maple 12,Dead Maple 321,Dead Maple 453]
take 10 (updateTreeAges (cycle [Alive Oak 10, Dead Maple 43, Dead Birch 12, Alive Beech 234])) == [Alive Oak 11,Dead Maple 43,Dead Birch 12,Alive Beech 235,Alive Oak 11,Dead Maple 43,Dead Birch 12,Alive Beech 235,Alive Oak 11,Dead Maple 43]
updateTreeAges [Dead Maple 20] == [Dead Maple 20]
updateTreeAges [Dead Maple 20, Dead Oak 23, Dead Oak 25, Dead Beech 94] == [Dead Maple 20, Dead Oak 23, Dead Oak 25, Dead Beech 94]
updateTreeAges [Alive Beech 123] == [Alive Beech 124]
updateTreeAges [Alive Maple 10, Alive Birch 50, Alive Birch 100] == [Alive Maple 11,Alive Birch 51,Alive Birch 101]
take 20 (updateTreeAges (cycle [Alive Maple 46,Alive Maple 43,Dead Maple 55,Alive Oak 56,Alive Birch 2,Alive Beech 3,Dead Oak 55,Dead Birch 33])) == [Alive Maple 47,Alive Maple 44,Dead Maple 55,Alive Oak 57,Alive Birch 3,Alive Beech 4,Dead Oak 55,Dead Birch 33,Alive Maple 47,Alive Maple 44,Dead Maple 55,Alive Oak 57,Alive Birch 3,Alive Beech 4,Dead Oak 55,Dead Birch 33,Alive Maple 47,Alive Maple 44,Dead Maple 55,Alive Oak 57]
```

## Lokális minimum (3 pont)

Definiáld a `localMin` függvényt, amely egy véges lista legnagyobb
lokális minimumát adja meg! Lokális minimumnak tekintünk minden olyan
elemet, ami a szomszédainál kisebb. A lista elején és
végén lévő elemeknek csak egy szomszédja van, így ezeket nem kell figyelembe
venni. Amennyiben meghatározható (azaz létezik) lokális minimum, úgy az
eredmény egy `Just` konstruktorba csomagolt legnagyobb érték legyen a lokális
minimumok közül. Amennyiben egyetlen lokális minimum sem létezik, úgy az eredmény
legyen `Nothing`.

*Lokális minimumra példa*:

- Az `[1,0,2]` lista lokális minimuma a `0`, hiszen a megelőző érték és a rákövetkező érték is nagyobbak nála. Így a függvény ezt adja eredményül.
- Az `[1,0,2,3,1,3]` listában két lokális minimum érték is található, ezek a `0` és az `1`. A függvénynek ezek közül a nagyobbat kell visszaadnia.
- Az `[1,2,3,4]` és `[4,3,2,1]` listáknak nincs lokális minimumuk, hiszen nincs olyan eleme, amely esetén a megelőző és a rákövetekző elem is nagyobbak nála.

*Megjegyzés:* Érdmes külön-külön megoldani a két részfeladatot, azaz megkeresni a lokális minimumokat, majd ezek közül megadni a legnagyobbat.

```hs
localMin :: Ord a => [a]{-véges-} -> Maybe a
```

```hs
localMin [] == Nothing
localMin [5] == Nothing
localMin [3,6] == Nothing
localMin [6,3] == Nothing
localMin [1,2,3] == Nothing
localMin [1,2,1] == Nothing
localMin [3,2,4] == Just 2
localMin [3,1,2,1] == Just 1
localMin (replicate 10 5) == Nothing
localMin [10,9,1,4,5,8,3,10] == Just 3
localMin ([10,9..1] ++ [2..10]) == Just 1
localMin ([1..10] ++ [9,8..1]) == Nothing
localMin [1,2,3,2,1,4,6,5,7,6] == Just 5
localMin [1,2,6,2,1,4,6,5,7] == Just 5
localMin [9,0,(-2),(-4),7,4,3,2,9,2,8,6] == Just 2
localMin [9,0,(-2),(-4),(-7),(-4),3,(-2),(-9),(-1),(-8),6] == Just (-7)
```
