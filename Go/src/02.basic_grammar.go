// variable
// ============================

var localVariable
var GlobalVariable

// type
// ============================

a := 10
b := 12.3
c := "hoge"
var d bool
e := [...]int{1,3,5} // array
f := []int{1,3,5} // slice

fmt.Printf("a: %d, b: %f, c: %s, d: %t\n", a, b, c, d)
fmt.Println(e)
fmt.Println(f)

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


// map
// ============================
// mapは辞書や連想配列のようなもの

func main() {
  m := map[string]int{"a":100, "b":200}
  fmt.Println(m)

  delete(m, "a")
  fmt.Println(m)

  v, ok := m["b"] // こんなふうに書くとvalueと値が存在するかどうかのbool値を取得できる
  fmt.Println(v)
  fmt.Println(ok)
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

func main() {
  for i := 0; i < 10; i++ {
    if i == 3 { continue }
    if i == 7 { break }
    fmt.Println(i)
  }
}


// while文ライクに書く

func main() {
  i := 0
  for i < 10 {
    fmt.Println(i)
    i++
  }
}
