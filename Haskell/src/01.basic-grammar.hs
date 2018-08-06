-- ローカル変数
-- ==============================

main = do
  print c
  where
    a = 1
    b = 2
    c = a + b

-- 関数
-- ==============================

f x = x + 1
main = do
  print $ f 1

add x y = x + y
main = do
  -- print $ 1 `add` 2
  print $ add 1 2


-- if文
a = 1
main = do
  if a /= 1 -- not equal
    then print "1"
    else print "2"

f a = if a == 1 then "1" else "2"
main = do
  print $ f 0
  print $ f 1


-- 階乗
fact 0 = 1
fact n = n * fact(n-1)
main = do
  print $ fact 5

-- フィボナッチ
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
main = do
  print $ fib 40

-- ガード
fib n
  | n == 0    = 0
  | n == 1    = 1
  | otherwise = fib(n - 2) + fib (n - 1)
main = do
  print $ fib 10

-- case of
fact n = case n of
  0 -> 1
  _ | n > 0 -> n * fact (n - 1)
main = do
  print $ fact 5

-- list
main = do
  print $ [1, 2, 3, 4, 5] !! 3

main = do
  print [1..5]

main = do
  print $ 1:[2..5]


-- 引数
first (x:xs) = x
main = do
  print $ first [1..5]
  print $ first "abcde"


main = do
  print $ sum [1..5]
  print $ product [1..5]
  print $ take 2 [1..5]

length' [] = 0
length' (_:xs) = 1 + length' xs
main = do
  print $ length' [1, 2, 3]

sum' [] = 0
sum' (x:xs) = x + sum' (xs)
main = do

product' [] = 1
product' (x:xs) = x * product' xs

take' _ [] = []
take' n _ | n<1 = []
tale' n (x:xs) = x : take' (n-1) xs

main = do
  print $ sum' [4..5]
  print $ product' [1]
  print $ take' 3 [1,2,3,4,5]
