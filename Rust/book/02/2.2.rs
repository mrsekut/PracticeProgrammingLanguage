fn gcd(mut n: u64, mut m: u64) -> u64 {
    // `mut`でミュータブル(再代入可能)な変数を宣言
    assert!(n != 0 && m != 0); // `!`はマクロ呼出し。関数ではない。
    while m != 0 {
        if m < n {
            let t = m; // `let`はローカル変数宣言
            m = n;
            n = t;
        }
        m = m % n;
    }
    n // `;`がない場合、その式が関数の返り値になる
}

fn main() {
    println!("{}", gcd(24, 18));
}
