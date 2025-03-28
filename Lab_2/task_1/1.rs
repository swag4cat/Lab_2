use std::io::{self, Write};

fn compress_string(s: &str) -> String {
    let mut compressed = String::new();
    let mut count = 1;
    let len = s.len();

    for i in 1..=len {
        if i < len && s.as_bytes()[i] == s.as_bytes()[i - 1] {
            count += 1;
        } else {
            compressed.push(s.chars().nth(i - 1).unwrap());
            compressed.push_str(&count.to_string());
            count = 1;
        }
    }

    if compressed.len() < len {
        compressed
    } else {
        println!("Сжатие не уменьшило строку. Возвращена исходная строка.");
        s.to_string()
    }
}

fn main() {
    print!("Введите строку: ");
    io::stdout().flush().unwrap();

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let input = input.trim();

    println!("Результат: {}", compress_string(input));
}
