using System;
class Program
{
    static void Main()
    {
        Console.WriteLine("Enter a non-negative integer:");
        int number;
        if (int.TryParse(Console.ReadLine(), out number) && number >= 0)
        {
            long fact = 1;
            for (int i = 1; i <= number; i++)
            {
                fact *= i;
            }
            Console.WriteLine();
            Console.WriteLine("Factorial of " + number + " is: " + fact);
        }
        else
        {
            Console.WriteLine("Invalid input! Please enter a non-negative integer.");
        }
        Console.ReadLine();
    }
}
