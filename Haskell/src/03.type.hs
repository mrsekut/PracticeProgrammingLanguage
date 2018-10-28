-- 型
-- ==============================

Int
-- 整数, 有界である

Integer
-- 整数, 有界でない
factorial 50
-- > 30414093201713378043612608166064768844377641568960512000000000000

Float
-- 精度浮動小数点数

Double
-- 倍精度浮動小数点数

Rational
-- 有理数

Bool
-- 真理値

Char
-- Unicode文字

-- 型注釈
-- ==============================
-- `::`で型を与えることを型注釈と呼ぶ
ex :: Int -> Int


-- 多層型
-- ==============================
-- Generics的なやつ
-- ex. ghciで以下を実行したときの`a`など
Prelude> :t head
head :: [a] -> a

-- リスト
-- 型`[]`は型一つを包んでリストになる「リストの型コンストラクタ」
-- 値の`[]`は空リストで別物
[a]
[Int] -- 多倍長整数のリスト
[[Char]] -- 文字のリストのリスト

-- タプル
-- 直積型の一つ
-- 型`(,)`は型2つを包んでタプルになる「タプルの型コンストラクタ」
-- 値の`(,)`は「タプルのコンストラクタ」で別物
(a, b)
(Int, Double)
(Bool, [Char])


-- Either
-- 直和型の一つ
-- 2つの型の値の内どちらかを取る
-- 「どちら」を取るかをLeft,Rightで表現
Either a b
Prelude> Left 1 :: Either Int String
Prelude> Right "test" :: Either Int String

-- Maybe
-- ある型aに無効値(Nothing)をを加えた型
-- `Maybe`は型を一つ包んで`Maybe a`型を作る型コンストラクタ
-- isJust関数でJustかそうでないかを判定してくれる
Maybe a
Maybe String -- 有効な値はJust,無効な値はNothingで表される
Maybe Bool -- 有効な値はJust True,もしくはJust False,無効な値はNothingで表される

-- 型クラス
-- ==============================

-- Eq型クラス
-- 等値製をテストできる型
-- ex. ==, /=

-- Ord型クラス
-- なんらかの順序を付けられる型
-- ex. (>), (<), (>=), (<=)

-- Show型クラス
-- ある値の型がShowkたクラスのインスタンスになっていれば、文字列として表現できる
-- ex. (>), (<), (>=), (<=)

-- Read型クラス
-- Showと対をなす型クラス
-- ex. read

-- Enum型クラス
-- 順番に並んだ型

-- Bounded型クラス
-- 上限と下限を持つ

-- Num型クラス
-- 数の型クラス
-- ex. 1, 2

-- Floating型クラス
-- 浮動小数点数に使う
-- FloatとDoubleを含む

-- Integral型クラス
-- 整数全体のみが含まれる数の型クラス
-- Int,Integerを含む


-- ==============================
--
-- 自作 型
--
-- ==============================

-- type宣言
-- 既存の型に別名をつける
type K = Double

-- newtype宣言
-- 既存の型をベースに新しい型を作る
newtype K = K Double 
-- 右辺の`K`はコンストラクタ(左辺と同じである必要はない)


-- 代数データ型 data 
-- 完全に新しい型を作る
-- 以下の例では`Shape`という型を作っている
-- 以下のCircle,Rectangleなどを`値コンストラクタ`と呼ぶ
data Shape = Circle Float Float Float |       -- x, y, r
             Rectangle Float Float Float Float -- 左下(x, y), 右上(x, y)
     deriving (Show)

area :: Shape -> Float
area (Circle _ _ r)          = pi * r ^ 2
area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- 上を座標をPointという型にした
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 x2) (Point y1 y2)) = (abs $ x2 - x2) * (abs $ y2 - y1)

-- レコード構文
-- 名前をつけることで、利用するときに順番を考慮しなくても良くなる
data Person = Person { firstName:: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String } deriving (Show)

-- 代数データ型を多層型にする
-- 座標を表す自作Coord型の座標はIntでもDoubleでもその時時に合わたものにできる
data Coord a = Coord { getX :: a, getY :: a}

-- 再帰型
-- 型の定義に自分自身を入れることもできる
-- ex. 自然数型を定義する
Prelude> data Nat = Zero | Succ Nat
Prelude> :t Zero
Zero :: Nat
Prelude> :t Succ
Succ :: Nat -> Nat

-- 多層型と再帰型を組み合わせる
-- ex. 二分木
-- Leafは末端、Forkは枝分かれの要素を示す
data Tree a = Leaf { element :: a }
            | Fork { element :: a
                   , left    :: Tree a
                   , right   :: Tree a
                   }
                   