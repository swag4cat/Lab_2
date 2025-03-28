fun compressString(s: String): String {
    val compressed = StringBuilder()
    var count = 1

    for (i in 1..s.length) {
        if (i < s.length && s[i] == s[i - 1]) {
            count++
        } else {
            compressed.append(s[i - 1]).append(count)
            count = 1
        }
    }

    return if (compressed.length < s.length) {
        compressed.toString()
    } else {
        println("Сжатие не уменьшило строку. Возвращена исходная строка.")
        s
    }
}

fun main() {
    print("Введите строку: ")
    val s = readLine() ?: ""
    println("Результат: ${compressString(s)}")
}
