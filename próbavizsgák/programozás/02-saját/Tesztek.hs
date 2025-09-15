-- test indexDifferences points: 2
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

-- test multipleFilter points: 2
multipleFilter [] [] == []
multipleFilter [] [1..10] == [1..10]
multipleFilter [undefined] [] == []
multipleFilter [even] [1..10] == [2,4..10]
multipleFilter [odd] [1..10] == [1,3..9]
multipleFilter [even, odd] [1..10] == []
multipleFilter [(\x -> x `mod` 2 == 0), (\x -> x `mod` 3 == 0)] [1..100] == [6,12..100]
multipleFilter [const False] [undefined] == []

-- test countPredicates points: 2
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

-- test uniteLeftAndRight points: 3
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

-- test cyclicFunctionApplication points: 3
cyclicFunctionApplication [id] [] == []
cyclicFunctionApplication [id] [1] == [1]
cyclicFunctionApplication [(*1)] [1] == [1]
cyclicFunctionApplication [(*7)] [1] == [7]
cyclicFunctionApplication [(*2), (*7)] [1..5] == [2, 14, 6, 28, 10]
cyclicFunctionApplication [show, const ""] [1..10] == ["1", "", "3", "", "5", "", "7", "", "9", ""]
cyclicFunctionApplication [(+1), (+2), (+3)] (replicate 10 1) == [2, 3, 4, 2, 3, 4, 2, 3, 4, 2]
cyclicFunctionApplication [length, sum, product] (replicate 5 [1..5]) == [5, 15, 120, 5, 15]
cyclicFunctionApplication [not, id] [False, False, False, True, True, False, True, True] == [True, False, True, True, False, False, False, True]

-- test separateThreeithers points: 3
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

-- test bestCompetitor points: 3
Competitor "CompA" [] == Competitor "CompA" []
Competitor "CompA" [0] == Competitor "CompA" [0]
Competitor "CompA" [] /= Competitor "CompB" []
Competitor "CompA" [] /= Competitor "CompA" [1]
Competitor "CompA" [0] /= Competitor "CompA" [1]
Competitor "CompA" [0, 0, 0, 0] /= Competitor "CompA" [0, 0, 1, 0]
show (Competitor "CompA" []) == "Competitor \"CompA\" []"
show (Competitor "CompA" [1, 2, 3]) == "Competitor \"CompA\" [1,2,3]"
show (Competitor "CompA" [1..100]) == "Competitor \"CompA\" " ++ show [1..100]
bestCompetitor [] == Nothing
bestCompetitor [Competitor "CompA" []] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3]] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 2]] == Just "CompA"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 4]] == Just "CompB"
bestCompetitor [Competitor "CompA" [1, 2, 3], Competitor "CompB" [1, 2, 4], Competitor "CompC" [4, 3, 2], Competitor "CompD" [1, 1, 1]] == Just "CompC"
