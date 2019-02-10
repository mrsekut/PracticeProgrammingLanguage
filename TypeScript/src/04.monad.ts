// Option type in Typescript
// ref: https://qiita.com/qr_gho_staff/items/e7feb079ab7e5d787d56
interface Optional<A> {
  isEmpty: boolean;
  map: <B>(f: (a: A) => B) => Optional<B>;
  bind: <B>(f: (a: A) => Optional<B>) => Optional<B>;
  get(): A;
}

class Just<A> implements Optional<A> {
  isEmpty = false;
  constructor(private value: A) {}

  map<B>(f: (a: A) => B): Just<B> {
    return Some(f(this.value));
  }

  bind<B>(f: (a: A) => Just<B>): Just<B> {
    return f(this.value);
  }

  get(): A {
    return this.value;
  }
}

class Nothing<A> implements Optional<A> {
  isEmpty = true;
  constructor(private value: A) {}

  map<B>(f: (a: A) => B): Nothing<B> {
    return None;
  }

  bind<B>(f: (a: A) => Just<B>): Nothing<B> {
    return None;
  }

  get(): A {
    throw Error('NoSuchElementException');
  }
}

const None = new Nothing(null);

function Some<A>(a: A): Just<A> {
  return new Just(a);
}

const f = (a: any) => new Just('FFF!!!');

// Monad則
// 1. (restun x) >>= f == f x
const a = Some('Monad')
  .bind(f)
  .get();
const b = f('Monad').get();

console.log('1');
console.log(a);
console.log(a === b);

// 2. m >>= return == m
const c = new Just('Monad').bind(Some).get();
const d = Some('Monad').get();
console.log('2');
console.log(c);
console.log(c === d);

// 3. (m >>= f) >>= g === m >>= (\x -> f x >> g)
const g = (x: any) => new Just('GGG!');
const left = new Just('Monad')
  .bind(f)
  .bind(g)
  .get();
const right = new Just('Monad').bind(x => f(x).bind(g)).get();

console.log('3');
console.log(left);
console.log(left === right);
