-- test weirdoPow points: 2
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

-- test replacePunctuation points: 2
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

-- test avgWordLength points: 2
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

-- test indicesOfNothings points: 2
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

-- test juxtapose points: 2
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

-- test strictFilter points: 2
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

-- test updateTreeAges points: 3
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

-- test localMin points: 3
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
