-- 挿入ソート
insert x [] = [x]
insert x (y : ys) | x < y     = x : y : ys
                  | otherwise = y : insert x ys
isort []       = []
isort (x : xs) = insert x (isort xs)


-- バブルソート
bswap [x] = [x]
bswap (x : xs) | x > y     = y : x : ys
               |   -- ←リストについては頭からしか指定できない
                 otherwise = x : y : ys
  where                  -- ←高階関数的な
        (y : ys) = bswap xs

bsort [] = []
bsort xs = y : bsort ys where (y : ys) = bswap xs



-- クイックソート
qsort :: [Int] -> [Int]
qsort []       = []
qsort (x : xs) = qsort gte ++ [x] ++ qsort lt
 where
  lt  = [ e | e <- xs, x < e ]
  gte = [ e | e <- xs, x >= e ]


-- たらい回し関数(sortとは関係ないが)
tarai :: Int -> Int -> Int -> Int
tarai x y z
  | x <= y
  = y
  | otherwise
  = tarai (tarai (x - 1) y z) (tarai (y - 1) z x) (tarai (z - 1) x y) 1 /= 1
