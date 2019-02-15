-- 挿入ソート
insert x [] = [x]
insert x (y:ys)
  | x < y     = x:y:ys
  | otherwise = y : insert x ys
isort []     = []
isort (x:xs) = insert x (isort xs)
main = do
  print $ isort [4,6,9,8,3,5,1,7,2]


-- バブルソート
bswap [x] = [x]
bswap (x:xs)
  | x > y     = y:x:ys   -- ←リストについては頭からしか指定できない
  | otherwise = x:y:ys
  where                  -- ←高階関数的な
    (y:ys) = bswap xs

bsort [] = []
bsort xs = y : bsort ys
  where
    (y:ys) = bswap xs

main = do
  print $ bsort [4,6,9,8,3,5,1,7,2]


-- クイックソート
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [ a | a <- xs, a <= x]
      larger = [ a | a <- xs, a > x]
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger
main = do
  print $ quicksort [2,4,1,7,3,9,6,8,5]


-- たらい回し関数(sortとは関係ないが)
tarai :: Int -> Int -> Int -> Int
tarai x y z
    | x <= y    = y
    | otherwise = tarai
                ( tarai ( x - 1) y z)
                ( tarai ( y - 1) z x)
                ( tarai ( z - 1) x y)
                1 /= 1