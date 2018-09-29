// type
// ========================

// 数値型
fn main() {
    // 整数 ==================

    // 符号ありnビット整数
    // i64
    // i32
    // i16
    // i8

    // 符号なしnビット整数
    // u64
    // u32
    // u16
    // u8

    // 浮動小数点数 ==================
    // 整数リテラルと区別するために、小数部、指数部、型指定子のどれかは1つは必要

    // f32 // 浮動小数点型(単精度)
    // f64 // 浮動小数点型(倍精度)
    // 1.5, 1., 1e4, 40f32

    // 数値にはどこにアンダースコアを含めてもいい
    // 4_294_967_295
    // 127_u8

    println!("{}", 60.5 as i64);
    println!("{}", 60.5 as u64);
    println!("{}", 605i64);
}

// 文字列型
fn main() {
    // 2種類の文字列型

    // &str
    // - 固定長
    // - immutable
    // - 実態はutf-8のバイト列への参照
    // - ""で括った文字列リテラルの宣言は&str型になる
    // - .to_string()でString型にキャスト
    //     - この操作で、新たにヒープ上にメモリが確保される
    // - 最初に選択するのはこっち
    let string_slice = "hello"; // &strになる

    // String(heap-allocated string)
    // - ヒープメモリ上に配置
    // - utf-8の文字列であることが保証される
    // - 変更可
    // - .as_str()メソッドによって&str方にキャスト
    //     - この操作は参照を取得するだけなので新たなメモリは確保されない
    // - String変数の先頭に`&`を付けても&str型になる
    //   - &をつけるよことによって、変数の参照を取得できる
    // - 文字列の変更操作が必要に慣ればこっち
    // String型同士の`+`での`文字列の連結はできない
    // 変数の先頭に`&`を付けると&str型に変換される
    let heep_string = "world".to_string(); // Stringになる

    println!("{},{}", string_slice, heep_string)
}

fn main() {
    // // 文字列連結
    // // `+`はStringに対して、&strを付加する場合のみ可能
    // let hello = "Hello".to_string();
    // let result = hello + "World";
    // println!("{}", result);
    //
    // // `concat!`を使う
    // // リテラル値にしか使用できない
    // let result2 = concat!("true ", true, " num ", 12);
    // println!("{}", result2);

    // `format!`を使う
    let hello = "Hello";
    let world = "World";

    let result3 = format!("{} {}", hello, world);
    println!("{}", result3)
}

fn main() {
    // 文字列の長さ
    // rustは文字列をUTF-8 encodingとして扱う
    let hello = "Hello";
    let nihongo = "日本語";

    // lenを使う
    // len()は文字列のバイト帳を返す
    println!("{} is {} bytes long", hello, hello.len()); // 5 bytes
    println!("{} is {} bytes long", nihongo, nihongo.len()); // 9 bytes

    // chars()とcount()を使う
    // chars()はUnicode1文字ごとのイテレータを返す
    // count()はそのイテレータに対して実行することで、文字数を取得
    println!("{} is {} unicode chars long", hello, hello.chars().count()); // 5 bytes
    println!(
        "{} is {} unicode chars long",
        nihongo,
        nihongo.chars().count()
    ); // 9 bytes

    // rustでは、文字を全てutf-8で扱うので絵文字を使うことができる
    let eggs = ["🐣", "🐣", "🐣"];
    println!("{}", eggs.join("🥓"))
}

// ===============================
// カスタム型
// ===============================

// 構造体
// ===============================
// structで作成できる構造体

// - タプル
struct Pair(i32, f64);

// - クラシックなC言語の構造体
struct Point {
    x: f64,
    y: f64,
}

// - ユニット
struct Nil;
let _nil = Nil;

// 列挙型
// ===============================
// いくつかの異なる型の中から1つを選ぶ

enum Person {
    Skinny, // ユニットライクな型
    Height(i32), // タプル
    Info { name: String, height: i32 }, // こうぞ伝い
}

// 以下のようにして使う
let larry = Person::Skinny;

// useを使用するとそれ以降、列挙型の型名をいちいち書かなくても良くなる
use Person::{Skinny}
let larry = Skinny


// Option型(列挙型の一つ) =======================
// 値がある、ない、といういずれかの状態を表す

#[derive(Debug)]
struct User {
    name: String,
}

// enum Option<T> {
//     None,
//     Some(T)
// }

fn find_user_by_name(name: &str) -> Option<User> {
    if name == "吉田" {
        let found_person = User {
            name: "吉田".to_string(),
        };
        Some(found_person)
    } else {
        None
    }
}

fn main() {
    let name_1 = "吉田";
    let name_2 = "松田";
    let user_option_1 = find_user_by_name(name_1);
    let user_option_2 = find_user_by_name(name_2);

    // パターンマッチ
    match user_option_1 {
        Some(user_1) => println!("Unwrapped user 1 is {:?}", user_1),
        None => println!("User 1 was not found"),
    }

    match user_option_2 {
        Some(user_2) => println!("Unwrapped user 2 is {:?}", user_2),
        None => println!("User 2 was not found"),
    }
}

// Option型にはmapやmap_or_elseなどの便利なメソッドがある
// map: クロージャを引数に取り、None出ない場合に実行する
// map_or_else: 2つのクロージャを引数にとり、Noneのとき、Someのときに実行する
user_option_1.map_or_else(||println!("None"),
                          |user_1| println!("Some {:?}", user_1));

// ポインタ型

fn main() {}

// 型キャスティング
// ========================


let decimal = 65.4321_f32;
// let integer: u8 = decimal; // 暗黙的な型キャストはできない
let integer = decimal as u8; // `as`を使って型キャストする


// エイリアス
// ========================

// `NanoSecond` を `u64`の別名として使用する。
// エイリアス名はCamelCase
type NanoSecond = u64;



// Generic
// ========================


// `A`という具象型(非ジェネリック型)
struct A;

// ジェネリック型
// Tは型パラメータ
struct SingleGen<T>(T)

// Tに対してジェネリックな関数
fn generic<T>(_s: SGen<T>){} // 関数定義
generic::<char>(SGen('a')); // 関数呼び出し