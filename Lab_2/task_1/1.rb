def compress_string(s)
    compressed = ""
    count = 1

    (1..s.length).each do |i|
        if i < s.length && s[i] == s[i - 1]
            count += 1
        else
            compressed += "#{s[i - 1]}#{count}"
            count = 1
        end
    end

    if compressed.length < s.length
        compressed
    else
        puts "Сжатие не уменьшило строку. Возвращена исходная строка."
        s
    end
end

print "Введите строку: "
s = gets.chomp
puts "Результат: #{compress_string(s)}"
