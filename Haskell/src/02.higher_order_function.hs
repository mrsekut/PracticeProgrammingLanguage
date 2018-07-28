-- higher-order function

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (x -> y -> z) -> [x] -> [y] -> [z]
zipWith' _ [] _          = []
zipWith' _ _ []          = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' f []     = []
map' f (x:xs) = f x : map' f xs

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
-- 畳み込み関数は、(2引数関数),アキュムレータの初期値,リストを受け取る
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs