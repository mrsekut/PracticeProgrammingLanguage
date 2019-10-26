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

// for式
// javaでの二重forループを一重でかけている
for(x <- 1 to 3; y <- 4 until 8) {
    println(x + y)
}

// List(1,2,3).map(i => 1 + i) と同じ感じ
// `e <- List(1,2,3)`でモナドから値を取り出している
val e = for (e <- List(1,2,3) ) yield {
  e + 1
}


// map系メソッドとmatchの比較
option.foreach(f)
option match {
    case Some(v) => f(v)
    case None => // 何もしない
}

option.map(f)
option match {
    case Some(v) => Some(f(v))
    case None => None
}

option.flatMap(f)
option match {
    case Some(v) => Some(v)
    case None => None
}

otpion.getOrElse(defaultValue)
option match {
    case Some(v) => v
    case None => defaultValue
}

either.merge
eiteher match {
    case Right(v) => v
    case Left(v) => v
}

// Try
import scala.util.Try
def div(a: Int, b: Int): Try[Int] = Try(a/b)