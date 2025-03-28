function compressString(s: string): string {
    let compressed = "";
    let count = 1;

    for (let i = 1; i <= s.length; i++) {
        if (i < s.length && s[i] === s[i - 1]) {
            count++;
        } else {
            compressed += s[i - 1] + count;
            count = 1;
        }
    }

    if (compressed.length < s.length) {
        return compressed;
    } else {
        console.log("Сжатие не уменьшило строку. Возвращена исходная строка.");
        return s;
    }
}

function main(): void {
    const s = prompt("Введите строку:");
    if (s !== null) {
        console.log("Результат:", compressString(s));
    }
}

main();
