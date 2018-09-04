package main
import (
  "fmt"
  "time"
)

// variable
// ============================

var localVariable
var GlobalVariable

// type
// ============================

a := 10 // int
b := 12.3 // float
c := "hoge" // string
var d bool // boolean
e := [...]int{1,3,5} // array
f := []int{1,3,5} // slice

fmt.Printf("a: %d, b: %f, c: %s, d: %t\n", a, b, c, d)
fmt.Println(e)
fmt.Println(f)

// fmt.Printf
fmt.Printf("10進数=%d, 2進数=%b, 8進数=%o, 16進数=%x\n", 17, 17, 17, 17)

// "%v"なんでもあり
fmt.Printf("10進数=%v, 2進数=%v, 8進数=%v, 16進数=%v\n", 17, 17, 17, 17)

// "%T"はデータ型
fmt.Printf("数値=%T, 文字列=%T, 配列=%T, スライス=%T\n", 17, "golang", [...]int{1, 2, 3}, []int{4, 5, 6})

// iota
const (
  sun = iota
  mon
  tue
)
fmt.Println(sun, mon, tue)


// ビット演算子
// ============================

// AND 論理積 両方1のときのみ1
n := 165 & 155 // n == 129

// OR 論理和 両方が0のときのみ0
n := 197 | 169 // n == 237

// XOR 排他的論理和 片方が1のときのみ1
n := 92 ^ 137  // n == 213

// AND NOT ビットクリア
n := 108 &^ 13 // n == 96

// 左シフト
n := 1 << 1 // n == 2
n := 4 << 2 // n == 16
n = n << 1 // n == 32

// 右シフト
n := 1 >> 1 // n == 0


// pointer
// ============================

a := 5
var pa *int
pa = &a // '&a' は 'a' のアドレス

fmt.Println(pa)
fmt.Println(*pa)


// function
// ============================

// func 関数名(引数 型) (戻り値 型)
func hello(name string) (msg string) {
  msg = "hello " + name
  return
}

// 複数の引数が同じ型なら型の指定は一度のみでいい
func plus(x, y int) int {
	return x + y
}

// 戻り値の型を指定しておけば、returnの部分に書かなくても返ってくる
func doSomething() (x, y int) {
	y = 5
	return // x == 0, y == 5
}

// 無名関数
f := func(x, y int) int { return x + y }
fmt.Println(f(2, 3))

// 高階関数 関数を返す関数
func returnFunc() func() {
	return func() {
		fmt.Println("I'm a function")
	}
}

// 高階関数 関数を引数に取る関数
func callFunction(f func()) {
	f()
}
func main() {
	callFunction(func() {
		fmt.Println("I'm a function")
	})
}

// クロージャ
func later() func(string) string {
	var store string
	return func(next string) string {
		s := store
		store = next
		return s
	}
}
func main() {
	f := later()
	fmt.Println(f("Golang")) // => ""
	fmt.Println(f("is")) // => "Goalng"
	fmt.Println(f("awesome!")) // => "is"
}

// 定数
// ============================

// 複数宣言
const (
  x = 1
  y = 2
  z = 3
)

// 値の省略
const (
  x = 1 // x == 1
  y     // y == 1
  z     // z == 1
)


// switch
// ============================

// 式によるswitch
switch n := 3; n {
case 1, 2:
	fmt.Println("1 or 2")
case 3, 4:
	fmt.Println("3 or 4")
  fallthrough // 次のcaseも実行
default:
	fmt.Println("unknown")
}

// range
// ============================

// slice
s := []int{2,3,4}
for i, v := range s { // index, value
  fmt.Println(i, v)
}

// map
m := map[string]int{"a": 200, "b":300}
for k, v := range m { // key, value
  fmt.Println(k, v)
}



// if
// ============================

if score := 43; score > 80 {
  fmt.Println("Great")
} else if score > 60 {
  fmt.Println("Good")
} else {
  fmt.Println("so so..")
}


// switch
// ============================

signal := "red"
switch signal {
case "red":
  fmt.Println("stop")
case "yellow":
  fmt.Println("Caution")
case "green", "blue":
  fmt.Println("Go")
default:
  fmt.Println("wrong signal")
}


// for
// ============================

for i := 0; i < 10; i++ {
  if i == 3 { continue }
  if i == 7 { break }
  fmt.Println(i)
}


// while文ライクに書く
i := 0
for i < 10 {
  fmt.Println(i)
  i++
}

// 無限ループ
for {
  // 処理
}

// 範囲節によるfor
fruits := [3]string{"Apple", "Banana", "Cherry"}
for i, s := range fruits {
  fmt.Printf("fuits[%d]=%s\n", i, s)
}

// ラベル付き文

LOOP:
	for {
		for {
			for {
				fmt.Println("start")
				break LOOP
			}
			fmt.Println("ここは処理されない")
		}
		fmt.Println("ここは処理されない")
	}
	fmt.Println("Done")


// goto
// ============================

func main() {
	fmt.Println("A")
	goto L // Lにジャンプ
	fmt.Println("B") // 処理されない
L:
	fmt.Println("C")
}

// structure
// ============================

type user struct {
  name string
  score int
}

func main() {

  // pointer
  u := new(user)
  u.name = "abc"
  u.score = 20

  // // data
  // u := user{name:"abc", score:50}

  fmt.Println(u)
}


// method
// ============================

type user struct {
  name string
  score int
}

// receiver
func(u user) show(){
  fmt.Println("name: %s, score: %d\n", u.name, u.score)
}

func(u *user) hit(){
  u.score++
}

func main() {
  u := user{name:"abc", score:50}
  u.hit()
  u.show()
}


// interface
// ============================

type greeter interface {
  greet()
}

type japanese struct {}
type american struct {}

func show(t interface{}) {

  // 型アサーション
  _, ok := t.(japanese)
  if ok {
    fmt.Println("i as japanese")
  } else {
    fmt.Println("i am not japanese")
  }

  // 型switch
  // switch t.(type) {
  // case japanese:
  //   fmt.Println("i am japanese")
  // default:
  //   fmt.Println("i am not japanese")
  // }
}

func (j japanese) greet() {
  fmt.Println("kon")
}

func (a american) greet() {
  fmt.Println("helllo")
}

func main() {
  greeters := []greeter{japanese{}, american{}}
  for _, greeter := range greeters {
    greeter.greet()
    show(greeter)
  }
}


// defer
// ============================

defer res.Body.Close()
// - 関数の終了時に実行する式を登録できる
// - 複数文ある場合は下から実行される
// - ファイルのクローズなどによく使われる


// panicとrecover
// ============================

// - panicを実行すると、ランタイムパニックが発生し、実行中の関数は中断される
// - recoverを実行すると、panicによって発生したランタイムパニックに依るプログラムの中断を回復する
