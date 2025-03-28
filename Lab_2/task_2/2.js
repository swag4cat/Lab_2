function displayProcess(step, bottles) {
    console.log(`${step} шаг`);
    for (let i = 0; i < bottles.length; i++) {
        process.stdout.write(`${bottles[i]} `);
        if ((i + 1) % 3 === 0) {
            console.log();  // Форматирование вывода
        }
    }
    console.log();
}

function main() {
    const input = prompt("Введите количество начальных банок и обменный курс: ");
    const [N, M] = input.split(" ").map(Number);

    let totalDrank = N;
    let emptyBottles = N;
    let step = 0;
    let bottles = new Array(N).fill('F');  // Символ F для полных банок

    displayProcess(++step, bottles);

    while (emptyBottles >= M) {
        const newFull = Math.floor(emptyBottles / M);
        emptyBottles = emptyBottles % M + newFull;
        totalDrank += newFull;

        let newBottles = new Array(newFull).fill('F');  // Символ F для полных банок
        displayProcess(++step, newBottles);

        let emptyBottleList = new Array(emptyBottles).fill('E');  // Символ E для пустых банок
        displayProcess(++step, emptyBottleList);
    }

    console.log(`Output: ${totalDrank} ${step}`);
}

main();
