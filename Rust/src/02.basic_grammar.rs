// 変数宣言
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




// タプル
// ========================

fn make_tuple() -> (u32, String) {
    (70, "hello".to_string())
}
fn main() {
    // タプル
    let basic_tuple = (70, "hello");
    println!("{:?}", basic_tuple.0);
    println!("{:?}", basic_tuple.1);

    let (number, word) = make_tuple();
    println!("{:?}", number);
    println!("{:?}", word);
}

// 構造体
// ========================

#[derive(Debug)] // `{:?}`を使用するためには`Debug`が必要
struct Drink {
    name: String,
    price_in_yen: u32,
}

#[derive(Debug)]
struct VendingMachine {
    drinks: Vec<Drink>, // Vecは可変のリストを表すStruct
    cash_balance: u64,
}

fn main() {
    let drink = Drink {
        name: "Dr.Pepper".to_string(),
        price_in_yen: 120,
    };

    println!("{:?}", drink); // debug print
    println!("{:#?}", drink); // pretty debug print. 構造化されたオブジェクトを改行とインデントを伴って出力

    let mut machine = VendingMachine {
        drinks: Vec::new(), // `Vec::new()`で空のベクターを作製
        cash_balance: 0,
    };

    machine.drinks.push(drink);

    println!("{:?}", drink); // compiler error
    println!("{:?}", machine); // debug print
    println!("{:#?}", machine); // pretty debug print. 構造化されたオブジェクトを改行とインデントを伴って出力
}

// 修正版
#[derive(Debug)] // `{:?}`を使用するためには`Debug`が必要
struct Drink {
    name: String,
    price_in_yen: u32,
}

impl Drink {
    fn new(name: &str, price_in_yen: u32) -> Drink {
        Drink {
            name: name.to_string(),
            price_in_yen: price_in_yen,
        }
    }
}

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
