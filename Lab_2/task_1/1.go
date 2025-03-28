package main

import (
	"fmt"
	"strconv"
)

func compressString(s string) string {
	var compressed string
	count := 1
	length := len(s)

	for i := 1; i <= length; i++ {
		if i < length && s[i] == s[i-1] {
			count++
		} else {
			compressed += string(s[i-1]) + strconv.Itoa(count)
			count = 1
		}
	}

	if len(compressed) < length {
		return compressed
	} else {
		fmt.Println("Сжатие не уменьшило строку. Возвращена исходная строка.")
		return s
	}
}

func main() {
	var s string
	fmt.Print("Введите строку: ")
	fmt.Scanln(&s)
	fmt.Println("Результат:", compressString(s))
}
