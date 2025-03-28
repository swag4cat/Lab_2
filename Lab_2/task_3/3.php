<?php

// Функция для переворачивания числа и удаления ведущих нулей
function reverseNumber($num) {
    $reversed = 0;
    while ($num > 0) {
        $reversed = $reversed * 10 + $num % 10;
        $num = intdiv($num, 10);
    }
    return $reversed;
}

echo "Введите количество чисел: ";
$n = (int)fgets(STDIN);

echo "Введите $n чисел: ";
for ($i = 0; $i < $n; ++$i) {
    $num = (int)fgets(STDIN);
    echo reverseNumber($num) . " ";
}

echo PHP_EOL;

?>
