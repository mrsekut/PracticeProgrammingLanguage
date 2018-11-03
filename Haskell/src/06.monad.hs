-- Monad ///////////////////////////////////
-- 「文脈を伴う計算」同士を組み合わせ可能にする仕組み
-- 組み合わせ方を予め設定された計算
-- モナドは型クラスの一つ
-- /////////////////////////////////////////

-- Maybeモナド
-- ////////////////////
square :: Integer -> Maybe Integer
square n
    | 0 <= n    = Just (n * n)
    | otherwise = Nothing

squreRoot :: Integer -> Maybe Integer
squreRoot n
    | 0 <= n    = squreRoot' 1
    | otherwise = Nothing
    where
        squreRoot' x
            | n > x * x = squreRoot' (x + 1)
            | n < x * x = Nothing
            | otherwise = Just x

-- 冗長な例
squareAndSquareRoot1 :: Integer -> Maybe Integer
squareAndSquareRoot1 n = case square n of
                            Nothing -> Nothing
                            Just nn -> squreRoot nn

-- Maybeモナドを使う
squareAndSquareRoot1 :: Integer -> Maybe Integer
squareAndSquareRoot1 n = do
    nn <- square n
    squreRoot nn

squareAndSquareRoot2 :: Integer -> Integer -> Maybe Integer
squareAndSquareRoot2 m n = do
    mm <- square m
    nn <- square n
    squreRoot (mm * nn)

-- リストモナド
-- ////////////////////

lessThan :: Integer -> [Integer]
lessThan n = [0 .. n-1]

plusMinus :: Integer -> Integer -> [Integer]
plusMinus a b = [a+b, a-b]

-- 冗長な例
allPM0s :: Integer -> [Integer]
allPM0s n = concat (map (plusMinus 0) (lessThan n))

-- リストモナドを使う
allPM0s :: Integer -> [Integer]
allPM0s n = do
    x <- lessThan n
    plusMinus 0 x
allPM0s :: Integer -> Integer -> [Integer]

-- ((->) r) モナド
-- ////////////////////

countOdd :: [Int] -> Int
countOdd = length . filter odd

countEven :: [Int] -> [Int]
countEven = length . filter even

countAll :: [Int] -> [Int]
countAll xs = countOdd xs + countEven xs


-- ((->) r)のモナド
countAll :: [Int] -> Int
countAll = do
    odds <- countOdd
    evens <- countEven
    return (odds + evens)

-- Identityモナド
-- ////////////////////


newtype Identity a = Identity { runIdentity :: a}
instance Monad Identity where
    return = Identity
    Identity x >>= f = f x

-- Readerモナド
-- ////////////////////

-- Writerモナド
-- ////////////////////

-- State
-- ////////////////////


-- IO
-- ////////////////////

