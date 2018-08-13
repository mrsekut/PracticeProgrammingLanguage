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

// slice
// ============================

s := []int{1,2,3}
s = append(s, 8, 12, 34) // 追加
t := make([]int, len(s)) // sと同じ大きさのsliceを宣言
copy(t, s) // コピー
fmt.Println(t)


// map
// ============================
// mapは辞書や連想配列のようなもの

m := map[string]int{"a":100, "b":200}
fmt.Println(m)

delete(m, "a") // 値の削除
fmt.Println(m)

v, ok := m["b"] // こんなふうに書くとvalueと値が存在するかどうかのbool値を取得できる
fmt.Println(v)
fmt.Println(ok)


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


// panic
// ============================

// - panicを実行すると、ランタイムパニックが発生し、実行中の関数は中断される


// goroutine & channel
// ============================

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
