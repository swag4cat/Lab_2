package main

import (
	"fmt"
)

func displayProcess(step int, bottles []rune) {
	fmt.Printf("%d шаг\n", step)
	for i, bottle := range bottles {
		fmt.Printf("%c ", bottle)
		if (i+1)%3 == 0 {
			fmt.Println() // Форматирование вывода
		}
	}
	fmt.Println()
}

func main() {
	var N, M int
	fmt.Print("Введите количество начальных банок и обменный курс: ")
	fmt.Scanf("%d %d", &N, &M)

	totalDrank := N
	emptyBottles := N
	step := 0
	bottles := make([]rune, N)
	for i := range bottles {
		bottles[i] = 'F' // Символ F для полных банок
	}

	displayProcess(step+1, bottles)
	step++

	for emptyBottles >= M {
		newFull := emptyBottles / M
		emptyBottles = emptyBottles%M + newFull
		totalDrank += newFull

		newBottles := make([]rune, newFull)
		for i := range newBottles {
			newBottles[i] = 'F' // Символ F для полных банок
		}
		displayProcess(step+1, newBottles)
		step++

		emptyBottleList := make([]rune, emptyBottles)
		for i := range emptyBottleList {
			emptyBottleList[i] = 'E' // Символ E для пустых банок
		}
		displayProcess(step+1, emptyBottleList)
		step++
	}

	fmt.Printf("Output: %d %d\n", totalDrank, step)
}
