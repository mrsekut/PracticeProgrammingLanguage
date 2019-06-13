# Elixirに代入はない。bindである。
# 左辺の変数に右辺の値をbindさせてmatchさせている
a = 1
a = "abc" # 上書きもできる
^a = "abc" # 「ピン演算子 ^」を付けるとimmutableになる

# パターンマッチ
list = [1, 2, [3, 4, 5]]
[a, b, c] = list
c # [3,4,5]


# 無名関数
sum = fn a, b -> a + b end
sum. (1,2) # 無名関数の呼び出し時は`.`が必要

