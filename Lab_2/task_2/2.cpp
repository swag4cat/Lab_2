#include <iostream>
#include <vector>

using namespace std;

void displayProcess(int step, vector<char> &bottles) {
    cout << step << " шаг" << endl;
    for (size_t i = 0; i < bottles.size(); i++) {
        cout << bottles[i] << " ";
        if ((i + 1) % 3 == 0) cout << endl; // Форматирование вывода
    }
    cout << endl;
}

int main() {
    int N, M;
    cout << "Введите количество начальных банок и обменный курс: ";
    cin >> N >> M;

    int totalDrank = N;
    int emptyBottles = N;
    int step = 0;
    vector<char> bottles(N, 'F'); // Символ F для полных банок

    displayProcess(++step, bottles);

    while (emptyBottles >= M) {
        int newFull = emptyBottles / M;
        emptyBottles = emptyBottles % M + newFull;
        totalDrank += newFull;
        bottles.assign(newFull, 'F'); // Символ F для полных банок
        displayProcess(++step, bottles);

        bottles.assign(emptyBottles, 'E'); // Символ E для пустых банок
        displayProcess(++step, bottles);
    }

    cout << "Output: " << totalDrank << " " << step << endl;
    return 0;
}
