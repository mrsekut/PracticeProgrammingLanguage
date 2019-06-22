-- variable
data Var = A | B | C | D | E | F deriving (Show, Eq)

-- constant
data Cst = C0 | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9 deriving (Show)

-- expression
infixl 6 :+:
infixl 6 :-:
data Exp = VAR Var | CST Cst | Exp :+: Exp | Exp :-: Exp deriving (Show)

-- command
infixl 0 :|
infix 4 :=
data Cmd = Var := Exp
         | IFEQ Exp Exp Cmd Cmd
         | For Exp Cmd
         | Noop
         | Cmd :| Cmd
    deriving (Show)
