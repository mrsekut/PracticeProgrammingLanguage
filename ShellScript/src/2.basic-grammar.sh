#!/bin/bash

# 文字列は、明示的にquotationで括ると良い
echo "hello world"

# 変数
# =======================
name="mrsekut"
echo "hello ${name}"

# `=`の前後にスペースがあるとエラー
# name = "mrsekut"

# readonly, 定数のようなもの, 書き換え不可
readonly const_name = "const"

# コマンドライン引数
# =======================

# コマンドライン引数を受け取る
echo "hello $1"
# `$ ./index.sh "mrsekut"`
# >> hello mrsekut

# $0: ファイル名
# $#: 引数の個数
# $@, $*: すべての引数を表示

# 実行時に入力を受け取る
# =======================
read name
echo "hello ${name}"

# -pオプション: 待ちの時にメッセージを表示
read -p "Name: " name
echo "hello ${name}"

# 配列
# =======================
colors=(red blue pink)
echo ${colors[0]}
echo ${colors[1]}
echo ${colors[2]}
echo ${colors[@]}  # 配列の中身をすべて表示
echo ${#colors[@]} # 個数, 3

# 追加
colors+=(green orange)
echo ${colors[@]}

# 数値計算
# =======================
echo $((5 + 2))

n=5
((n = n + 5))
echo $n

# 整数の演算しか出来ない

# if then else
# =======================
read -p "Name? " name

# ↓ `[]`の中身はスペースを開けないといけない
if [[ $name="mrsekut" ]]; then
    echo "welcome"
elif [ "name" = "shell" ]; then
    echo "welcome, too"
else
    echo "you are not allowed"
fi

# -z: 文字列の長さが0かどうか
# =~: 正規表現

# 数値の比較
# (())を使う
read -p "Number? " n
if ((n > 10)); then
    echo "bigger than 10"
fi

# ファイルの存在確認
# =======================
# -e: 種類問わず存在しているか
# -f: ファイルが存在しているか
# -d: ディレクトリが存在しているか

if [[ -f $0 ]]; then
    echo "file exists ..."
fi

# for
# =======================
for i in {1..5}; do
    echo $i
done

for ((i = 1; i <= 5; i++)); do
    echo $i
done

# 配列を回す
colors=(red blue pink)
for color in ${colors[@]}; do
    echo $color
done

# コマンドの実行結果を受け取る
colors=(red blue pink)
for item in $(date); do
    echo $item
done
