val s: String = "Scala" // 再代入不可
var s: String = "Scala" // 再代入不可
val s = "Scala" // 型推論あり
lazy val s: String = "Scala" // 遅延束縛


// ブロックの最終行の値を束縛できる
lazy val lazyDate = {
    println("Initializin a date value...")
    new java.util.Date
}


// method定義
def echo(str: String): Unit = println(str)

// class定義
class Printer {
    def echo(str: String): Unit = println(str)
}

val p = new Printer()
p.echo("hello")