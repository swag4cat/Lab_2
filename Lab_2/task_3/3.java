import java.util.Scanner;

import java.io.PrintStream;  import static java.nio.charset.StandardCharsets.UTF_8;

public class Main {

    // Функция для переворачивания числа и удаления ведущих нулей
    public static int reverseNumber(int num) {
        int reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        PrintStream out = new PrintStream(System.out, true, UTF_8);

        out.print("Введите количество чисел: ");
        int n = scanner.nextInt();

        if (n <= 0) {
            out.println("Некорректный ввод.");
            return;
        }

        out.print("Введите " + n + " чисел: ");
        for (int i = 0; i < n; i++) {
            int num = scanner.nextInt();
            out.print(reverseNumber(num) + " ");
        }

        System.out.println();
        scanner.close();
    }
}
