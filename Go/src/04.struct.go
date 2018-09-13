package main

import "fmt"

// type
// ============================
// 型のエイリアスを定義する

func main() {
	type (
		MyInt       int // intにMyIntという名前を付けている(本質的な意味はない、最もシンプルな例)
		IntPair     [2]int
		Strings     []string
		AreaMap     map[string][2]float64 // 複雑な型にAreaMapというエイリアスを定義している
		IntsChannel chan []int
		Callback    func(i int) int // 関数型にエイリアスを定義
	)

	var n1 MyInt = 5
	pair := IntPair{1, 2}
	strs := Strings{"Apple", "Banana", "Cherry"}
	amap := AreaMap{"Tokyo": {35.789, 123.789}}
	ich := make(IntsChannel)

	fmt.Println(n1)
	fmt.Println(pair)
	fmt.Println(strs)
	fmt.Println(amap)
	fmt.Println(ich)
}

// struct
// ============================
// 複数の任意の型の値を1つにまとめたもの

func main() {
	// 構造体の定義
	// {}の中のものを「フィールド」と呼ぶ
	type Point struct {
		X, Y int   // XとYというint型のフィールド
		_    int16 // 無名フィールド. 構造体のメモリ上のアラインメント調整のために用意されている
	}

	// var pt Point
	// pt.X = 10
	// pt.Y = 8

	// 複合リテラル
	// 初期値を指定しつつ構造体を生成
	pt := &Point{1, 2}
	// pt := Point{X; 1, Y: 2} // 同じ

	fmt.Println(pt.X, pt.Y)
}

// 入れ子の構造体はフィールド名が一意に決まる場合は、中間フィールド名を省略できる
func main() {
	type Feed struct {
		Name   string
		Amount uint
	}

	type Animal struct {
		Name string
		Feed
	}
	a := Animal{
		Name: "monkey",
		Feed: Feed{
			Name:   "Banana",
			Amount: 10,
		},
	}

	fmt.Println(a.Amount) // ←本当はa.Feed.Amountと書かないといけないが、今回の場合は一意なので省略可
	fmt.Println(a.Feed.Name)
}

// メソッド
type Point struct{ X, Y int }

// *Point型のメソッド「Render」を定義
// `func`とメッソド名の間に型であるレシーバーを書く
func (p *Point) Render() {
	fmt.Printf("<%d, %d>\n", p.X, p.Y)
}

func main() {
	p := &Point{X: 5, Y: 12}
	p.Render()
}

// 型のコンストラクタ
type User struct {
	Id   int
	Name string
}

// 慣例的に`new`,`New`から関数名を始める
func NewUser(id int, name string) *User {
	u := new(User)
	u.Id = id
	u.Name = name
	return u
}

// interface
// ============================
//
