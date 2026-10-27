using System;
class Program
{
    static void Main()
    {
        Console.Write("Enter a number to check if it is prime: ");
        int number = Convert.ToInt32(Console.ReadLine());

        if (IsPrime(number))
            Console.WriteLine(number + " is a Prime Number.");
        else
            Console.WriteLine(number + " is NOT a Prime Number.");

        Console.ReadLine();
    }

    static bool IsPrime(int num)
    {
        if (num <= 1)
            return false;

        for (int i = 2; i <= Math.Sqrt(num); i++)
        {
            if (num % i == 0)
                return false;
        }
        return true;
    }
}
