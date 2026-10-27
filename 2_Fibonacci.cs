using System;
class Program
{
    static void Main()
    {
        Console.Write("Enter the number of terms for Fibonacci series: ");
        int terms = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine();
        Console.WriteLine("Fibonacci Series:");
        int first = 0, second = 1;
        for (int i = 0; i < terms; i++)
        {
            Console.Write(first + " ");
            int next = first + second;
            first = second;
            second = next;
        }
        Console.WriteLine();
        Console.ReadLine();
    }
}
