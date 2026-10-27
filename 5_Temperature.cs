using System;
class Program
{
    static void Main()
    {
        Console.WriteLine("Enter the Temperature in Celsius:");
        double celsius;
        if (double.TryParse(Console.ReadLine(), out celsius))
        {
            double fahrenheit = (celsius * 9 / 5) + 32;
            Console.WriteLine("Temperature in Fahrenheit: " + fahrenheit);
        }
        else
        {
            Console.WriteLine("Invalid input! Please enter a valid temperature.");
        }
        Console.ReadLine();
    }
}
