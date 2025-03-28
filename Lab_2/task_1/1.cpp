#include <iostream>
#include <string>

using namespace std;

string compressString(const string& s) {
    string compressed;
    int count = 1;

    for (size_t i = 1; i <= s.length(); ++i) {
        if (i < s.length() && s[i] == s[i - 1]) {
            ++count;
        } else {
            compressed += s[i - 1] + to_string(count);
            count = 1;
        }
    }

    if (compressed.length() < s.length()) {
        return compressed;
    } else {
        cout << "Сжатие не уменьшило строку. Возвращена исходная строка." << endl;
        return s;
    }
}

int main() {
    string s;
    cout << "Введите строку: ";
    cin >> s;
    cout << "Результат: " << compressString(s) << endl;
    return 0;
}
