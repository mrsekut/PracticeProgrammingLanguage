-- ref: https://qiita.com/lotz/items/39c52f08cc9b5d8439ca

-- forward modej
data Expr
    = X
    | Lit Float
    | Neg Expr
    | Add Expr Expr
    | Mul Expr Expr
    | Sin Expr
    | Cos Expr
    deriving Show


f :: Expr
f = X `Mul` X `Add` Sin X


grad :: Expr -> Expr
grad X                 = Lit 1
grad (Lit _          ) = Lit 0
grad (Neg expr       ) = Neg (grad expr)
grad (Add expr1 expr2) = grad expr1 `Add` grad expr2
grad (Mul expr1 expr2) =
    (grad expr1 `Mul` expr2) `Add` (expr1 `Mul` grad expr2)
grad (Sin expr) = Cos expr `Mul` grad expr
grad (Cos expr) = Neg (Sin expr) `Mul` grad expr


-- double number
data D a = D a a deriving Show

real, grad :: D a -> a
real (D x _) = x
grad (D _ y) = y

instance Num a => Num (D a) where
    (D x x') + (D y y') = D (x + y) (x' + y')
    (D x x') * (D y y') = D (x * y) (x' * y + x * y')
    negate (D x x') = D (negate x) (negate x')
    abs (D x x') = D (abs x) (x' * (signum x))
    signum (D x x') = D (signum x) 0
    fromInteger n = D (fromInteger n) 0

instance Fractional a => Fractional (D a) where
    recip (D x x') = D (recip x) (-1 * x' * (recip (x * x)))
    fromRational x = D (fromRational x) 0


instance Floating a => Floating (D a) where
    pi = D pi 0
    exp (D x x') = D (exp x) (x' * exp x)
    log (D x x') = D (log x) (x' / x)
    sin (D x x') = D (sin x) (x' * cos x)
    cos (D x x') = D (cos x) (-x' * sin x)
    asin (D x x') = D (asin x) (x' / (sqrt (1 - x ** 2)))
    acos (D x x') = D (acos x) (-x' / (sqrt (1 - x ** 2)))
    atan (D x x') = D (atan x) (x' / (1 + x ** 2))
    sinh (D x x') = D (sinh x) (x' * cosh x)
    cosh (D x x') = D (cosh x) (x' * sinh x)
    asinh (D x x') = D (asinh x) (x' / (sqrt (1 + x ** 2)))
    acosh (D x x') = D (acosh x) (x' / (sqrt (x ** 2 - 1)))
    atanh (D x x') = D (atanh x) (x' / (1 - x ** 2))

f :: Floating a => a -> a
f x = x ^ 2 + sin x

-- reverse mode
