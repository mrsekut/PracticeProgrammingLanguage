// 二分法で平方根を求める
const C: f32 = 0.00001;

fn f(x: f32, n: f32) -> f32 {
    x * x - n
}

fn sqrt(n: f32) -> f32 {
    let mut max = n;
    let mut min = 0.0;

    loop {
        let b = (max + min) / 2.0;
        if f(b, n) < 0.0 {
            min = b;
        } else {
            max = b;
        }
        if max - min < C {
            return b
        }
    }
}

fn main() {
    println!("{:?}", sqrt(2.0));
}
