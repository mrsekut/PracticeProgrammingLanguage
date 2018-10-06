# AtCoderはnumpy使える!!!!!!!!!!
import numpy as np


# リストの要素を全てintでinput()する
s = list(map(int, input().split()))

# 1行複数文字
# a b c d e
s = input().rstrip().split()
# 1 2 3 4 5
a, b, c, d, e = map(int, input().rstrip().split())


# 複数行&単一文字
s = [input() for i in range(int(input()))]
# わかりやすく書くと↓
# n = int(input())
# s = [ input() for i in range(n) ]

# https://qiita.com/fmhr/items/77fc453e2fb1bc02e392
# 複数行&複数文字
s = [[int(i) for i in input().split()] for i in range(int(input()))]
print(s)


# 文字数カウント
s[0].count('\\')
# リストの該当する要素数カウント
n = s.count("W")

# 一文字ずつリストにする
list(input())


ex_dict = {}
ex_list = []

# dictのsord
# https://qiita.com/ysk24ok/items/b546471c37b2f443f4c7
# 以下はdictをvalueの値でsortしkeyを表示
ans = {'C': 2000, 'A': 1000, 'B': 3000}
rank = sorted(ans.items(), key=lambda x: x[1], reverse=True)

# 改行なし
# 最終行だけ改行するなら最後にprint()とでも書けばいい
print("hoge", end="")

# 半角、数字判定
# http://www.python.ambitious-engineer.com/archives/420


# リストとリストをkeyとvalueのdictにする
key = ['A', 'B', 'C']
val = ['a', 'b', 'c']
dic = dict(zip(key, val))


# 要素カウント
from collections import Counter
tmp_list = [1, 1, 1, 1, 0, 1, 1]
counter = Counter(tmp_list)

# 最頻値
from statistics import mode
tmp_list = [1, 1, 1, 1, 0, 1, 1]
print(mode(tmp_list))


# ちょいめも

# 比較演算子
# 下のような比較演算子が書ける
if(1 <= x <= 10):
    return x


# if,for文の中でin演算子を使える
# http://www.yukun.info/blog/2008/08/python-if-for-in.html
if elem in [1, 2, 3, 4, 5]:
    hoge


# Noneの比較はisをつかう
# http://monmon.hateblo.jp/entry/20110214/1297710749
if data is None:
    hoge


# numpyメモ
# http://naoyat.hatenablog.jp/entry/2011/12/29/021414
x[1, ...]
# でアクセスできる
