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



// 配列
// ========================

fn main() {
    let xs: [i32; 5] = [1, 2, 3, 4, 5];
    println!("{:?}", xs);
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

let add_five = | num | num + 5; // １行

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

// ムーブ
// ========================

// - Rustでは所有権の移動のことをムーブという

// 借用
// ========================

// - 所有権を移動せずに変数を出力するだけなら借用で済む
// - 借用を行うためには引数のデータ型宣言の先頭に`&`をつける
