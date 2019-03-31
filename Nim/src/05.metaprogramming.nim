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

# 使用例 関数の生成
# 「タグを出力する関数」を定義するtemplate
template htmlTag(tag): untyped =
  proc tag(): string = "<" & astToStr(tag) & ">"

htmlTag(br) # br()関数が作成される
echo br() # <br>


# macros
# ================
import macros

# ノードの構造を知る
dumpTree:
    echo "Hello, World"
