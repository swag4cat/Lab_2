package main

import (
	"fmt"
)

// Функция для переворачивания числа и удаления ведущих нулей
func reverseNumber(num int) int {
	reversed := 0
	for num > 0 {
		reversed = reversed*10 + num%10
		num /= 10
	}
	return reversed
}

func main() {
	var n int
	fmt.Print("Введите количество чисел: ")
	_, err := fmt.Scan(&n)
	if err != nil || n <= 0 {
		fmt.Println("Ошибка ввода. Введите корректное количество чисел.")
		return
	}

	fmt.Printf("Введите %d чисел: ", n)
	for i := 0; i < n; i++ {
		var num int
		_, err := fmt.Scan(&num)
		if err != nil {
			fmt.Println("Ошибка ввода:", err)
			return
		}
		fmt.Print(reverseNumber(num), " ")
	}

	fmt.Println()
}
