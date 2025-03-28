import java.util.*;

import java.io.PrintStream;  import static java.nio.charset.StandardCharsets.UTF_8;

public class Main {

    public static void displayProcess(int step, List<Character> bottles) {
        PrintStream out = new PrintStream(System.out, true, UTF_8);
        out.println(step + " шаг");
        for (int i = 0; i < bottles.size(); i++) {
            out.print(bottles.get(i) + " ");
            if ((i + 1) % 3 == 0) {
                out.println();  // Форматирование вывода
            }
        }
        out.println();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        PrintStream out = new PrintStream(System.out, true, UTF_8);
        out.print("Введите количество начальных банок и обменный курс: ");
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        int totalDrank = N;
        int emptyBottles = N;
        int step = 0;

        List<Character> bottles = new ArrayList<>(Collections.nCopies(N, 'F'));  // Символ F для полных банок
        displayProcess(++step, bottles);

        while (emptyBottles >= M) {
            int newFull = emptyBottles / M;
            emptyBottles = emptyBottles % M + newFull;
            totalDrank += newFull;

            List<Character> newBottles = new ArrayList<>(Collections.nCopies(newFull, 'F'));  // Символ F для полных банок
            displayProcess(++step, newBottles);

            List<Character> emptyBottleList = new ArrayList<>(Collections.nCopies(emptyBottles, 'E'));  // Символ E для пустых банок
            displayProcess(++step, emptyBottleList);
        }

        System.out.println("Output: " + totalDrank + " " + step);
    }
}
