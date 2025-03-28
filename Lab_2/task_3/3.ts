// Функция для переворачивания числа и удаления ведущих нулей
function reverseNumber(num: number): number {
    let reversed = 0;
    while (num > 0) {
        reversed = reversed * 10 + num % 10;
        num = Math.floor(num / 10);
    }
    return reversed;
}

function main() {
    const n = parseInt(prompt("Введите количество чисел: ") || "0");

    if (isNaN(n) || n <= 0) {
        console.log("Некорректный ввод.");
        return;
    }

    let numbers: number[] = [];
    for (let i = 0; i < n; i++) {
        const num = parseInt(prompt(`Введите число ${i + 1}: `) || "0");
        if (!isNaN(num)) {
            numbers.push(reverseNumber(num));
        }
    }

    console.log("Результаты: ", numbers.join(" "));
}

main();
