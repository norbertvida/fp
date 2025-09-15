### 01. Mi a különbség az `Int` és `Integer` típusok között?

a) Semmi, az egyik a másik szinonímája. \
b) Az `Int` típus tetszőleges méretű egészeket tud tárolni. \
c) Nem létezik `Integer` típus. \
***d) Az `Integer` típus tetszőleges méretű egészeket tud tárolni.***

*Magyarázat:* \
Az `Int` típus a `Bounded` típusosztályba tartozik, így van minimum (`minBound :: Int`) és maximum (`maxBound :: Int`) értéke, míg az `Integer` típusnak nincs, bármekkora egész szám tárolható benne.
