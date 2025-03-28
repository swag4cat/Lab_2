import Foundation

func compressString(_ s: String) -> String {
    var compressed = ""
    var count = 1
    let length = s.count

    for i in 1..<length {
        let currentChar = s[s.index(s.startIndex, offsetBy: i)]
        let previousChar = s[s.index(s.startIndex, offsetBy: i - 1)]

        if currentChar == previousChar {
            count += 1
        } else {
            compressed.append("\(previousChar)\(count)")
            count = 1
        }
    }

    compressed.append("\(s[s.index(s.startIndex, offsetBy: length - 1)])\(count)")

    if compressed.count < length {
        return compressed
    } else {
        print("Сжатие не уменьшило строку. Возвращена исходная строка.")
        return s
    }
}

print("Введите строку: ", terminator: "")
if let input = readLine() {
    print("Результат: \(compressString(input))")
}
