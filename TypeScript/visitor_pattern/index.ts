// 式 ::= 式 + 式 | (式)^2 | 数値
// 1 + (2 + 3)^2 // => 26

interface Visitor<N, R> {
  plus: (e1: Expr<N>, e2: Expr<N>) => R;
  square: (e: Expr<N>) => R;
  num: (e: N) => R;
}

interface Expr<N> {
  accept: (v: Visitor<N, any>) => any; // TODO:
}

// 足し算の式
class Plus<N> implements Expr<N> {
  constructor(public e1: Expr<N>, public e2: Expr<N>) {}

  accept(v: Visitor<N, any>) {
    return v.plus(this.e1, this.e2);
  }
}

// 2乗の式
class Square<N> implements Expr<N> {
  constructor(public e: Expr<N>) {}

  accept(v: Visitor<N, any>) {
    return v.square(this.e);
  }
}

// 数値の式
class Num<N> implements Expr<N> {
  constructor(public n: N) {}

  accept(v: Visitor<N, any>) {
    return v.num(this.n);
  }
}

// 式の評価を行うVisitor
class Eval implements Visitor<number, number> {
  plus(e1: Expr<number>, e2: Expr<number>): number {
    return e1.accept(this) + e2.accept(this);
  }

  square(e: Expr<number>): number {
    let x = e.accept(this);
    return x * x;
  }

  num(n: number): number {
    return n;
  }
}

// 式に文字列を追加するVisitor
class Show implements Visitor<number, string> {
  plus(e1: Expr<number>, e2: Expr<number>): string {
    return `${e1.accept(this)}+${e2.accept(this)}`;
  }
  square(e: Expr<number>): string {
    return `(${e.accept(this)})^2`;
  }
  num(n: number) {
    return `${n}`;
  }
}

let _2 = new Num('2');
let _3 = new Num('3');
console.log(_2);
console.log(_3);

// let sq = new Square(_2);
// console.log(sq);
// console.log(sq.accept(new Eval()));
// console.log(sq.accept(new Show()));

let pl = new Plus(_2, _3);
console.log(pl.accept(new Eval()));
console.log(pl.accept(new Show()));

// let e = new Plus(new Num(1), new Square(new Plus(new Num(2), new Num(3))));
// console.log(e.accept(new Show()));
// console.log(e.accept(new Eval()));
