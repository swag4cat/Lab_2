<?php

function displayProcess($step, $bottles) {
    echo $step . " шаг\n";
    foreach ($bottles as $index => $bottle) {
        echo $bottle . " ";
        if (($index + 1) % 3 == 0) {
            echo "\n";  // Форматирование вывода
        }
    }
    echo "\n";
}

echo "Введите количество начальных банок и обменный курс: \n";
fscanf(STDIN, "%d %d", $N, $M);

$totalDrank = $N;
$emptyBottles = $N;
$step = 0;
$bottles = array_fill(0, $N, 'F');  // Символ F для полных банок

displayProcess(++$step, $bottles);

while ($emptyBottles >= $M) {
    $newFull = intdiv($emptyBottles, $M);
    $emptyBottles = $emptyBottles % $M + $newFull;
    $totalDrank += $newFull;

    $newBottles = array_fill(0, $newFull, 'F');  // Символ F для полных банок
    displayProcess(++$step, $newBottles);

    $emptyBottleList = array_fill(0, $emptyBottles, 'E');  // Символ E для пустых банок
    displayProcess(++$step, $emptyBottleList);
}

echo "Output: $totalDrank $step\n";
?>
