// 途中
// // ==========================================================
// // // https://ryota-ka.hatenablog.com/entry/2017/12/21/000000
// https://twitter.com/0918nobita
// // ==========================================================
type True = 'true';
type False = 'false';
type Bool = True | False;

// CondはBoolの部分型
// 最後の[Cond]はindex type https://www.typescriptlang.org/docs/handbook/advanced-types.html#index-types
// 三項演算子は？
// If<a,b,c> == a ? b : c
type If<Cond extends Bool, Then, Else> = {
  false: Else;
  true: Then;
}[Cond];

type Zero = { isZero: True };
type Nat = Zero | { isZero: False; pred: Nat };

// successort/predecessor natural number
type Succ<N extends Nat> = { isZero: False; pred: N };
type Pred<N extends Succ<Nat>> = N['pred'];
type IsZero<N extends Nat> = N['isZero'];

// Nat
type _0 = Zero;
type _1 = Succ<_0>;
type _2 = Succ<_1>;

// let one: Succ<_0>;
let two: Succ<_1>;
let three: Succ<_2>;
// let zero: Pred<_1>;

// sum
// ちょっと工夫した
// https://github.com/Microsoft/TypeScript/issues/14174#issuecomment-389803838
// https://qiita.com/Quramy/items/b45711789605ef9f96de#type-inference-in-conditional-types
// type Add<M extends Nat, N extends Nat> = M extends Succ<infer T>
//   ? { isZero: 'false'; pred: Add<T, Pred<N>> } // (m + (n - 1))
//   : N;

// Add :: Nat -> Nat -> Nat
// Add<_1, _2> = _3 = Succ<Succ<Succ<Zero>>>
// type Add<M extends Nat, N extends Nat> = If<Gt<N, Zero>, Add<M, Pred<N>>, M>;
type Add<M extends Nat, N extends Nat> = {
  false: any;
  true: any;
};

// Gt
// Gt :: Nat -> Nat -> Bool
type Gt<M extends Nat, N extends Nat> = {
  false: If<IsZero<N>, False, Gt<Pred<M>, Pred<N>>>;
  true: any;
};

// >= Gteq :: Nat -> Nat -> Bool
// use: Gteq<_3, _5> -> False
// type Gteq<N extends Nat, M extends Nat> =
//   If<IsZero<Pred<N>>, False,Gteq<Pred<M>, Pred<N>>? :

// type Upto<N extends M> = If<IsZero<N>, Zero, N | Upto<Pred<Nat>>>
// type Upto<N extends Nat> = {
//   false: N | Upto<N['pred']>;
//   true: Zero;
// }[IsZero<N>];

// ==========================================================
// https://qiita.com/uhyo/items/da21e2b3c10c8a03952f#%E5%88%86%E9%85%8D%E3%81%95%E3%82%8C%E3%82%8B%E3%81%AE%E3%81%AF%E5%9E%8B%E5%A4%89%E6%95%B0%E3%81%AE%E3%81%BF
// ==========================================================
// option型を作る
type None = { type: 'None' };
type Some<T> = { type: 'Some'; value: T };
type Option<T> = None | Some<T>;

// // conditional type
// type ValueOfOption<V extends Option<unknown>> = V extends Some<infer R>
//   ? R
//   : undefined;
// const opt1: Some<number> = { type: 'Some', value: 123 };
// const val1: ValueOfOption<typeof opt1> = 1112345;

// console.log(val1);

// ==============================================
type Common<T, U> = T extends U ? never : T; // Remove types from T that are assignable to U
type Diff<T, U> = Pick<T, Common<keyof T, keyof U>>;

// interface UserA {
//   name: string;
//   age: number;
//   email: string;
//   phone: string;
// }
// interface UserB {
//   name: string;
//   age: number;
//   sex: Sex;
// }

// enum Sex {
//   'Male',
//   'Female'
// }
// type CommonProperties = Common<UserB, UserA>; // inferred as { one: string; two: number; }

// type DiffProperties = Diff<UserA, UserB>; // inferred as { one: string; two: number; }

// =====================
// =====================
// =====================
// ======================
