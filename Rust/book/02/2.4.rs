// $ cargo run 42 56 などで実行

// WriteとFromStrの2つのトレイトをスコープに読み込む
use std::io::Write;
use std::str::FromStr;

fn gcd(mut n: u64, mut m: u64) -> u64 {
    assert!(n != 0 && m != 0);
    while m != 0 {
        if m < n {
            let t = m;
            m = n;
            n = t;
        }
        m = m % n;
    }
    n
}

fn main() {
    let mut numbers = Vec::new(); // Vecは可変のリストを表すStruct

    // `std::env::args`はイテレータを返す
    for arg in std::env::args().skip(1) {
        // from_strはResult値を返す
        numbers.push(u64::from_str(&arg).expect("error parsing argument"));
    }

    if numbers.len() == 0 {
        writeln!(std::io::stderr(), "Usage: gcd NUMBER...").unwrap();
        std::process::exit(1);
    }

    let mut d = numbers[0];
    // $numbersはnumbersへの参照を借用
    for m in &numbers[1..] {
        // *mは参照mの参照先の値
        d = gcd(d, *m);
    }

    println!("The greatest common divisor of {:?} is {}", numbers, d);
}
