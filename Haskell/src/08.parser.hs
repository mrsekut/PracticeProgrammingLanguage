-- ref: https://qiita.com/7shi/items/b8c741e78a96ea2c10fe

import           Text.Parsec
import           Control.Applicative            ( (<$>)
                                                , (<*>)
                                                )

test1 = sequence [anyChar, anyChar]
test2 = (++) <$> test1 <*> sequence [anyChar]
test3 = sequence [letter, digit, digit]
test4 = letter <|> digit
test5 = sequence [letter, digit, digit, digit]
test6 = sequence $ letter : replicate 3 digit
test7 = many letter
test8 = many (letter <|> digit)

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
    parseTest test4      "a"
    parseTest test4      "1"
    parseTest test4      "!"        -- NG
    parseTest test5      "a123"
    parseTest test5      "ab123"    -- NG
    parseTest test6      "a123"
    parseTest test6      "ab123"    -- NG
    parseTest test7      "abc123"
    parseTest test7      "123abc"
    parseTest test8      "abc123"
    parseTest test8      "123abc"
