using System;
using System.Collections.Generic;

class Program
{
    static void DisplayProcess(int step, List<char> bottles)
    {
        Console.WriteLine($"{step} шаг");
        for (int i = 0; i < bottles.Count; i++)
        {
            Console.Write(bottles[i] + " ");
            if ((i + 1) % 3 == 0)
                Console.WriteLine(); // Форматирование вывода
        }
        Console.WriteLine();
    }

    static void Main()
    {
        Console.Write("Введите количество начальных банок и обменный курс: ");
        string[] inputs = Console.ReadLine().Split();
        int N = int.Parse(inputs[0]);
        int M = int.Parse(inputs[1]);

        int totalDrank = N;
        int emptyBottles = N;
        int step = 0;
        List<char> bottles = new List<char>(new char[N]); // Символ 'F' для полных банок
        for (int i = 0; i < N; i++) bottles[i] = 'F';

        DisplayProcess(++step, bottles);

        while (emptyBottles >= M)
        {
            int newFull = emptyBottles / M;
            emptyBottles = emptyBottles % M + newFull;
            totalDrank += newFull;
            bottles.Clear();
            bottles.AddRange(new char[newFull]); // Символ 'F' для полных банок
            for (int i = 0; i < newFull; i++) bottles[i] = 'F';
            DisplayProcess(++step, bottles);

            bottles.Clear();
            bottles.AddRange(new char[emptyBottles]); // Символ 'E' для пустых банок
            for (int i = 0; i < emptyBottles; i++) bottles[i] = 'E';
            DisplayProcess(++step, bottles);
        }

        Console.WriteLine($"Output: {totalDrank} {step}");
    }
}
