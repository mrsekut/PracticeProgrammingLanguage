-- どこかで使った標準関数たちのメモ


-- List
-- ////////////////////////
head [1..9] -- 1
tail [1..9] -- 9
init [1..5] -- [1,2,3,4]
last [1..5] -- 5

length [1..3] -- 3
reverce [1..5] -- [5,4,3,2,1]

take 3 [1..5] -- [1,2,3]
drop 3 [1..5] -- [4,5]

maximum [1..5] -- 5
minimum [1..5] -- 1

sum [1..5] -- 15
product [1..5] -- 120

-- Listの中に存在するかどうか
elem 4 [1..5] -- True
elem 6 [1..6] -- False


-- tuple
-- //////////////////
-- fst, snd: タプルを引数にとり、前の値、後の値を返す
-- fst :: (a, b) -> a
-- snd :: (a, b) -> b









-- ///////////////////
-- ///////////////////
-- rondom package
-- ///////////////////
-- ///////////////////

import System.Rondom

randAlpha -- ランダムに一文字取得
getStdRandom
randomR