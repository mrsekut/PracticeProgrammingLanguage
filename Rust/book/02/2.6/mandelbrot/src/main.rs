extern crate num
use num::Complex;

#[allow(dead_code)]
fn escape_time(c: Complex<f64>, limit: u32) -> Option<u32>{
    let mut z = Complex {re: 0.0, im: 0.0};
    for i in 0..limit {
        z = z * z + c;
        if z.norm_sqr() > 4.0 {
            return Some(i);
        }
    }
    None
}

/*
memo

z.norm_sqr(): zの原点からの距離の二乗を返す

*/
