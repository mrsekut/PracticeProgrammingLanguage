-- 型
-- ==============================

-- Int
-- 整数, 有界である

-- Integer
-- 整数, 有界でない
factorial 50
-- > 30414093201713378043612608166064768844377641568960512000000000000

-- Float
-- 精度浮動小数点数

-- Double
-- 倍精度浮動小数点数

-- Bool
-- 真理値

-- Char
-- Unicode文字


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

-- 型
-----------------------------------

-- Shapeは自分でつくった型
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
