
-- 束縛
-- ==============================
-- `let`で変数ににリテラルを束縛する
-- 手続き型の代入とは異なり値に名前を付けるイメージ
-- これは定数なので、再代入はできない
let one = 1

-- ローカル変数
-- ==============================

main = do
  print c
  where
    a = 1
    b = 2
    c = a + b

-- ($)と(.)
-- ==============================

-- ($) :: (a -> b) -> a -> b
f $ a -- fは(a->b)型の関数、 xはa型の「値」!

-- (.) :: (b -> c) -> (a -> b) -> a -> c
f . g -- fは(b->c)型の関数, gは(a->b)型の「関数」!

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


-- パターンマッチ
-- 以下は良くない例
-- 以下の例では、0,1,2の場合は何もしない関数
-- パターンマッチが網羅されていないので,3以上の数値を入れて実行すると、エラーが出る
-- ghciで読み込むときに`$ ghci -W prac.h`のように`-W`を付けることで警告増しになり、
-- 読み込み時にエラーを吐いて漏れを警告してくれるようになる
nonExhaustive :: Int -> Int
nonExhaustive 0 = 0
nonExhaustive 1 = 1
nonExhaustive 2 = 2

-- asパターン
-- `@`を使う

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
-- otherwiseはいつも付けよう
fib n
  | n == 0    = 0
  | n == 1    = 1
  | otherwise = fib(n - 2) + fib (n - 1)
main = do
  print $ fib 10

-- パターンマッチとガードを組み合わせた例
caseOfFristLetter :: String -> String
caseOfFristLetter "" = "empty"
caseOfFristLetter (x:xs)
    | 'a' <= x && x <= 'z' = "lower"
    | 'A' <= x && x <= 'Z' = "upper"
    | otherwise            = "other"


-- caseとifを組み合わせた例
-- 上の関数の書き直し
caseOfFristLetter :: String -> String
caseOfFristLetter str =
        case str of
            ""     -> ""
            (x:xs) -> if 'a' <= x && x <= 'z'
                        then "lower"
                        else if 'A' <= x && x <= 'Z'
                                then "upper"
                                else "other"

-- caseとガードを組み合わせた例
-- 上の関数の書き直し
caseOfFristLetter :: String -> String
caseOfFristLetter str =
    case str of
        ""     -> ""
        (x:xs) -> | 'a' <= x && x <= 'z' -> "lower"
                  | 'A' <= x && x <= 'Z' -> "upper"
                  | otherwise            -> "other"




-- case of
fact n = case n of
  0 -> 1
  _ | n > 0 -> n * fact (n - 1)
main = do
  print $ fact 5

-- 再帰の考え方
-- 1. 対象(引数)を構造的に分解していく
-- 2. ベースケースを考える.　再帰していったときにそれ以上再帰できないケース。 空リストなど
-- 3. 結果として守られる性質に着目する

-- list
main = do
  -- 3+1番目の値を返す
  print $ [1, 2, 3, 4, 5] !! 3

main = do
  print [1..5]

main = do
  -- listに追加
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
