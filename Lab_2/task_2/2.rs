use std::io::{self, Write};

fn display_process(step: usize, bottles: &Vec<char>) {
    println!("{} шаг", step);
    for (i, bottle) in bottles.iter().enumerate() {
        print!("{} ", bottle);
        if (i + 1) % 3 == 0 {
            println!(); // Форматирование вывода
        }
    }
    println!();
}

fn main() {
    print!("Введите количество начальных банок и обменный курс: ");
    io::stdout().flush().unwrap();

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let parts: Vec<usize> = input
    .trim()
    .split_whitespace()
    .map(|s| s.parse().unwrap())
    .collect();
    let (n, m) = (parts[0], parts[1]);

    let mut total_drank = n;
    let mut empty_bottles = n;
    let mut step = 0;
    let mut bottles: Vec<char> = vec!['F'; n]; // Символ F для полных банок

    display_process(step + 1, &bottles);
    step += 1;

    while empty_bottles >= m {
        let new_full = empty_bottles / m;
        empty_bottles = empty_bottles % m + new_full;
        total_drank += new_full;

        let new_bottles = vec!['F'; new_full]; // Символ F для полных банок
        display_process(step + 1, &new_bottles);
        step += 1;

        let empty_bottle_list = vec!['E'; empty_bottles]; // Символ E для пустых банок
        display_process(step + 1, &empty_bottle_list);
        step += 1;
    }

    println!("Output: {} {}", total_drank, step);
}
