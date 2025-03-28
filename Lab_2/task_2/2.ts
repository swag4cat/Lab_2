function displayProcess(step: number, bottles: string[]): void {
    console.log(${step} шаг);
    let line = '';
    for (let i = 0; i < bottles.length; i++) {
        line += ${bottles[i]} ;
        if ((i + 1) % 3 === 0) {
            console.log(line);  // Выводим накопленную строку
            line = '';          // Сбрасываем строку
        }
    }
    if (line) {                 // Выводим оставшиеся банки
        console.log(line);
    }
}

function main() {
    const input = prompt("Введите количество начальных банок и обменный курс: ");
    const [N, M] = input!.split(" ").map(Number);

    let totalDrank = N;
    let emptyBottles = N;
    let step = 0;
    let bottles: string[] = new Array(N).fill('F');  // Символ F для полных банок

    displayProcess(++step, bottles);

    while (emptyBottles >= M) {
        const newFull = Math.floor(emptyBottles / M);
        emptyBottles = emptyBottles % M + newFull;
        totalDrank += newFull;

        const newBottles = new Array(newFull).fill('F');  // Символ F для полных банок
        displayProcess(++step, newBottles);

        const emptyBottleList = new Array(emptyBottles).fill('E');  // Символ E для пустых банок
        displayProcess(++step, emptyBottleList);
    }

    console.log(Output: ${totalDrank} ${step});
}

main();
