// double number
class Var {
  constructor(private _x: i32, private _dx: i32) {}

  x(): i32 {
    return this._x;
  }

  dx(): i32 {
    return this._dx;
  }
}

function add(x: i32, y: i32): i32;
function add(x: Var, y: Var): Var;
function add(x: i32, y: Var): Var;
function add(x: Var, y: Var): Var;
function add(x: i32 | Var, y: i32 | Var): i32 | Var {
  if (typeof x === 'i32') {
    if (typeof y === 'i32') {
      return x + y;
    }
    return new Var(x+y.(), y.dx());
  }
  if(typeof y === 'i32'){
    return new Var(x.x() + y.x(), x.dx() + y.dx());
  }
  return new Var(x.x() + y.x(), x.dx() + y.dx())
}

// // double number
// export const variable = (x: i32): Var => new Var(x, 1);

// export class Var {
//   constructor(private _x: i32, private _dx: i32) {}

//   x(): i32 {
//     return this._x;
//   }

//   dx(): i32 {
//     return this._dx;
//   }
// }

// export function add(x: Var, y: Var): Var {
//   return new Var(x.x() + y.x(), x.dx() + y.dx());
// }

// function sub(x: Var, y: Var): Var {
//   return new Var(x.x() - y.x(), x.dx() - y.dx());
// }

// function mul(x: Var, y: Var): Var {
//   return new Var(x.x() * y.x(), x.dx() * y.dx());
// }

// function div(x: Var, y: Var): Var {
//   return new Var(x.x() / y.x(), x.dx() / y.dx());
// }

// // export function main(): i32 {
// //   const _1 = variable(5);
// //   const _2 = variable(5);
// //   const a = add(_1, _2);
// //   return a.dx();
// // }