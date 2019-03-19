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

-- HoF
map (* 2) [1 .. 5] -- [2,4,6,8,10]
filter (< 2) [1 .. 5] -- [1]
foldl (-) 0 [1 .. 5] -- -15 (= ((((0-1)-2)-3)-4)-5)
foldr (-) 0 [1 .. 5] -- 3 (= (1-(2-(3-(4-(5-0)))))



-- tuple
-- //////////////////
-- fst, snd: タプルを引数にとり、前の値、後の値を返す
-- fst :: (a, b) -> a
-- snd :: (a, b) -> b



-- Maybe
-- //////////////////
-- ref: https://qiita.com/mtsugawa/items/e410812567e8b5b1690c

isJust :: Maybe a -> Bool
isNothing :: Maybe a -> Bool

maybe :: b -> (a -> b) -> Maybe a -> b
catMaybes :: [Maybe a] -> [a]

fromJust :: Maybe a -> a -- Justを剥く。ちょっと無理やりな方法(?)
fromMaybe :: a -> Maybe a -> a

listToMaybe :: [a] -> Maybe a
maybeToList :: Maybe a -> [a]

-- Monad
-- /////////////////////////////////////
-- ref: https://qiita.com/7shi/items/4a8a2807bb5186576c61

replicateM -- actionに使うreplicate
print =<< replicateM 5 (return 1)

replicateM_ -- actionから取り出した値を捨てるreplicateM
rofM
forM_

when -- `when 条件 action`
unless


-- ///////////////////
-- ///////////////////
-- rondom package
-- ///////////////////
-- ///////////////////

import System.Rondom

randAlpha -- ランダムに一文字取得
getStdRandom
randomR