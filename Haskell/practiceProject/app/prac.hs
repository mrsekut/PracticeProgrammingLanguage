filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

-- Collatz conjecture
-- Lambda expression
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n: chain (n `div` 2)
  | odd n = n : chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs >15) (map chain [1..100]))

-- Convolution
-- 畳み込み関数は、「2引数関数」,「アキュムレータ(畳み込みに用いる値)の初期値」,「リスト」を受け取る

-- foldlという左畳み込みの関数を使ってsum'関数を実装し直す
sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' = foldl (+) 0

-- 右畳み込み
--- foldrを使う
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs



main = do
  print $ sum' [1,2,3,4,5]


-- collatz :: 13 -> [13,40,20,10,5,16,8,4,2,1]

-- -- collatz :: Int -> [Int]
-- collatz 0 = []
-- collatz 1 = []
-- collatz x = x : chain x
--   where
--     chain x
--       | x mod 2 == 0 = div x 2
--       | x mod 2 /= 0 = x * 2

--
--
-- -- lis :: Int -> [Int] ->
-- makelist []
-- makelist n (x:xs)
--   | n > x  =
--   | n <= x =
--

-- https://qiita.com/7shi/items/145f1234f8ec2af923ef#%E3%82%BD%E3%83%BC%E3%83%88
-- ソートらへんからやる
-- bswap [x] = [x]
-- bswap (x:y:zs)
--   | x < y     = y : bswap (x:zs)
--   | otherwise = x : bswap (y:zs)
--
--
-- bsort [] = []
-- bsort xs = y:bsort ys
--   where
--     (y:ys) = reverse $ bswap xs
--
-- main = do
--   let a = bswap [4,3,1,5,2]
--   print a
--
--   let (x:xs) = reverse a
--   print (x,xs)
--
--
--   print $ bswap [4,6,9,8,3,5,1,7,2]
--
--
