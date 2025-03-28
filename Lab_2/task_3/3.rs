use std::io;

fn reverse_number(mut num: i32) -> i32 {
    let mut reversed = 0;
    while num > 0 {
        reversed = reversed * 10 + num % 10;
        num /= 10;
    }
    reversed
}

fn main() {
    let mut input = String::new();
    println!("Введите количество чисел:");
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();

    println!("Введите {} чисел:", n);
    for _ in 0..n {
        let mut num_input = String::new();
        io::stdin().read_line(&mut num_input).unwrap();
        let num: i32 = num_input.trim().parse().unwrap();
        print!("{} ", reverse_number(num));
    }

    println!();
}
