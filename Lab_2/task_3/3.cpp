#include <iostream>

using namespace std;

// Функция для переворачивания числа и удаления ведущих нулей
int reverseNumber(int num) {
    int reversed = 0;
    while (num > 0) {
        reversed = reversed * 10 + num % 10;
        num /= 10;
    }
    return reversed;
}

int main() {
    int n;
    cout << "Введите количество чисел: ";
    cin >> n;

    cout << "Введите " << n << " чисел: ";
    for (int i = 0; i < n; ++i) {
        int num;
        cin >> num;
        cout << reverseNumber(num) << " ";
    }

    cout << endl;
    return 0;
}
