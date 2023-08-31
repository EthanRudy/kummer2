using System;
using System.Collections.Generic;
using System.Text;

namespace FirstCSharp
{
    class First
    {
        static void Main(string[] args)
        {
            String name;
            String age;
            int iage;
            String wage;
            double dwage,gross;


            Console.WriteLine("Enter name:");
            name = Console.ReadLine();
            Console.WriteLine("Hello " + name + ", C# rocks");
            Console.WriteLine("Enter age:");
            age =Console.ReadLine();
            Console.WriteLine("Your age is "+ age);
            Console.WriteLine("Enter height:");
            iage = int.Parse(Console.ReadLine());
            Console.WriteLine(iage);
            Console.WriteLine("Enter wage:");
            wage = Console.ReadLine();
            Console.WriteLine("Your wage is " + wage);
            dwage = double.Parse(wage) + 1.50;
            Console.WriteLine(dwage);
            Console.WriteLine("Enter gross:");
            gross = double.Parse(Console.ReadLine());
            Console.WriteLine(gross);
            Console.WriteLine("Press any key to continue");
            Console.ReadKey(true);
        }
    }
}
