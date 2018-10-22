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
// ========================================
// Userクラスを継承する子クラス
class AdminUser(name: String): User(name){
    fun sayHello() {
        println("hello $name")
    }

    override fun over() {
        println("child")
    }

}

// 親クラス
open class User(var name: String) {  // コンストラクタ引数
    var team = "red" // プロパティ

    // 初期化処理。construtor?
    init { 
        println("instance created, name: $name")
    }


    fun sayHi() { // method
        println("hi ${name}") // 自明の場合はthis省略可
    }

    open fun over() {
        println("parent")
    }
}


fun main(args: Array<String>) {
    val user = User("parent") // インスタンス作成
    user.sayHi()
    user.over()


    val admin = AdminUser("child")
    admin.sayHello()
    admin.over()
}

// アクセス修飾子

// - public
// - protected
// - private

// 拡張
// クラスを継承しなくても拡張してメソッドの追加などができる
fun User.sayHello(){
    println("hello $name")
}


// 抽象クラス
abstract class AbsUser { 
    abstract fun sayHi()
}

// 具象クラス
class Japanese: AbsUser() {
    override fun sayHi() {
        println("こんにちは")
    }
}


class American: AbsUser() {
    override fun sayHi() {
        println("hello")
    }
}

fun main(args: Array<String>) {
    val tarou = Japanese()
    val tom = American()

    tarou.sayHi()
    tom.sayHi()
}


// interface

interface Sharable {
    // 抽象プロパティ
    var version: Double 
    // 抽象メソッド
    fun share()
    // メソッド
    fun getInfo() {
        println("share $version")
    }
}

// interfaceの実装
class User: Sharable{
    override var version = 1.1
    override fun share() {
        println(("share"))
    }
}

// generics
class  MyData<T> {
    fun getThree(x: T){
        println(x)
        println(x)
        println(x)
    }
}

// data class
data class Point(val x: Int, val y: Int)

fun main(args: Array<String>) {
    val p1 = Point(3,5)
    val p2 = Point(3,5)
    println(p1)
    println(if (p1 == p2) "same" else "not same")
}

// Collection 
// =========================
// それぞれimmutable/mutableとある

// - List(配列) 
val imList: List<Int> = listOf(20,30,40)
val muList: List<Int> = mutableListOf(20,30,40) // 変更可
println(imList[1])
println(imList.size)
for (v in imList){
    println(v)
}


// - Set(重複なし配列)
val imSet = setOf(5,3,2,5)
val muSet = mutableSetOf(5,3,2,5) // 変更可
println(imSet) // 5,3,2
println(imSet.contains(3)) // 存在確認

// intersect, union, subtractなの集合計算のためのメソッドもある

// - Map(連想配列)
val iuMap: Map<String, Int> = mapOf("taguchi" to 40, "fkoji" to 80)
val muMap: Map<String, Int> = mutableMapOf("taguchi" to 40, "fkoji" to 80) // 変更可
println(iuMap["taguchi"])
println(iuMap.size)
println(iuMap.keys)
println(iuMap.values)
println(iuMap.entries) // all

// collection処理のための関数
// ラムダ式内で`it`を使える
val prices = listOf(53, 43, 32)
prices
    .map {n -> n * 1.08}
    .filter { it > 50} // { n -> n > 50} と同じ意味
    .forEach { println(it) }

// 例外処理
// try catchを使う

// null時の処理
// Nullable型
// `?`とか