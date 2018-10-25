# 入力
# ========================

name = gets.chomp
num = gets.chomp.to_i # cast

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
puts colors # 改行されて全部出力
# red
# blue
# yellow

# ハッシュ(辞書のようなもの)
# ========================

# 以下3行全部同じ
scores = {"a" => 200, "b" => 400}
scores = {:a => 200, :b => 400} # `シンボル`
scores = {a: 200, b: 400}

p scores[:a]

# if
# ========================

if score > 80
  puts "よくできました"
elsif score > 60
  puts "まずまずです"
else
  puts "がんばりましょう"
end

# each
# ========================

list = [0,1,2,3]
list.each do |e|
    puts e
end

# method
# ========================
# 引数がないときは()不要
def hello
    puts "hello"
end
hello # `()`も不要

# 引数、戻り値あり
def discount(price)
	return price / 2
end
harf_price = discount(12000)

# 慣習的にbooleanを返すメソッド名には`?`を付ける
def negative?(num)
    return num < 0
end


# キーワード引数 `:`を付ける
def buy(item:, price:, count:)
	puts "#{item}を#{count}台のお買い上げです"
	puts "合計金額は#{price * count}円です"
end
# 呼び出し側でもキーワードを付ける
buy(item:"テレビ", price:15000, count:2)


# Class
# ========================

require "date" # Dateクラスの読み込み(標準)

class Menu
  attr_accessor :name # `:name`がインスタンス変数
  attr_accessor :price

  # constructor
  def initialize(name:, price:)
    self.name = name
    self.price = price
  end

    
  # method
  def info
    return "#{self.name} #{self.price}円"
  end

  # クラスメソッド メソッド名の前にクラス名を付ける
  def Menu.is_discount_day?
    today = Date.today
    return today.sunday?
  end
end

# 継承
class Drink < Menu
  attr_accessor :calorie

  def initialize
    super(name: name, price: price)
    self.calorie = calorie
  end



menu1 = Menu.new(name: 'pizza', price: 1000)
puts menu1.info