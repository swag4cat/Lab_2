using System;

class Program
{
    // Функция для переворачивания числа и удаления ведущих нулей
    static int ReverseNumber(int num)
    {
        int reversed = 0;
        while (num > 0)
        {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    static void Main()
    {
        Console.Write("Введите количество чисел: ");
        int n = int.Parse(Console.ReadLine());

        Console.Write($"Введите {n} чисел: ");
        for (int i = 0; i < n; ++i)
        {
            int num = int.Parse(Console.ReadLine());
            Console.Write(ReverseNumber(num) + " ");
        }

        Console.WriteLine();
    }
}
