// export class Vec_3 {
//   constructor(public x: f64 = 0.0, public y: f64 = 0.0, public z: f64 = 0.0) {}

//   @inline
//   @operator('+')
//   protected add_vector(value: Vec_3): Vec_3 {
//     return new Vec_3(this.x + value.x, this.y + value.y, this.z + value.z);
//   }

//   public get length(): f64 {
//     return Math.sqrt(this.x * this.x + this.y * this.y + this.z + this.z);
//   }
// }

export class Vec {
  mX: i32;
  mY: i32;
  constructor(x: i32 = 0, y: i32 = 0) {
    this.mX = x;
    this.mY = y;
  }
  add(b: Vec): Vec {
    return new Vec(this.mX + b.mX, this.mY + b.mY);
  }
  getX(): i32 {
    return this.mX;
  }
  getY(): i32 {
    return this.mY;
  }

  get x(): i32 {
    return this.mX;
  }
  get y(): i32 {
    return this.mY;
  }
  set x(value: i32) {
    this.mX = value;
  }
  set y(value: i32) {
    this.mY = value;
  }
}

export function init(): i32 {
  const zero = new Vec(1, 0);
  const one = new Vec(2, 3);
  return zero.add(one).x;
}
