interface Visitor<In, Out> {
  plus: (e1: Expr<In, Out>, e2: Expr<In, Out>) => Out;
  square: (e: Expr<In, Out>) => Out;
  num: (e: In) => Out;
}

interface Expr<In, Out> {
  accept: (v: Visitor<In, Out>) => Out;
}

// 足し算の式
class Plus<In, Out> implements Expr<In, Out> {
  constructor(public e1: Expr<In, Out>, public e2: Expr<In, Out>) {}

  accept(v: Visitor<In, Out>) {
    return v.plus(this.e1, this.e2);
  }
}

// 2乗の式
class Square<In, Out> implements Expr<In, Out> {
  constructor(public e: Expr<In, Out>) {}

  accept(v: Visitor<In, Out>) {
    return v.square(this.e);
  }
}

// 数値の式
class Num<In, Out> implements Expr<In, Out> {
  constructor(public n: In) {}

  accept(v: Visitor<In, Out>): Out {
    return v.num(this.n);
  }
}

// 式の評価を行うVisitor
class Eval implements Visitor<number, number> {
  plus(e1: Expr<number, number>, e2: Expr<number, number>): number {
    return e1.accept(this) + e2.accept(this);
  }

  square(e: Expr<number, number>): number {
    let x = e.accept(this);
    return x * x;
  }

  num(n: number): number {
    return n;
  }
}

// 式に文字列を追加するVisitor
class Show implements Visitor<number, string> {
  plus(e1: Expr<number, string>, e2: Expr<number, string>): string {
    return `${e1.accept(this)}+${e2.accept(this)}`;
  }

  square(e: Expr<number, string>): string {
    return `(${e.accept(this)})^2`;
  }

  num(n: number) {
    return `${n}`;
  }
}

let e = new Plus(new Num(1), new Square(new Plus(new Num(2), new Num(3))));
console.log(e.accept(new Show()));
console.log(e.accept(new Eval()));
