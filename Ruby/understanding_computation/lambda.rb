-> x {x + 2}.call(1)

-> x, y {
    x+y
}.call(3, 4)

-> x {
    -> y {
        x+y
    }
}.call(3).call(4)

-> x {x+5}[6]

def one(proc, x)
    proc[x]
end

def two(proc, x)
    proc[proc[x]]
end

def three(proc, x)
    proc[proc[proc[x]]]
end

def zero(proc, x)
    x
end

def true(x, y)
    x
end

def false(x, y)
    y
end

def if(proc, x, y)
    proc[x][y]
end

def zero?(proc)
    proc[-> x { FALSE }][TRUE]
end


ZERO  = -> p { -> x {       x    }}
ONE   = -> p { -> x {     p[x]   }}
TWO   = -> p { -> x {   p[p[x]]  }}
THREE = -> p { -> x { p[p[p[x]]] }}

def to_integer(proc)
    proc[-> n {n+1}][0]
end


TRUE  = -> x { -> y { x }}
FALSE = -> x { -> y { y }}

def to_boolean(proc)
    proc[true][false]
end


IF = -> b { b }

# ex
IF[TRUE]['happy']['sad']


IS_ZERO = -> n { n[-> x { FALSE }][TRUE] }

PAIR  = ->  x { -> y { -> f { f[x][y] } } }
LEFT  = -> p { p[-> x { -> y { x } } ] }
RIGHT = -> p { p[-> x { -> y { y } } ] }

INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }
SLIDE     = -> p { PAIR[RIGHT[p]]INCREMENT[RIGHT[p]] }
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }

ADD      = -> m { -> n { n[INCREMENT][m] } }
SUBTRACT = -> m { -> n { n[DECREMENT][m] } }
MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }
POWER    = -> m { -> n { n[MULTIPLY[m]][ONE] } }

IS_LESS_OR_EQUAL =
    -> m { -> n {
        IS_ZERO[SUBTRACT[m][n]]
    } }

