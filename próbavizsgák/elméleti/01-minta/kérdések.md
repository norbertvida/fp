### 01. Mi a kapcsolat a `String` és a `[Char]` között?

a) A `String` a `[Char]` típus egy másik elnevezése. \
b) A `String` karaktertömböt jelent, a `[Char]` pedig karakterek listáját. \
c) A `String` a `[Char]` egy specializációja, véges sorozatokat jelöl. \
d) A `String` típusú elemeket `[Char]` típusú elemekből hozzuk létre.

### 02. Melyik kifejezés típusozható az alábbiak közül?

a) `length [] ++ [1]` \
b) `length "valami" / 2` \
c) `take 1` \
d) A felsoroltak egyike sem.

### 03. Mi a `foldr` függvény típusa?

a) `(a -> b -> b) -> b -> [a] -> b` \
b) `(b -> a -> b) -> b -> [a] -> b` \
c) `(b -> a -> b) -> b -> [a] -> [b]` \
d) `(a -> b -> b) -> b -> [a] -> [b]`

### 04. Az alábbi definíciók közül melyik ad meg totális függvényt?

a) `f (x,_) = x` \
b) `f (x:_) = x` \
c) `f (x:[]) = x` \
d) `f (x,[]) = x`

### 05. Mi lehet a `Just (Just 'e')` kifejezés típusa az alábbiak közül?

a) `Maybe String` \
b) `Maybe (Maybe Char)` \
c) `Maybe (a -> a)` \
d) `Maybe (Char -> Maybe Char)`

### 06. Melyik kifejezésre illeszkedik az `(x,y):z` minta?

a) `[(even, odd)]` \
b) `(['a'], ['b'])` \
c) `[[1,2], []]` \
d) `(1, 2, [3])`

### 07. Az alábbi függvények közül melyiknek lehet totális (nem parciális) definíciót adni (undefined, error és végtelen rekurzió használata nélkül)?

a) `f :: [a] -> a` \
b) `g :: Maybe a -> a` \
c) `h :: (a,a) -> a` \
d) `i :: (a -> a) -> a`
