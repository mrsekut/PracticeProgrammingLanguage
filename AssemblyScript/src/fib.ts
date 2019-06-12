// recursion
export function fib(n: i32): i32 {
  if (n === 1 || n === 2) return 1;
  return fib(n - 1) + fib(n - 2);
}

// export function fib(n: i32): i32 {
//   let a = 0,
//     b = 1;
//   for (let i = 0; i < n; i++) {
//     let t = a + b;
//     a = b;
//     b = t;
//   }
//   return b;
// }
