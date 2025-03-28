section .data
    prompt_n       db "Введите количество чисел (n): ", 0
    prompt_numbers db "Введите числа через пробел или Enter: ", 0
    result_prefix  db "Перевёрнутое: ", 0
    completion_msg db 10, "Все числа обработаны. Программа завершена.", 10, 0
    format_int     db "%d", 0
    newline        db 10, 0

section .bss
    n         resd 1
    num       resd 1
    reversed  resd 1
    isNegative resb 1
    i         resd 1

section .text
    global main
    extern printf
    extern scanf

reverseNumber:
    push rbp
    mov rbp, rsp

    ; Инициализация
    mov dword [rbp-4], 0    ; reversed = 0
    mov byte [rbp-8], 0     ; isNegative = false

    ; Проверка на отрицательное число
    cmp edi, 0
    jge .not_negative
    mov byte [rbp-8], 1     ; isNegative = true
    neg edi                 ; num = -num

.not_negative:
    mov [rbp-12], edi       ; сохраняем num

.reverse_loop:
    cmp dword [rbp-12], 0
    je .end_reverse

    ; digit = num % 10
    mov eax, [rbp-12]
    cdq
    mov ecx, 10
    idiv ecx                ; edx = num % 10

    ; reversed = reversed * 10 + digit
    mov eax, [rbp-4]
    imul eax, 10
    add eax, edx
    mov [rbp-4], eax

    ; num /= 10
    mov eax, [rbp-12]
    cdq
    mov ecx, 10
    idiv ecx
    mov [rbp-12], eax

    jmp .reverse_loop

.end_reverse:
    ; Проверка isNegative
    cmp byte [rbp-8], 0
    je .positive
    neg dword [rbp-4]       ; reversed = -reversed

.positive:
    mov eax, [rbp-4]        ; возвращаем результат
    leave
    ret

main:
    push rbp
    mov rbp, rsp

    ; Вывод "Введите количество чисел (n): "
    mov rdi, prompt_n
    xor eax, eax
    call printf

    ; Ввод n
    mov rdi, format_int
    mov rsi, n
    xor eax, eax
    call scanf

    ; Вывод приглашения для ввода чисел
    mov rdi, prompt_numbers
    xor eax, eax
    call printf

    ; Инициализация цикла
    mov dword [i], 0

.input_loop:
    mov eax, [i]
    cmp eax, [n]
    jge .loop_end

    ; Ввод числа
    mov rdi, format_int
    mov rsi, num
    xor eax, eax
    call scanf

    ; Вызов reverseNumber
    mov edi, [num]
    call reverseNumber
    mov [reversed], eax

    ; Вывод "Перевёрнутое: "
    mov rdi, result_prefix
    xor eax, eax
    call printf

    ; Вывод перевернутого числа
    mov rdi, format_int
    mov esi, [reversed]
    xor eax, eax
    call printf

    ; Вывод новой строки
    mov rdi, newline
    xor eax, eax
    call printf

    ; Инкремент i
    inc dword [i]
    jmp .input_loop

.loop_end:
    ; Вывод сообщения о завершении
    mov rdi, completion_msg
    xor eax, eax
    call printf

    ; Выход
    xor eax, eax
    pop rbp
    ret
