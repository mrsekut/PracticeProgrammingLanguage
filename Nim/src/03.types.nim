# https://qiita.com/KTakahiro1729/items/3f18811267bf4f8075d5

# boolean
# =============
# true, false
bool

# char
# ==============
char

# Strings
# =============

# Integers
# =============
int, int8, int16, int32, int64
uint, uint8, uint16, uint32, uint64

let
  x = 0     # xの型は``int``である
  y = 0'i8  # yの型は``int8``である
  z = 0'i64 # zの型は``int64``である
  u = 0'u   # uの型は``uint``である

# Floats
# =============
float,float32,float64

var
  x = 0.0      # xの型は``float``である
  y = 0.0'f32  # yの型は``float32``である
  z = 0.0'f64  # zの型は``float64``である

# cast
# ===========
var
  x: int32 = 1.int32   #int32(1)を呼び出すのと同様
  y: int8  = int8('a') # 'a' == 97'i8
  z: float = 2.5       # int(2.5)で2に丸められる
  sum: int = int(x) + int(y) + int(z) # sum == 100