static class MainClass
{
    static void Main(string[] args)
    {
        if (args.Length == 1)
        {
            int n = int.Parse(args[0]);

            string calculs = Calcul.calcul(n);

            System.Console.Write(calculs);
        }
        else
        {
            System.Console.WriteLine("..");
        }
    }
}
