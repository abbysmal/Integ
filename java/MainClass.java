public class MainClass
{
    public static void main(String[] args)
    {
        if(args.length == 1)
        {
            int n = Integer.parseInt(args[0]);

            if(n >= 10 && n <= 100)
            {
                String calculs = Calcul.calcul(n);

                System.out.print(calculs);
            }
            else
            {
                System.err.println(".");
            }
        }
        else
        {
            System.err.println("..");
        }
    }
}
