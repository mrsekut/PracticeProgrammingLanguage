-- 関数プログラミングの楽しみの書き方の演習問題
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f e []       = e
foldr' f e (x : xs) = f x (foldr' f e xs)

-- foldr'を使ったmapの再実装
mapR :: (a -> b) -> [a] -> [b]
mapR f xs = foldr' (\x acc -> (f x) : acc) [] xs

appendR :: [a] -> [a] -> [a]
appendR = flip $ foldr' (:)

concatR :: [[a]] -> [a]
concatR xs = foldr' appendR [] xs

main = do
    let a = [1, 2, 3]
    print $ mapR (+ 1) a


-- 関数プログラミングの楽しみの書き方
data List a = Nil | Cons a (List a)

wrap :: a -> List a
wrap x = Cons x Nil

nil :: List a -> Bool
nil Nil         = True
nil (Cons x xs) = False

foldL :: (a -> b -> b) -> b -> List a -> b
foldL f e Nil         = e
foldL f e (Cons x xs) = f x (foldL f e xs)


main = do
    let a = Cons 2 (Cons 4 Nil)
    print $ foldL (+) 0 a
