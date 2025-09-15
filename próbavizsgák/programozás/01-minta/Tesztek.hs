-- test points points: 2
points [("Tomi",68,2),("Kati",75,10),("Imre",84,0)] == [("Tomi",64),("Kati",53),("Imre",58)]
points [("Laci",52,100)] == []
points [("Laci",52,87)] == []
points [("Samu",57,10),("Saci",52,6),("Geri",68,100)] == [("Samu",62),("Saci",68)]
points [("Tomi",68,100),("Kati",75,100),("Imre",84,100)] == []
take 10 (points (cycle [("Samu",57,10),("Saci",52,6),("Geri",68,100)])) == [("Samu",62),("Saci",68),("Samu",62),("Saci",68),("Samu",62),("Saci",68),("Samu",62),("Saci",68),("Samu",62),("Saci",68)]

-- test ryuksApples points: 2
ryuksApples [] == 0
ryuksApples [[],[],[]] == 0
ryuksApples [[(True,3)]] == 1
ryuksApples [[(True,3), (False, 2)], [(True, 4)]] == 1
ryuksApples [[(True,6), (False, 2)], [(True, 4)]] == 0
ryuksApples [[(True,1),(True,2)],[(True,3)],[]] == 3
ryuksApples [[(True,1),(True,2),(True,4)],[(True,3)],[(True,4),(True,0)]] == 4
ryuksApples [[(False,1),(True,2),(False,4)],[(True,3)],[(True,4),(False,0)]] == 2

-- test doesContain points: 2
doesContain "" "" == True
doesContain "" "a" == True
doesContain "a" "" == False
doesContain "a" "a" == True
doesContain "a" "aa" == True
doesContain "aa" "aa" == True
doesContain "aa" " a  a" == True
doesContain "aa" " a  a " == True
doesContain "hero" "the quick brown fox jumps over the lazy dog" == True
doesContain "quick" "the quick brown fox jumps over the lazy dog" == True
doesContain "log" "the quick brown fox jumps over the lazy dog" == True
doesContain "elf" "the quick brown fox jumps over the lazy dog" == False
doesContain "alma" "_a_l_m_a_" == True
doesContain "alma" "a_l_m" == False
doesContain "alma" "a_l_a_m" == False
doesContain "alma" "wxalermmmma" == True
doesContain "szilva" (cycle "s f z l k j i l m m k v a j h") == True

-- test barbie points: 2
barbie [] == "farmer"
barbie ["zold"] == "farmer"
barbie ["fekete"] == "farmer"
barbie ["rozsaszin"] == "rozsaszin"
barbie ["rozsaszin", "fekete"] == "rozsaszin"
barbie ["fekete", "rozsaszin"] == "rozsaszin"
barbie ["rozsaszin", "feher"] == "rozsaszin"
barbie ["kek", "fekete"] == "farmer"
barbie ["kek", "feher"] == "feher"
barbie ["kek", "fekete", "piros", "zold"] == "zold"
barbie ["kek", "fekete", "piros", "fekete", "sarga", "zold", "rozsaszin"] == "zold"
barbie ["kek", "fekete", "piros", "fekete"] == "farmer"
barbie (cycle ["kek", "fekete", "fekete"]) == "kek"

-- test firstValid points: 2
firstValid [(>2), (<3)] 1 == Just 1
firstValid [(>2), (<1)] 2 == Nothing
firstValid [(>1)] 0 == Nothing
firstValid ((>3) : repeat (const False)) 4 == Just 0
firstValid ((<3) : (>4) : (==4) : repeat (const False)) 4 == Just 2

-- test combineListsIf points: 2
combineListsIf undefined undefined [1, 2, 3] [] == []
combineListsIf (\x y -> y > x) (\x y -> x) [1, 2, 3] [4, 5, 6] == [1, 2, 3]
combineListsIf (\x y -> x `elem` y) (\x y -> x : y) ['a','b','c'] ["alma", "bálna", "terasz"] == ["aalma", "bbálna"]
take 15 (combineListsIf (\x y -> y > x) (\x y -> y) [1..] [4..]) == [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]

-- test whichBusStop points: 3
whichBusStop "Alma utca" [] == []
whichBusStop "József utca" [Bus 111 ["Alma utca", "Károly utca", "József út", "Halom utca", "Mária utca"], Tram 10 ["József út", "Karinthy utca", "Róbert utca", "Templom tér", "József utca", "Őrház"], Bus 11 ["Körte utca", "Kalap utca", "József utca", "Hármashatár út", "Mária utca", "Kossuth Lajos utca"]] == [11]
whichBusStop "Károly utca" [Tram 20 ["Alma utca", "Károly utca", "József út", "Halom utca", "Mária utca"], Tram 10 ["József út", "Karinthy utca", "Róbert utca", "Templom tér", "József utca", "Őrház"], Tram 11 ["Körte utca", "Kalap utca", "József utca", "Hármashatár út", "Mária utca", "Kossuth Lajos utca"]] == []
whichBusStop "Mária utca" [Bus 111 ["Alma utca", "Károly utca", "József út", "Halom utca", "Mária utca"], Bus 10 ["József út", "Karinthy utca", "Róbert utca", "Templom tér", "József utca", "Őrház"], Bus 11 ["Körte utca", "Kalap utca", "József utca", "Hármashatár út", "Mária utca", "Kossuth Lajos utca"]] == [111,11]
take 20 (whichBusStop "Nemes út" (Bus 5 ["József út", "Karinthy utca", "Róbert utca", "Templom tér", "Nemes út", "Őrház"] : Bus 10 ["József út", "Karinthy utca", "Róbert utca", "Templom tér", "József utca", "Őrház"] : [Bus i ["Körte utca", "Kalap utca", "József utca", "Hármashatár út", "Nemes út", "Mária utca", "Kossuth Lajos utca"] | i <- [12..]])) == [5,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

-- test isReservable points: 3
isReservable 0 "" == True
isReservable 4 "" == False
isReservable 3 "oxxxx" == True
isReservable 2 "xxxxo" == True
isReservable 4 "oooxxxxo" == True
isReservable 0 "oooxxoo" == True
isReservable 2 "oooxxoo" == True
isReservable 3 "oooxoo" == False
isReservable 1 "oooxoo" == True
isReservable 4 "oooxoo" == False
isReservable 7 "oooxoxxxoooxxxxxxo" == False
isReservable 7 "oooxoxxxoooxxxxxxxxxo" == True
isReservable 7 (cycle "oooxoxxxoooxxxxxxxxxo") == True
isReservable 7 (cycle "ooxoooxoooooxooooxxxxxxxxxooxoxxxoooxxxxxxxxxo") == True
