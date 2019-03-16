// 出力
// ========================

fn main() {
    format! // String型で書き込む
    print! // コンソールに出力
    println! // print!と同じで改行付き
}

// 変数宣言
// ========================

// 定数
fn main() {
    const THRESHOLD: i32 = 10; // 不変の値
    static LANGUAGE: &'static str = "Rust" // staticなライフタイムを持つミュータブルな値
}


// 変数
fn main() {
    let normal: f64 = 1.0; // 通常の宣言
    let normal = 1.0; // 明示的に型を書かなくても型推論が効く
    let not_suffix = 3.0 // 型推論があるので型は省略できる
    let _unused_variable = 3u32; // 使用されていない変数はエラーがでる。頭にアンダースコアを付けるとエラーを出さないようにできる
}

// 式文
// ========================
// 行末にセミコロン

let x = 5u32; // 変数束縛

2 * x; // 式文


// 条件分岐
// ========================

// if
// 条件式に括弧は不要

if n < 0 {
    print!("{} is negative", n);
} else if n > 0 {
    print!("{} is positive", n);
} else {
    print!("{} is zero", n);
}

// 無限ループ

loop {
    // breakやcontinueなどでループを抜けたりできる

    // labelを使うとネストされたループも抜けられる
    'outer: loop {
        'inner: loop{
            break 'outer;
        }
    }

}


// while
// ========================

while n < 101 {
    // なんかの処理
}


// for文
// ========================

for n in 1..101 {
    // なんかの処理
}


// match
// ========================
// パターンマッチング
let number = 13;
match number {
    // 単一の値とのマッチをチェック
    1 => println!("One!"),
    // いくつかの値とのマッチをチェック
    2 | 3 | 5 | 7 | 11 => println!("This is a prime"),
    // 特定の範囲の値とのマッチをチェック
    13...19 => println!("A teen"),
    // その他の場合の処理
    _ => println!("Ain't special"),
}


// ガード
let pair = (2, -2);
match pair {
    (x, y) if x == y => println!("These are twins"),
    //     ^ `if`とそれに続く条件式がガードです。
    (x, y) if x + y == 0 => println!("Antimatter, kaboom!"),
    (x, _) if x % 2 == 1 => println!("The first one is odd"),
    _ => println!("No correlation..."),
}


// バインディング
// 分岐先で値を使用する場合はバインディングが必要
// ここではprintlnないでnを使用したいケース
match age() {
    0             => println!("I'm not born yet I guess"),
    n @ 1  ... 12 => println!("I'm a child of age {:?}", n),
    n @ 13 ... 19 => println!("I'm a teen of age {:?}", n),
    n             => println!("I'm an old person of age {:?}", n),
}

// 配列
// ========================

fn main() {
    let xs: [i32; 5] = [1, 2, 3, 4, 5];
    println!("{:?}", xs);
}

// 連想配列 hashmap
// ========================
// - https://qiita.com/garkimasera/items/a6df4d1cd99bc5010a5e
fn main() {
    use std::collections::HashMap;
    let mut map = HashMap::new();
    map.insert("lisp", 1958);
    map.insert("c", 1972);
    map.insert("rust", 2006);

    println!("{:?}", map);
}


// 関数
// ========================

fn gcd(mut n: u64, mut m: u64) -> u64 { // `mut`でミュータブル(再代入可能)な変数を宣言
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


// メソッド
// ========================
// オブジェクトに付属した関数
// impl句によって定義する
impl Point {
    fn new(x: f64, y: f64) -> Point {
        Point {x: x, y: y}
    }
}



// 構造体
// ========================

#[derive(Debug)]
struct VendingMachine {
    drinks: Vec<Drink>, // Vecは可変のリストを表すStruct
    cash_balance: u64,
}

// 実態を追加するために`impl`をStructに対し付加する
impl VendingMachine {
    fn new() -> VendingMachine {
        // static method. `self`を引数に取らない
        // VendingMachineのインスタンスを返す
        VendingMachine {
            drinks: Vec::new(), // `Vec::new()`で空のベクターを作製
            cash_balance: 0,
        }
    }

    // メソッドがstructに対して、何らかの変更を加えるものである場合は、自己参照(self)の前に`mut`を付ける必要があるので、
    // その表記は`&mut self`といった感じになる
    fn add_drink(&mut self, drink: Drink) {
        self.drinks.push(drink);
    }
}


// Generics


// Car構造体にDropというトレイトを実装
// `for`を使う
impl Drop for Car {
    fn drop(&mut self) {
        println!("this will be destroyed: {:#?}", self);
    }
}


fn main() {
    let drink = Drink::new("Dr.Pepper", 120);
    println!("{:?}", drink); // debug print
    println!("{:#?}", drink); // pretty debug print. 構造化されたオブジェクトを改行とインデントを伴って出力

    let mut machine = VendingMachine::new();

    // machine.drinks.push(drink);
    machine.add_drink(drink);

    // println!("{:?}", drink); // compiler error
    println!("{:?}", machine); // debug print
    println!("{:#?}", machine); // pretty debug print. 構造化されたオブジェクトを改行とインデントを伴って出力
}


// クロージャ
// ========================
// 自身が定義された環境の外側の変数を参照できるような関数のこと

let closure_annotated = |i: i32| -> i32 { i + 1 }; // 型アノテーションあり
let closure_inferred = |i| i + 1; // 型アノテーションなし
let one = || 1; // 引数を取らないクロージャ
closure_annotated(i);

let multiline_add_five | num | { // 複数行
    println!("Adding five!", );
    num + 5 // returnする場合は`;`は不要
}

// クロージャを返す関数
// 関数宣言時の返り値の型は`Box<>`で囲う
fn make_power_function(power: u32) -> Box<Fn(i64) -> i64> {
    Box::new(move |a| a.pow(power)) // moveを使用することで`power`変数は`make_power_function`関数の実行中のみの寿命になる
}

fn main() {
    let power_function = make_power_function(3);
    println!("2^3 = {}", power_function(2));
}

// イテレータ
// ========================

// コレクションを繰り返し処理するための基本的な仕組み

fn main() {
    // let mut iter = 0..5;
    // loop {
    //     match iter.next() {
    //         Some(num) => println!("{}", num),
    //         None => break,
    //     }
    // }

    // ↓ 上と同じものをより完結に書く

    // let mut iter = 0..5;
    // // while let PATTERN = EXPRESSION。ループとパターンマッチを同時に。
    // while let Some(num) = iter.next() {
    //     println!("{}", num);
    // }

    // ↓ 上と同じものをfor文で

    for num in 0..5 {
        println!("{}", num);
    }
}

// 無限イテレータ
let infinite_iterator = 100..;
// これは遅延評価されるので、take()などで取り出す個数を指定して使う
let first_20 = infinite_iterator.take(20);


let infinite_iterator = 100..; // 無限イテレータ
// filterやクロージャやtakeを組み合わせてイテレータの内容を条件式で絞り込む
let first_even_20 = infinite_iterator.filter(|n| n % 2 == 0).take(20);

for n in first_even_20 {
    println!("{}", n);
}

// find()メソッドで一つの要素を抜き出す
let mut infinite_iterator = 100..;
let search_result = infinite_iterator.find(|n| n % 47 == 0);
search_result.map(|n| {
    println!("{}", n);
});

// position()メソッドで、ある要素がVector内のどこに位置するかを知れる
let fruit = vec![
    "Apple",
    "Banana",
    "Strawberry",
    "Orange",
    "Cherry",
    "Watermelon",
    "Pear",
];
let Watermelon_index = fruit.iter().position(|&f| f == "Watermelon");
match Watermelon_index {
    Some(i) => println!("index: {}", i),
    None => println!("No watermelon found"),
}