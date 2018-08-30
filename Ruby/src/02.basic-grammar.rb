# 出力
# ========================
print "hello world"
puts "hello world" # 改行
p "hello world" # デバッグ用

# 式展開
p "price #{3000 * 4}"

# 変数,定数
# ========================
# 変数: 小文字、アンダースコアから始める
# 定数: 大文字から始める(慣習的に全部大文字)

# 分数
# ========================
p Rational(2, 5) + Rational(3, 4)
p 2/5r + 3/4r


# !, ?
# ========================

name = "abc"
# upcase
p name.upcase
p name # -> abc

# upcase! 破壊的なメソッド
p name.upcase!
p name # -> ABC

# ? 真偽値
p name.empty?
p name.include?("g")


# 配列
# ========================

colors = ["red", "blue", "yellow"]
p colors[0..2] # ["red", "blue", "yellow"]
p colors[0...2] # ["red", "blue"]
colors << "sliver" # pushする
p colors

# ハッシュ(辞書のようなもの)
# ========================

# 以下3行全部同じ
# scores = {"a" => 200, "b" => 400}
# scores = {:a => 200, :b => 400}
scores = {a: 200, b: 400}

p scores[:a]
