package main // type
import "fmt"

// ============================
// 型のエイリアスを定義する

func main() {
	type (
		MyInt       int // intにMyIntという名前を付けている(本質的な意味はない、最もシンプルな例)
		IntPair     [2]int
		Strings     []string
		AreaMap     map[string][2]float64 // 複雑な型にAreaMapというエイリアスを定義している
		IntsChannel chan []int
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
	pt := Point{1, 2}

	fmt.Println(pt.X, pt.Y)
}
