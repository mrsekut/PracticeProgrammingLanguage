# generics
# ================

proc min[T](x, y: T): T =
  if x < y: x else: y

echo min(2, 3)
echo min("foo", "bar")
# 明示的に型を書いても良い
echo min[int](2, 3) # more explicitly: min[int](2, 3)



# template
# ================

# macros
# ================
import macros

# ノードの構造を知る
dumpTree:
    echo "Hello, World"
