# 実行
$ nim c -r prac

# https://qiita.com/ishowta/items/a4d098191fda0f964c3d

# 入出力
import sequtils
from strutils import split, parseInt
from math import sum
let m = readLine(stdin) # 一行入力
let n = readLine(stdin).parseInt() # 一行入力int
let m = readLine(stdin).split(',') # 区切って入力
let m = readLine(stdin).split().map(parseInt)  # 空白でsplitしてintに変換(seq[int])

# mapを使う時は
import sequtils

# https://qiita.com/ishowta/items/a4d098191fda0f964c3d
# 競技プログラミングのためのNim

# var v = [1,2,3,4,5]
#
# # 以下は全部同じ出力結果になる
# echo len(v)
# echo v.len
# echo len v

# var numOfSomeFlower = 4
#
# # camelCaseでもsnake_caseでも同じ解釈になる
# echo numOfSomeFlower
# echo num_of_some_flower

import system, macros, algorithm, tables, sets, lists, queues, intsets, critbits, sequtils, strutils, math, future, scanf

var a :int32 = 1'i32
