using System;
using System.Text;

class Program
{
    static string CompressString(string s)
    {
        StringBuilder compressed = new StringBuilder();
        int count = 1;

        for (int i = 1; i <= s.Length; i++)
        {
            if (i < s.Length && s[i] == s[i - 1])
            {
                count++;
            }
            else
            {
                compressed.Append(s[i - 1]).Append(count);
                count = 1;
            }
        }

        if (compressed.Length < s.Length)
        {
            return compressed.ToString();
        }
        else
        {
            Console.WriteLine("Сжатие не уменьшило строку. Возвращена исходная строка.");
            return s;
        }
    }

    static void Main()
    {
        Console.Write("Введите строку: ");
        string s = Console.ReadLine();
        Console.WriteLine("Результат: " + CompressString(s));
    }
}
