import           Text.Parsec
import           Control.Applicative            ( (<$>)
                                                , (*>)
                                                , (<*)
                                                , pure
                                                )
import           Text.Parsec.String
import           Data.Char                      ( digitToInt )

data Expr = Add Expr Expr | Mul Expr Expr | Nat Int deriving Show

-- expr ::= term ('+' expr | term)
expr :: Parser Expr
expr = do
    t <- term
    (Add t <$> (char '+' *> expr)) <|> pure t


-- term ::= factor ('*' term | factor)
term :: Parser Expr
term = do
    f <- factor
    (Mul f <$> (char '*' *> term)) <|> pure f


-- factor ::= '(' expr ')' | nat
factor :: Parser Expr
factor = (char '(' *> expr <* char ')') <|> nat


-- nat ::= '0' | '1' | '2' | ...
nat :: Parser Expr
nat = Nat . digitToInt <$> oneOf ['0' .. '9']



-- parseTest expr "1+2"
-- > Add (Nat 1) (Nat 2)
