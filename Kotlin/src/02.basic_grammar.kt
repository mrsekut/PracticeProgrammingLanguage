// 実行
// comile: $ kotlinc 01.helloworld.kt -include-runtime -d 01.helloworld.jar
// exec:   $ java -jar 01.helloworld.jar


/* val // 再代入不可 */
/* var // 再代入可 */

// ${}でprintln内で文字列展開
val name = "taguchi"
println("my name is ${taguchi}")

// if
if (score > 80) {
    println("great")
} else if {
    println("good")
} else {
    println("so so ...")
}

// ifは式なので値を返す
val result = if (score > 80 ) "Great" else "so so ..."

// when
// whenも式
when(num) {
    0 -> println("zero")
    1 -> println("one")
    2, 3 -> println("two or three")
    in 4..10 -> println("Many")
    else -> println("other")
}

// while
while (i < 10){
    println("loop: $i")
    i++
}

// do..while
do {
    println("loop2: $i")
    i++
} while (i < 10)

// for
// break, continueあり
for (i in 0..9) {
    println(i)
}

// function
// 宣言
fun sayHi(name: String = "初期値", age: Int): String{
    return "hi $name ($age"
}

// 関数内部の処理が1行のときはこんなふうにも宣言できる
fun sayHi(): String = "Hi" // 型推論により型は省略可

// Class
class User(var name: String) {  // コンストラクタ引数
    var team = "red"
    // getter
    get() = field.toUpperCase()
    // setter
    set(value) {
        if(value!=""){
            println("hi $name")
        }
    }
    init {
        println("insctance crated: name: $name, team: $team")
    }
    fun sayHi() { // メソッド
        // println("hi ${this.name}")
        println("hi ${name}") // 自明の場合はthis省略可
    }
}

val user = User() // インスタンス作成
println(user.name)
user.sayHi()