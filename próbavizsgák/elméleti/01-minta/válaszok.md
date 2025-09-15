### 01. Mi a kapcsolat a `String` és a `[Char]` között?

***a) A `String` a `[Char]` típus egy másik elnevezése.*** \
b) A `String` karaktertömböt jelent, a `[Char]` pedig karakterek listáját. \
c) A `String` a `[Char]` egy specializációja, véges sorozatokat jelöl. \
d) A `String` típusú elemeket `[Char]` típusú elemekből hozzuk létre.

*Magyarázat:* \
A `String` csak egy típusszinoníma a `[Char]` típusra:
```hs
type String = [Char]
```
(Ezt a GHCI-ben a `:i String` paranccsal meg is tekinthetjük.)

### 02. Melyik kifejezés típusozható az alábbiak közül?

a) `length [] ++ [1]` \
b) `length "valami" / 2` \
***c) `take 1`*** \
d) A felsoroltak egyike sem.

*Magyarázat:* \
Az *a)* opciónál a `length []` rész hamarabb értékelődik ki (mivel prefix módon van használva), így a `0 ++ [1]` kifejezésnek nincs értelme (hiszen a `(++)` operátor listákat fűz össze). \
A *b)* opciónál a `length "valami"` eredménye egy `Int` lesz, amire nem használható a törtosztás operátor (`(/)`). \
A *c)* opciónál a `take 1` kifejezés típusa `[a] -> [a]`, hiszen a `take` függvény típusa `Int -> [a] -> [a]`, amiből az első paramétert már megkapta.

### 03. Mi a `foldr` függvény típusa?

***a) `(a -> b -> b) -> b -> [a] -> b`*** \
b) `(b -> a -> b) -> b -> [a] -> b` \
c) `(b -> a -> b) -> b -> [a] -> [b]` \
d) `(a -> b -> b) -> b -> [a] -> [b]`

*Magyarázat:* \
A `foldr` és `foldl` függvények mindig az akkumulátort adják vissza, ami a második paraméter. \
Emellett mindkét függvény nevének utolsó betűje, azaz az `r` (right) és az `l` (left), megadja a hajtogató függvény paramétereinél a sorrendet: a `foldr` egy `(a -> b -> b)` típusú függvényt vár, azaz a két paraméter közül a *jobb* oldalon van az akkumulátor paraméter, míg a `foldl` egy `(b -> a -> b)` típusú függvényt vár, ahol meg a *bal* oldalon.

### 04. Az alábbi definíciók közül melyik ad meg totális függvényt?

***a) `f (x,_) = x`*** \
b) `f (x:_) = x` \
c) `f (x:[]) = x` \
d) `f (x,[]) = x`

*Magyarázat:* \
Az *a)* opciónál egy rendezett párt kapunk, aminek minden esetben ki tudjuk venni az első elemét, a második elemtől függetlenül (lásd: `fst` függvény). \
A *b)* opciónál egy nemüres listára mintaillesztünk, így az üres listát (`[]`) nem kezeljük le. Hibára példa: `f []` \
A *c)* opciónál egy pontosan egy elemű listára mintaillesztünk, így az üres listát (`[]`), illetve a legalább kételemű listákat nem kezeljük le. Hibára példa: `f []` és `f [1, 2]`. \
A *d)* opciónál ugyan egy rendezett párt kapunk, aminek az első elemét ki tudjuk venni, azonban nincs lekezelve az az eset, amikor a második eleme nem üres lista. Hibára példa: `f (1, [1])`

### 05. Mi lehet a `Just (Just 'e')` kifejezés típusa az alábbiak közül?

a) `Maybe String` \
***b) `Maybe (Maybe Char)`*** \
c) `Maybe (a -> a)` \
d) `Maybe (Char -> Maybe Char)`

*Magyarázat:* \
Az `'e'` kifejezés típusa `Char`, a `Just` függvény típusa `a -> Maybe a`. Így a `Just 'e'` típusa `Maybe Char`, majd a `Just (Just 'e')` típusa `Maybe (Maybe Char)`.

### 06. Melyik kifejezésre illeszkedik az `(x,y):z` minta?

***a) `[(even, odd)]`*** \
b) `(['a'], ['b'])` \
c) `[[1,2], []]` \
d) `(1, 2, [3])`

*Magyarázat:* \
Az `(x,y):z` minta egy legalább egyelemű listát jelöl, aminek az első eleme az `(x,y)` mintára illeszkedik, a maradék lista pedig a `z` mintára. \
Az `(x,y)` minta egy rendezett párra illeszkedik, ahol az `x` az első komponens és az `y` a második komponens.

### 07. Az alábbi függvények közül melyiknek lehet totális (nem parciális) definíciót adni (undefined, error és végtelen rekurzió használata nélkül)?

a) `f :: [a] -> a` \
b) `g :: Maybe a -> a` \
***c) `h :: (a,a) -> a`*** \
d) `i :: (a -> a) -> a`

*Magyarázat:* \
Az *a)* opciónál egy üres lista (`[]`) esetében nem tudunk `a` típusú elemet előállítani. \
A *b)* opciónál a `Nothing` esetében nem tudunk `a` típusú elemet előállítani. \
A *c)* opciónál egy rendezett párt kapunk, aminek minden esetben `a` típusú az első és második komponense itt. A két totális definíció lehetőség, hogy visszaadjuk az első komponenst, illetve a második komponenst. \
A *d)* opciónál egy függvényt kapunk, amiből nem tudunk előállítani `a` típusú elemet anélkül, hogy már lenne `a` típusú értékünk (ami az eredeti problémánk).
