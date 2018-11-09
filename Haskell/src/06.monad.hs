-- Monad ///////////////////////////////////
-- 「文脈を伴う計算」同士を組み合わせ可能にする仕組み
-- 組み合わせ方を予め設定された計算
-- モナドは型クラスの一つ
-- /////////////////////////////////////////

-- Maybeモナド
-- ////////////////////
-- どこかで失敗するかもしれない計算
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
-- 複数の結果を持つ計算

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
-- r 型の値を適用して初めて、結果が取り出せるような結果である

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
-- 文脈を持たない


newtype Identity a = Identity { runIdentity :: a}
instance Monad Identity where
    return = Identity
    Identity x >>= f = f x

-- Readerモナド
-- ////////////////////
-- 参照できる環境を共有する



-- Writerモナド
-- ////////////////////
-- 主要な計算の横で、別の値も一直線に合成する
-- ex. logを残しながら計算するなど

-- Prelude> runWriter (fibWithLog 3)
import Control.Monad.Writer

-- sをログとして記録する
logging :: String -> Writer [String] ()
logging s = tell [s]

-- n番目のフィボナッチ数を呼び出しログ付きで計算する
fibWithLog :: Int -> Writer [String] Int
fibWithLog n = do
    logging ("fibWithLog" ++ show n)
    case n of
        0 -> return 1
        1 -> return 2
        n -> do
            a <- fibWithLog (n-2)
            b <- fibWithLog (n-1)
            return (a+b)

-- State
-- ////////////////////
-- 状態の引き継ぎ

-- Prelude> runState (applyTop (+10)) [0..9]
import Control.Monad.State

push :: a -> State [a] ()
push = modify . (:)

pop :: State [a] a
pop = do
    value <- gets head
    modify tail
    return value

applyTop :: (a -> a) -> State [a] ()
applyTop f = do
    a <- pop
    push (f a)



-- IO
-- ////////////////////
-- 副作用を伴う
