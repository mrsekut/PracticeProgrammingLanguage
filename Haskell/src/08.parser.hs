-- ref: https://qiita.com/7shi/items/b8c741e78a96ea2c10fe
import Control.Exception
import Data.Char

parseTest p s = do
    print $ fst $ p s
    `catch` \(SomeException e) ->
        putStr $ show e

-- 文字列から先頭と残りを取得
anyChar (x:xs) = (x, xs)

-- 条件が指定できる版 anyChar
satisfy f (x:xs) | f x = (x, xs)

char c = satisfy (== c)
digit = satisfy isDigit
letter = satisfy isLetter

test3 x0 =
    let (x1, xs1) = letter x0
        (x2, xs2) = digit xs1
        (x3, xs3) = digit xs2
    in ([x1, x2, x3], xs3)


main = do
    -- parseTest (char 'a') "abc"
    -- parseTest (char 'a') "123"
    -- parseTest digit "abc"
    -- parseTest digit "123"
    -- parseTest letter "abc"
    -- parseTest letter "123"

    parseTest test3 "abc"
    parseTest test3 "123"
    parseTest test3 "a12"
    parseTest test3 "a12oo"
