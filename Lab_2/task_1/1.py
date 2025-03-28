def compress_string(s):
    compressed = ''
    count = 1

    for i in range(1, len(s) + 1):
        if i < len(s) and s[i] == s[i - 1]:
            count += 1
        else:
            compressed += s[i - 1] + str(count)
            count = 1

    if len(compressed) < len(s):
        return compressed
    else:
        print("Сжатие не уменьшило строку. Возвращена исходная строка.")
        return s

s = input("Введите строку: ")
print("Результат:", compress_string(s))
