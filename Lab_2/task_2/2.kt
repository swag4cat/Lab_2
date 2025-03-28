fun displayProcess(step: Int, bottles: MutableList<Char>) {
    println("$step шаг")
    for (i in bottles.indices) {
        print("${bottles[i]} ")
        if ((i + 1) % 3 == 0) println()  // Форматирование вывода
    }
    println()
}

fun main() {
    println("Введите количество начальных банок и обменный курс: ")
    val (N, M) = readLine()!!.split(" ").map { it.toInt() }

    var totalDrank = N
    var emptyBottles = N
    var step = 0
    val bottles = MutableList(N) { 'F' }  // Символ F для полных банок

    displayProcess(++step, bottles)

    while (emptyBottles >= M) {
        val newFull = emptyBottles / M
        emptyBottles = emptyBottles % M + newFull
        totalDrank += newFull
        val newBottles = MutableList(newFull) { 'F' } // Символ F для полных банок
        displayProcess(++step, newBottles)

        val emptyBottleList = MutableList(emptyBottles) { 'E' } // Символ E для пустых банок
        displayProcess(++step, emptyBottleList)
    }

    println("Output: $totalDrank $step")
}
