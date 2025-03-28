import Foundation

// Функция для переворачивания числа и удаления ведущих нулей
func reverseNumber(_ num: Int) -> Int {
    var reversed = 0
    var number = num
    while number > 0 {
        reversed = reversed * 10 + number % 10
        number /= 10
    }
    return reversed
}

print("Введите количество чисел: ", terminator: "")
if let nInput = readLine(), let n = Int(nInput), n > 0 {
    print("Введите \(n) чисел: ", terminator: "")

    for _ in 0..<n {
        if let numInput = readLine(), let num = Int(numInput) {
            print(reverseNumber(num), terminator: "\n")
        }
    }

    print()
} else {
    print("Некорректный ввод.")
}
