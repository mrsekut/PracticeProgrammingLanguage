// 変数宣言
// ========================

fn main() {
    let name = "Taro";
    let mut age: u32 = 26;
    age += 5;
    println!("{} is {} years old.", name, age);
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
