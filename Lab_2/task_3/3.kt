fun reverseNumber(num: Int): Int {
    var reversed = 0
    var number = num
    while (number > 0) {
        reversed = reversed * 10 + number % 10
        number /= 10
    }
    return reversed
}

fun main() {
    print("Введите количество чисел: ")
    val n = readLine()!!.toInt()

    print("Введите $n чисел: ")
    for (i in 0 until n) {
        val num = readLine()!!.toInt()
        print("${reverseNumber(num)} ")
    }

    println()
}
