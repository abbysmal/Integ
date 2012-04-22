static class MainClass
{
    static void Main(string[] args)
    {
        if (args.Length == 1)
        {
            int n = int.Parse(args[0]);

            if (n >= 10 && n <= 100)
            {
                string calculs = Calcul.calcul(n);

                System.Console.Write(calculs);
            }
            else
            {
                System.Console.WriteLine(".");
            }
        }
        else
        {
            System.Console.WriteLine("..");
        }
    }
}
