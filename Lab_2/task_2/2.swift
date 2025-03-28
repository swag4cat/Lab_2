import Foundation

func displayProcess(step: Int, bottles: [Character]) {
    print("\(step) шаг")
    for (index, bottle) in bottles.enumerated() {
        print("\(bottle) ", terminator: "")
        if (index + 1) % 3 == 0 {
            print() // Форматирование вывода
        }
    }
    print()
}

func main() {
    print("Введите количество начальных банок и обменный курс: ", terminator: "")
    if let input = readLine() {
        let parts = input.split(separator: " ").map { Int($0)! }
        let N = parts[0]
        let M = parts[1]

        var totalDrank = N
        var emptyBottles = N
        var step = 0
        var bottles: [Character] = Array(repeating: 'F', count: N) // Символ F для полных банок

        displayProcess(step: step + 1, bottles: bottles)
        step += 1

        while emptyBottles >= M {
            let newFull = emptyBottles / M
            emptyBottles = emptyBottles % M + newFull
            totalDrank += newFull

            let newBottles = Array(repeating: 'F', count: newFull) // Символ F для полных банок
            displayProcess(step: step + 1, bottles: newBottles)
            step += 1

            let emptyBottleList = Array(repeating: 'E', count: emptyBottles) // Символ E для пустых банок
            displayProcess(step: step + 1, bottles: emptyBottleList)
            step += 1
        }

        print("Output: \(totalDrank) \(step)")
    }
}

main()
