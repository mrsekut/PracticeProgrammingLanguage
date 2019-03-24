-- ref: https://qiita.com/7shi/items/b8c741e78a96ea2c10fe

import           Control.Exception
import           Control.Monad
import           Control.Monad.State
import           Control.Applicative            ( (<$>)
                                                , (<*>)
                                                )
import           Data.Char


parseTest p s = case p s of
    Right (r, _) -> print r
    Left  e      -> putStrLn $ "[" ++ show s ++ "]" ++ e


anyChar (x : xs) = Right (x, xs)
anyChar _        = Left "too short"

satisfy f (x : xs) | not $ f x = Left $ " : " ++ show x
satisfy f xs                   = anyChar xs

Left a <|> Left b = Left $ b ++ a
Left _ <|> b      = b
a      <|> _      = a

char c xs = satisfy (== c) xs <|> Left ("not char" ++ show c)
digit xs = satisfy isDigit xs <|> Left ("not digit")
letter xs = satisfy isLetter xs <|> Left "not letter"


test1 xs0 = do
    (x1, xs1) <- anyChar xs0
    (x2, xs2) <- anyChar xs1
    return ([x1, x2], xs2)

test2 xs0 = do
    (x1, xs1) <- test1 xs0
    (x2, xs2) <- anyChar xs1
    return (x1 ++ [x2], xs2)

test3 xs0 = do
    (x1, xs1) <- letter xs0
    (x2, xs2) <- digit xs1
    (x3, xs3) <- digit xs2
    return ([x1, x2, x3], xs3)


main = do
    parseTest anyChar    "abc"
    parseTest test1      "abc"
    parseTest test2      "abc"
    parseTest test2      "12"      -- NG
    parseTest test2      "123"
    parseTest (char 'a') "abc"
    parseTest (char 'a') "123"  -- NG
    parseTest digit      "abc"      -- NG
    parseTest digit      "123"
    parseTest letter     "abc"
    parseTest letter     "123"      -- NG
    parseTest test3      "abc"      -- NG
    parseTest test3      "123"      -- NG
    parseTest test3      "a23"
    parseTest test3      "a234"
