def display_process(step, bottles)
    puts "#{step} шаг"
    bottles.each_with_index do |bottle, i|
        print "#{bottle} "
        puts if (i + 1) % 3 == 0  # Форматирование вывода
    end
    puts
end

def main
    print "Введите количество начальных банок и обменный курс: "
    N, M = gets.split.map(&:to_i)

    total_drank = N
    empty_bottles = N
    step = 0
    bottles = Array.new(N, 'F')  # Символ F для полных банок

    display_process(step + 1, bottles)
    step += 1

    while empty_bottles >= M
        new_full = empty_bottles / M
        empty_bottles = empty_bottles % M + new_full
        total_drank += new_full

        new_bottles = Array.new(new_full, 'F')  # Символ F для полных банок
        display_process(step + 1, new_bottles)
        step += 1

        empty_bottle_list = Array.new(empty_bottles, 'E')  # Символ E для пустых банок
        display_process(step + 1, empty_bottle_list)
        step += 1
    end

    puts "Output: #{total_drank} #{step}"
end

main
