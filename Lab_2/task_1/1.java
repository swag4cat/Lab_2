import java.util.Scanner;
import java.io.PrintStream;  import static java.nio.charset.StandardCharsets.UTF_8;

public class StringCompression {
    public static String compressString(String s) {
        PrintStream out = new PrintStream(System.out, true, UTF_8);
        StringBuilder compressed = new StringBuilder();
        int count = 1;

        for (int i = 1; i <= s.length(); i++) {
            if (i < s.length() && s.charAt(i) == s.charAt(i - 1)) {
                count++;
            } else {
                compressed.append(s.charAt(i - 1)).append(count);
                count = 1;
            }
        }

        if (compressed.length() < s.length()) {
            return compressed.toString();
        } else {
            out.println("Сжатие не уменьшило строку. Возвращена исходная строка.");
            return s;
        }
    }

    public static void main(String[] args) {
        PrintStream out = new PrintStream(System.out, true, UTF_8);
        Scanner scanner = new Scanner(System.in);
        out.print("Введите строку: ");
        String s = scanner.nextLine();
        out.println("Результат: " + compressString(s));
        scanner.close();
    }
}
