// https://qiita.com/mopp/items/3794dc955f7dc9d8ca63#iterator-%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3
#[derive(Debug)]
struct Container {
    buf: Vec<u32>,
    index: usize,
}

impl Container {
    fn new() -> Container {
        Container {
            buf: Vec::new(),
            index: 0,
        }
    }

    fn add(&mut self, t: u32) {
        self.buf.push(t);
    }
}

impl Iterator for Container {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        match self.index < self.buf.len() {
            true => {
                let t = Some(self.buf[self.index]);
                self.index += 1;
                t
            }
            false => None,
        }
    }
}

fn main() {
    let mut c: Container = Container::new();
    c.add(10);
    c.add(20);
    c.add(30);

    for i in c {
        println!("{}", i);
    }