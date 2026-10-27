using System;
class Program
{
    static void Main()
    {
        double usdRate = 83.20;
        Console.WriteLine("Currency Converter");
        Console.WriteLine("1. INR to USD");
        Console.WriteLine("2. USD to INR");
        Console.Write("Enter your choice (1 or 2): ");
        int choice = int.Parse(Console.ReadLine());

        if (choice == 1)
        {
            Console.Write("Enter amount in INR: ");
            double amount = double.Parse(Console.ReadLine());
            Console.WriteLine("Equivalent USD: $" + (amount / usdRate).ToString("0.00"));
        }
        else if (choice == 2)
        {
            Console.Write("Enter amount in USD: ");
            double amount = double.Parse(Console.ReadLine());
            Console.WriteLine("Equivalent INR: " + (amount * usdRate).ToString("0.00"));
        }
        else
        {
            Console.WriteLine("Invalid choice.");
        }
        Console.ReadLine();
    }
}
