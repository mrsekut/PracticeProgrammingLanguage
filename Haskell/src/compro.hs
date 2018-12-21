-- 参考: https://qiita.com/karszawa/items/ec0c01c81c22ce060405
-- 実行
-- `$ runhaskell hoge.hs`

-- 問題
-- https://qiita.com/hsjoihs/items/25a08b426196ab2b9bb0
-- http://hamukichi.hatenablog.jp/entry/2018/01/08/223316


main = do
    a <- readLn -- getLineして得られた文字列を解釈する
    [b,c] <- map read . words <$> getLine -- スペース区切りされた数が書かれた入力を1行受け取って数値のリストを生成するI/Oアクション
    s <- getLine
    putStrLn $ unwords [show (a + b + c), s] -- putStrLn $ hogeで出力

-- 文字列を空白で区切って配列にする
words "1 2 3 4" == ["1","2","3","4"]
words "alpha beta    gamma" == ["alpha","beta","gamma"]

-- unwordsはwordsの逆
unwords ["a","b"] == "a b"