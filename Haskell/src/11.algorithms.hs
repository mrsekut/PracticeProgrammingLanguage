-- 二分法を用いて平方根を求める
c = 0.00000000001

f :: Double -> Double -> Double
f x n = x ^ 2 - n

update :: Double -> Double -> Double -> Double
update max min n | max - min < c = u
                 | f' > 0        = update u min n
                 | f' < 0        = update max u n
 where
  u  = (max + min) / 2
  f' = f u n

sqrt' :: Double -> Double
sqrt' n = update n 0 n

main = print $ sqrt' 2
