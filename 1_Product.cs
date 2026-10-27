using System;
class Program
{
    static void Main()
    {
        Console.WriteLine("Enter four integer values:");
        Console.Write("Enter first number: ");
        int a = Convert.ToInt32(Console.ReadLine());
        Console.Write("Enter second number: ");
        int b = Convert.ToInt32(Console.ReadLine());
        Console.Write("Enter third number: ");
        int c = Convert.ToInt32(Console.ReadLine());
        Console.Write("Enter fourth number: ");
        int d = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine();
        Console.WriteLine("The product of the four numbers is: " + (a * b * c * d));
        Console.ReadLine();
    }
}
