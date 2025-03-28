def display_process(step, bottles):
    print(f"{step} шаг")
    for i, bottle in enumerate(bottles):
        print(bottle, end=" ")
        if (i + 1) % 3 == 0:
            print()  # Форматирование вывода
    print()

def main():
    N, M = map(int, input("Введите количество начальных банок и обменный курс: ").split())

    total_drank = N
    empty_bottles = N
    step = 0
    bottles = ['F'] * N  # Символ F для полных банок

    display_process(step + 1, bottles)
    step += 1

    while empty_bottles >= M:
        new_full = empty_bottles // M
        empty_bottles = empty_bottles % M + new_full
        total_drank += new_full

        new_bottles = ['F'] * new_full  # Символ F для полных банок
        display_process(step + 1, new_bottles)
        step += 1

        empty_bottle_list = ['E'] * empty_bottles  # Символ E для пустых банок
        display_process(step + 1, empty_bottle_list)
        step += 1

    print(f"Output: {total_drank} {step}")

if __name__ == "__main__":
    main()
