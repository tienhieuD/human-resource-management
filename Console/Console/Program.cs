using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console
{
    class Program
    {
        static void Main(string[] args)
        {
            print(convert_to(255, 16));
            System.Console.ReadKey();
        }

        #region MyRegion
        static string convert_to(int n, int x)
        {
            Func<int, int> get = new Func<int, int>(num => num % x);
            Func<int, int> dev = new Func<int, int>(num => num / x);
            string rs = "";
            while (n > 0)
            {
                rs = ((get(n) < 10) ? get(n) : "A") + rs;
                n = dev(n);
            }
            return rs;
        }
        static void print(object obj)
        {
            System.Console.WriteLine(obj.ToString());
        }
        static void print_bit(object obj)
        {
            System.Console.Write(obj.ToString());
        }
        static string GetArgsContent(string key)
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("-h",
                "How to use arguments?\n" +
                "-v to show the version.\n" +
                "-h to show help.");
            dict.Add("-v",
                "The current version is 1.0.0.1\n");

            return dict[key];
        }
        #endregion
    }
}
