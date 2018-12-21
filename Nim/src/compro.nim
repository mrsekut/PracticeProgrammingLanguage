# 実行
# $ nim c -r prac

# 全体的に        https://qiita.com/ishowta/items/a4d098191fda0f964c3d
# コレクション操作 https://qiita.com/6in/items/61d16b4b86dcd15dedc5

テストコード書いたら？？？

# とりあえず全部
# import system # systemはコンパイルエラーになる(ver 0.13.0)
import algorithm, critbits, future, intsets, lists, macros, math, queues, sequtils, sets, strutils, tables

# 入出力
# ==================
let m = stdin.readLine()
# ex. 3\n -> "3"

let n = stdin.readLine.parseInt # 一行入力int
let m = stdin.readLine.split(',') # 区切って入力
let m = stdin.readLine.split().map(parseInt)
# ex. 3 4 5\n => @[3, 4, 5]

# 複数行人数字
let a, b, c = stdin.readLine.parseInt
# ex.
# 1\n 2\n 3\n -> a=1, b=2, c=3

# n行入力
# n回stdinするしかないのか？
# アイディアとしては、このループの中でaddだけでなく、何か次の処理をしてしまってもいいのかも
var
  n = stdin.readLine.parseInt()
  m: seq[int] = @[]
for i in 0..<n:
  m.add(stdin.readLine.parseInt)

# set
# https://nim-lang.org/docs/sets.html
# ==================
# 型は set[int], set[char]など
# 初期化
import sets
var s = initSet[int]()

var s = {1,2,2,3} # {1, 2, 3}
s.incl(4) # 追加
s.excl(2) # 削除
s.card() # 要素数
s.contrains(3) # 3を持っているか

var s = toSet([2, 4, 6]) # 配列をset型に



# sort
# ==================
# https://qiita.com/6in/items/61d16b4b86dcd15dedc5#%E3%82%BD%E3%83%BC%E3%83%88
var ary = @[3,4,1,8,6,5,7,0,1]
ary.sort(cmp) # 返り値なし
echo ary


# その他
# ==================

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

# Slice
let a = [1,2,3,4,5]
a[1..3] # -> [2, 3, 4]

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


# 各桁の和を求める
# 834 を 10 で割った余りは 4 -> 答えに加算
# 834 を 10 で割って 83
# 83 を 10 で割った余りは 3 -> 答えに加算
# 83 を 10 で割って 8
# 8 を 10 で割った余りは 8 -> 答えに加算
# 8 を 10 で割って 0
# 0 なので break

