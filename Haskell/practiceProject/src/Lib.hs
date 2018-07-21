module Lib
    ( someFunc
    ) where

someFunc :: IO ()

fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

someFunc = print $ fib 4
-- someFunc = putStrLn "hello world"


  
