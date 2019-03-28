// Class
// ========================================
// 小クラス
// Userクラスを継承する子クラス
class AdminUser(name: String): User(name){
    // defaultで`public`になる
    fun sayHello() {
        println("hello $name")
    }

    override fun over() {
        println("child")
    }

}

// 親クラス
// 親クラスは`open`を付ける必要がある
open class User(var name: String) {  // コンストラクタ引数
    var team = "red" // プロパティ

    // 初期化処理。constructorとは違う
    init {
        println("instance created, name: $name")
    }


    fun sayHi() { // method
        println("hi ${name}") // 自明の場合はthis省略可
    }

    open fun over() { // 小クラスでoverrideするなら`open`が必要
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
// =======================
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
// ========================

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
// ==============================
// データを扱うためのクラス
// - `data`を付ける
// - プライマリコンストラクタが一つ以上の引数を持っている
// - abstract/open/sealed/innerキーワードは使用できない
data class Point(val x: Int, val y: Int)

fun main(args: Array<String>) {
    val p1 = Point(3,5)
    val p2 = Point(3,5)
    println(p1)
    println(if (p1 == p2) "same" else "not same")
}

// data classは自動的に以下のメソッドが自動的に準備される
// - equals, `==`
// - hashCode
// - toString
// - componentnN
// - copy

data class Book(var title: String = "", var pub: String = ""){
	var price: Int = 0
}

fun main(args: Array<String>) {

    // equals
    // - プライマリコンストラクタで定義されたデータの内容が同じならtrue
	val b1 = Book("JS", "Oreilly")
	b1.price = 3000
	val b2 = Book("JS", "Oreilly") // プライマリコンストラクタで定義したデータが同じなので
	b2.price = 4000 // 値段は異なっても、
	println(b1 == b2) // 結果はtrue
	println(b1.equals(b2)) // これでも同じ true

    // toString
    // - プライマリコンストラクタで指定したデータの中身が見れる
    println(b1.toString()) // Book(title=JS, pub=Oreilly)

    // componentnN (sytax sugar)
	var b3 = Book("Kotlin", "Tanaka")
	val (t, p) = b3 // 分割代入ができる
	println(t)
	println(p)

    // Copy
    // - 特定のプロパティだけで変更してコピーできる
	val copied = b1.copy(title="Rust")
	println(copied.toString()) // Book(title=Rust, pub=Oreilly)

}




// Constructor
// ==============================
// プライマリコンストラクタとセカンダリコンストラクタがある

// プライマリコンストラクタ
// - 唯一のコンストラクタ

class Person constructor(amount: Int/* ここで指定するやつ */){
    val amount: Int
    init {
        this.amount = amount
    }
}
// `constructor`は省略可能
// ここでは、シグニチャのみ
// 具体的な初期化処理は、initの中で行う
// しかし、以下のようにだいぶ省略できる
class Person (val amount: Int) { }

// セカンダリコンストラクタ
// - 0子以上のコンストラクタ
// - コンストラクタが２個以上がある場合は2個目以降のコンストラクタがセカンダリコンストラクタになる
class Person(var name: String, var age: Int) {
    constructor(name: String) :this(name, 16){}
    constructor() :this("Tom"){}
}

// companion object
// ====================================
// Javaのstaticメソッド的なもの
class Person private constructor(var name: String){
	companion object Factory {
		fun genInstance(): Person {
			return Person("山田太郎")
		}
	}

	override fun toString(): String {
		return "Person: ${this.name}"
	}
}
fun main(args: Array<String>) {
	val p = Person.genInstance()
	println(p)
}

// Sealed Class
// ============================
// - クラスの継承を制限するための修飾子
// sealed classを継承できるのは
//  - sealed classでネストされたクラス
//  - 同じファイル内で宣言されたクラス

// in Base.kt
sealed class Base {
    // ok
    object SubOne: Base()
    // ok
    object SubTwo: Base()
}

// okk
class SubThree: Base()


// in Other.kt
// ng
object SubFour: Base()