use std::io;

fn main() {
    let mut guess = String::new();
    io::stdin()
        .read_line(&mut guess)
        .expect("failed to read line"); // Errのときこの行が実行

    let guess: u32 = guess.trim().parse().expect("please type a number")
    print!("number: {:?}", guess);
}
