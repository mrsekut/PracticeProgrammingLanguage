// TypeScript
interface Visitor<N, R> {
  plus: (e1: Expr<N>, e2: Expr<N>) => R;
  square: (e: Expr<N>) => R;
  num: (e: N) => R;
}

interface Expr<N> {
  accept: <R>(v: Visitor<N, R>) => R;
}

class Plus<N> implements Expr<N> {
  constructor(public e1: Expr<N>, public e2: Expr<N>) {}

  accept<R>(v: Visitor<N, R>) {
    return v.plus(this.e1, this.e2);
  }
}

class Square<N> implements Expr<N> {
  constructor(public e: Expr<N>) {}

  accept<R>(v: Visitor<N, R>) {
    return v.square(this.e);
  }
}

class Num<N> implements Expr<N> {
  constructor(public n: N) {}

  accept<R>(v: Visitor<N, R>) {
    return v.num(this.n);
  }
}

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

class Show implements Visitor<number, string> {
  plus(e1: Expr<number>, e2: Expr<number>): string {
    return `${e1.accept(this)} + ${e2.accept(this)}`;
  }

  square(e: Expr<number>): string {
    return `(${e.accept(this)})^2`;
  }

  num(n: number) {
    return `${n}`;
  }
}

let e = new Plus(new Num(1), new Square(new Plus(new Num(2), new Num(3))));
console.log(e.accept(new Show()));
console.log(e.accept(new Eval()));
