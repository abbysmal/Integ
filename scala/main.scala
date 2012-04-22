object Main
{
    def main(args: Array[String]) : Unit =
    {
        if(args.length == 1)
        {
            val n = args(0).toInt

            if(n >= 10 && n <= 100)
            {
                print(Calcul.calcul(n))
            }
            else
            {
                System.err.printf(".\n")
            }
        }
        else
        {
            System.err.printf("..\n")
        }
    }
}
