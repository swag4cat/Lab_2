<?php

function compressString($s) {
    $compressed = '';
    $count = 1;
    $length = strlen($s);

    for ($i = 1; $i <= $length; $i++) {
        if ($i < $length && $s[$i] === $s[$i - 1]) {
            $count++;
        } else {
            $compressed .= $s[$i - 1] . $count;
            $count = 1;
        }
    }

    if (strlen($compressed) < $length) {
        return $compressed;
    } else {
        echo "Сжатие не уменьшило строку. Возвращена исходная строка.\n";
        return $s;
    }
}

echo "Введите строку: ";
$s = trim(fgets(STDIN));
echo "Результат: " . compressString($s) . "\n";

?>
