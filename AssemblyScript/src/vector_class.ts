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
