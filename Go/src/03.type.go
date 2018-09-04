// ============================
//
// 値型
//
// ============================

// 論理値型
// ============================

// bool

var b bool
fmt.Printf("b: %T\n", b)

// 数値型
// ============================

// int 符号付き整数型
i8 := int8(127)
i16 := int16(127)
i32 := int32(127)
i64 := int64(127)
fmt.Printf("i8: %T, i16: %T, i32: %T, i64: %T\n", i8, i16, i32, i64)


// int 符号なし整数型
i8 := uint8(127)
i16 := uint16(127)
i32 := uint32(127)
i64 := uint64(127)
fmt.Printf("i8: %T, i16: %T, i32: %T, i64: %T\n", i8, i16, i32, i64)

// int
i := 10
fmt.Printf("i: %T", i)

// float 浮動小数点型
f32 := float32(127)
f64 := 127.0
fmt.Printf("f32: %T, f64: %T\n", f32, f64)

// 複素数型
c := 1.0 + 3i // or complex(1, 3)
d := complex64(c)
fmt.Printf("%T\n", c)
fmt.Printf("%T\n", d)

real(c) // == 1.0
imag(c) // == 3.0


// 文字列型
// ============================

// rune型
// 文字列型の定数
// Unicodeコードポイントを表す特殊な整数型
r := '松' // single quote
fmt.Printf("%T", r)

// string
s := "abc"
fmt.Printf("s: %T\n", s)


// 配列型
// ============================

a := [...]int{1, 2, 3, 4, 5}
fmt.Printf("%T", a)


// interface{}型
// ============================

var x interface{}
fmt.Printf("%T", x) // => <nil>


// ============================
//
// 参照型
//
// - make関数をつかって生成する
// ============================

// slice
// ============================
// 可変長配列

s := []int{1, 2, 3}
s = append(s, 8, 12, 34) // 追加
t := make([]int, len(s)) // sと同じ大きさのsliceを宣言
copy(t, s) // コピー
fmt.Println(t)

s1 := make([]int, 5, 10) // 第三引数で容量を指定できる
fmt.Println(len(s1)) // 要素数
fmt.Println(cap(s1)) // 容量

s := []int{1, 2, 3}
s = append(s, 4, 5, 6) // appendで要素を追加

s1 := []int{1, 2, 3}
s2 := []int{4, 5, 6}
s3 := append(s1, s2...) // sliceにsliceを追加するときは`...`を付ける

// 参照型とは
func pow(a []int) {
	for i, v := range a {
		a[i] = v * v
	}
	return
}
func main() {
	a := []int{1, 2, 3}
	pow(a)
	fmt.Println(a) // => "[1, 4, 9]"
  // スライスではなく配列の場合はこのような結果にはならない
}

// map
// ============================
// mapは辞書や連想配列のようなもの

// make関数を使った宣言
m := make(map[string]string) // map[keyの型]要素の型

m := map[string]int{"a":100, "b":200}
fmt.Println(m)

delete(m, "a") // 値の削除
fmt.Println(m)

v, ok := m["b"] // こんなふうに書くとvalueと値が存在するかどうかのbool値を取得できる
fmt.Println(v)
fmt.Println(ok)

// channel
// ============================
// goroutineとgoroutineの間でデータの受け渡しを司るためにデザインされたデータ構造

var ch1 <-chan int // ch1はint型の「受信専用」チャネル
var ch2 chan<- int // ch2はint型の「送信専用」チャネル

ch := make(chan int, 8) // 第2引数でバッファサイズを指定

func task1(result chan string) { // 疑似的な重い処理
  time.Sleep(time.Second * 2)
  result <- "task1 result"
}

func task2() { // 擬似的な軽い処理
  fmt.Println("task2 finished")
}

func main() {
  result := make(chan string)

  go task1(result)
  go task2()

  fmt.Println(<-result)

  time.Sleep(time.Second * 3)
}

// ============================
// ポインタ型
// ============================
