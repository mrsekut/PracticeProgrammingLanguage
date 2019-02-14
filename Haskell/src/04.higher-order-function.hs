-- higher-order function
-- ==============================

-- 代表的な例
-- filter
-- map
-- zip, zipWith
-- foldl, foldr

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (x -> y -> z) -> [x] -> [y] -> [z]
zipWith' _ []       _        = []
zipWith' _ _        []       = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' f []       = []
map' f (x : xs) = f x : map' f xs
map (+ 2) [1..5]
map [x * 2 | x <- [1..5]]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs) | p x       = x : filter' p xs
                   | otherwise = filter' p xs

-- Collatz conjecture
-- Lambda expression
chain :: Integer -> [Integer]
chain 1 = [1]
chain n | even n = n : chain (n `div` 2)
        | odd n  = n : chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1 .. 100]))

-- Convolution
-- ==============================
-- 畳み込み関数は、「2引数関数」,「アキュムレータ(畳み込みに用いる値)の初期値」,「リスト」を受け取る

-- foldlという左畳み込みの関数を使ってsum'関数を実装し直す
sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs
sum' = foldl (+) 0

-- 右畳み込み foldr
-- ex
-- 以下のように計算されている
-- 1 + 10 * (2 + 10 * (3 + 10 * 4))
foldr (\a b -> a + 10 * b) 4 [1,2,3] -- > 4321

-- foldrはリストの(:)を関数に、[]を初期値に置換している
-- 上の例では、[1,2,3]は`1 : 2 : 3 : []`と表せされ、
-- この`:`をラムダ式`(\a b -> a + 10 * b)`に
-- `[]`を`4`に置き換えれば同じ寄りになる。
-- 確認として以下を実行すれば何もしない関数になる
foldr (:) [] [1,2,3] -- > [1,2,3]

--- foldrを使う
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

-- スキャン
-- scanl,scanrでfoldl,foldrの中間状態をリストとして返す
main = do
  print $ scanl (+) 0 [1 .. 5]

-- $ 関数適用演算子
main = do
  print $ sum (filter (> 10) (map (* 2) [2 .. 10]))
  print $ sum $ filter (> 10) $ map (* 2) [2 .. 10]

-- . 関数合成
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
