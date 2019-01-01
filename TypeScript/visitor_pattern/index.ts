// TypeScript
interface Visitor<N, R> {
  plus: (e1: Expr<N, R>, e2: Expr<N, R>) => R;
  square: (e: Expr<N, R>) => R;
  num: (e: N) => R;
}

interface Expr<N, R> {
  accept: (v: Visitor<N, R>) => R;
}

class Plus<N, R> implements Expr<N, R> {
  constructor(public e1: Expr<N, R>, public e2: Expr<N, R>) {}

  accept(v: Visitor<N, R>) {
    return v.plus(this.e1, this.e2);
  }
}

class Square<N, R> implements Expr<N, R> {
  constructor(public e: Expr<N, R>) {}

  accept(v: Visitor<N, R>) {
    return v.square(this.e);
  }
}

class Num<N, R> implements Expr<N, R> {
  constructor(public n: N) {}

  accept(v: Visitor<N, R>): R {
    return v.num(this.n);
  }
}

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

class Show implements Visitor<number, string> {
  plus(e1: Expr<number, string>, e2: Expr<number, string>): string {
    return `${e1.accept(this)} + ${e2.accept(this)}`;
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
