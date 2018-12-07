# 実行
# $ nim c -r prac

# 全体的に        https://qiita.com/ishowta/items/a4d098191fda0f964c3d
# コレクション操作 https://qiita.com/6in/items/61d16b4b86dcd15dedc5

# とりあえず全部
# import system # systemはコンパイルエラーになる(ver 0.13.0)
import algorithm, critbits, future, intsets, lists, macros, math, queues, sequtils, sets, strutils, tables

# 入出力
# ==================
let m = stdin.readLine()
# ex. 3\n -> 3

let n = stdin.readLine.parseInt # 一行入力int
let m = stdin.readLine.split(',') # 区切って入力

let m = stdin.readLine().split().map(parseInt)
# ex. 3 4 5\n => @[3, 4, 5]


# count
count("1") # 配列中の`1`の数


# map :: [a] -> [b]
let
  b = m.map(proc(x: string): string = $x)
  b = m.map do (x:string) -> string : $x  # do


# foldl :: [a] -> a
let
  numbers = @[5, 9, 11]
  addition = foldl(numbers, a + b)

# mapIt
# filterIt


echo x / y # 割り算
echo x div y # 割り算の商
echo x mod y # 割り算のあまり
echo x ^ y # べき乗
echo x and y # 論理和
echo x or y # 論理積
echo x xor y # 排他的論理和
echo (not x) # ビット反転
echo x shl y # 左シフト
echo x shr y # 右シフト