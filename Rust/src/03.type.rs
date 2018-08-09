// type
// ========================

// 数値型
fn main() {
    // i64
    // i32
    // i16
    // i8

    // u64
    // u32
    // u16
    // u8

    // f32
    // f64

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

// 列挙型

// Option型(列挙型の一つ)
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
