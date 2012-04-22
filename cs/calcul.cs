static class Calcul
{
    private delegate double Fonction(double x);

    public static string calcul(int n)
    {
        return "n = " + n.ToString() + "\tReclangles\tTrapezes\tSimpson\n" +
        "f1\t" + calcul_integ(f1, n) +
        "f2\t" + calcul_integ(f2, n) +
        "f3\t" + calcul_integ(f3, n) +
        "f4\t" + calcul_integ(f4, n) +
        "f5\t" + calcul_integ(f5, n) +
        "f6\t" + calcul_integ(f6, n) +
        "f7\t" + calcul_integ(f7, n) +
        "f8\t" + calcul_integ(f8, n) +
        "f9\t" + calcul_integ(f9, n) +
        "f10\t" + calcul_integ(f10, n);
    }

    private static string calcul_integ(Fonction f, int n)
    {
        double a = 0.0;
        double b = 1.0;
        double h = (b - a) / n;

        return string.Format("{0:0.0E+0}", rectangles(f, n, a, h)) + "\t\t" +
        string.Format("{0:0.0E+0}", trapezes(f, n, a, b, h)) + "\t\t" +
        string.Format("{0:0.0E+0}", simpson(f, n, a, b, h)) + "\n";
    }

    private static double rectangles(Fonction f, double n, double a, double h)
    {
        double s = 0.0;

        for(int i = 0; i < n; ++i)
        {
            s += f(a + h * i);
        }

        return System.Math.Abs((h * s) - 1);
    }

    private static double trapezes(Fonction f, double n, double a, double b, double h)
    {
        double s = 0;

        for(int i = 1; i < n; ++i)
        {
            s += f(a + (i * h));
        }

        return System.Math.Abs((((b - a) / (2.0 * n)) * (f(a) + f(b) + (2.0 * s))) - 1);
    }

    private static double simpson(Fonction f, double n, double a, double b, double h)
    {
        double s1 = 0;
        double s2 = 0;

        for(int i = 1; i < n; ++i)
        {
            s1 += f(a + (i * h));
        }

        for(int i = 0; i < n; ++i)
        {
            s2 += f(a + (i * h) + (h / 2.0));
        }

        return System.Math.Abs((((b - a) / (6.0 * n)) * (f(a) + f(b) + (2.0 * s1 + 4.0 * s2))) - 1);
    }

    private static double f1(double x)
    {
        return 1;
    }

    private static double f2(double x)
    {
        return 2.0 * x;
    }

    private static double f3(double x)
    {
        return 3.0 * System.Math.Pow(x, 2.0);
    }

    private static double f4(double x)
    {
        return 4.0 * System.Math.Pow(x, 3.0);
    }

    private static double f5(double x)
    {
        return 5.0 * System.Math.Pow(x, 4.0);
    }

    private static double f6(double x)
    {
        return 6.0 * System.Math.Pow(x, 5.0);
    }

    private static double f7(double x)
    {
        return 1.0 / (2.0 * (System.Math.Sqrt(2) - 1.0) * System.Math.Sqrt(x + 1.0));
    }

    private static double f8(double x)
    {
        return 2.0 / System.Math.Pow(x + 1.0, 2.0);
    }

    private static double f9(double x)
    {
        return (System.Math.PI / 2.0) * System.Math.Sin((System.Math.PI / 2.0) * x);
    }

    private static double f10(double x)
    {
        return System.Math.Pow(System.Math.E, x) / (System.Math.E - 1.0);
    }
}
