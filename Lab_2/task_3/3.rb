# Функция для переворачивания числа и удаления ведущих нулей
def reverse_number(num)
    reversed = 0
    while num > 0
        reversed = reversed * 10 + num % 10
        num /= 10
    end
    reversed
end

# Ввод количества чисел
print "Введите количество чисел: "
n = gets.to_i

if n <= 0
    puts "Некорректный ввод."
else
    print "Введите #{n} чисел: "
    n.times do
        num = gets.to_i
        print "#{reverse_number(num)} "
    end
    puts
end
