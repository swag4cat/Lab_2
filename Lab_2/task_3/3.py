# Функция для переворачивания числа и удаления ведущих нулей
def reverse_number(num):
    reversed_num = 0
    while num > 0:
        reversed_num = reversed_num * 10 + num % 10
        num //= 10
    return reversed_num

def main():
    n = int(input("Введите количество чисел: "))

    if n <= 0:
        print("Некорректный ввод.")
        return

    numbers = []
    for i in range(n):
        num = int(input(f"Введите число {i + 1}: "))
        numbers.append(reverse_number(num))

    print("Результаты:", " ".join(map(str, numbers)))

if __name__ == "__main__":
    main()
