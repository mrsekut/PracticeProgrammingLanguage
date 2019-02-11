module DoctestSample where
-- | 文字列中のスペースの個数
--
-- >>> countSpace ""
-- 0
-- >>> countSpace "abracadabra"
-- 0
-- >>> countSpace "Hello, World!"
-- 1
-- >>> countSpace "    "
-- 4
--
-- prop> countSpace s == sum [1 | c <- s, c == ' ']
--
countSpace :: String -> Int
countSpace = length . filter (' ' ==)

rle :: String -> String
rle = undefined