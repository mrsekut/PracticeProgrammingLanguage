-- collatz :: 13 -> [13,40,20,10,5,16,8,4,2,1]

-- -- collatz :: Int -> [Int]
-- collatz 0 = []
-- collatz 1 = []
-- collatz x = x : chain x
--   where
--     chain x
--       | x mod 2 == 0 = div x 2
--       | x mod 2 /= 0 = x * 2



chain :: Int -> [Int]
chain 1 = [1]
chain x
  | mod x 2 == 0 = x : chain(x `div` 2)
  | mod x 2 /= 0 = x : chain(x * 3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15)
                               (map chain [1..100]))









--
--
-- -- lis :: Int -> [Int] ->
-- makelist []
-- makelist n (x:xs)
--   | n > x  =
--   | n <= x =
--
-- quicksort :: [Int] -> [Int]
-- quicksort [] = []
-- quicksort (y:x:xs)
--   | y < x  =
--   | y >= x = small ++ [x]
--   where
--     big = []
--     small = []
--
-- main = do
--   print $ quicksort [2,4,1,7,3,9,6,8,5]
--   --  > [1,2,3,4,5,6,7,8,9]
--
--   2 [4,1,7,3,9,7,8,5]
--
--   2  4:[1,7,2,9,6,8,5]
--   2  1:[7,2,9,6,8,5] [:4]
--   2  7:[2,9,6,8,5] [1::4]
--   2  3:[9,6,8,5] [1::4:7]
--   2  9:[6,8,5] [1::4:7:3]
--   2  6:[8,5] [1::4:7:3:9]
--   2  8:[5] [1::4:7:3:9,6]
--   2  5:[] [1::4:7:3:9,6,8]
--   2  [] [1::4:7:3:9,6,8,5]
--
--   [2,3,1]
--   2 [3,1]
--   sort [1] : 2 : sort [3]
--












-- main = do
--   print $ [x*2 | x <- [1..10], x*2 >= 12]
-- \left\{2x | x\in N,x \leq 10, 2x \geq 12\right\}













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



-- [4,6,9,8,3,5,1,7,2]
-- [4,6,9,8,3,5,1,2,7]
-- [4,6,9,8,3,5,1,2,7]
-- [4,6,9,8,3,1,5,2,7]
-- [4,6,9,8,1,3,5,2,7]
-- [4,6,9,1,8,3,5,2,7]
-- [4,6,1,9,8,3,5,2,7]
-- [4,1,6,9,8,3,5,2,7]
--
-- [1,4,6,9,8,3,5,2,7]
-- [1,4,6,9,8,3,2,5,7]
-- [1,4,6,9,8,2,3,5,7]
-- [1,4,6,9,2,8,3,5,7]
-- [1,4,6,2,9,8,3,5,7]
-- [1,4,2,6,9,8,3,5,7]
-- [1,2,4,6,9,8,3,5,7]
