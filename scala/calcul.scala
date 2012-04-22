object Calcul
{
    def calcul(n: Int) : String =
    {
        return  "n = " + n.toString + "\tReclangles\tTrapezes\tSimpson\n" +
        "f1\t" + integ(f1, n) +
        "f2\t" + integ(f2, n) +
        "f3\t" + integ(f3, n) +
        "f4\t" + integ(f4, n) +
        "f5\t" + integ(f5, n) +
        "f6\t" + integ(f6, n) +
        "f7\t" + integ(f7, n) +
        "f8\t" + integ(f8, n) +
        "f9\t" + integ(f9, n) +
        "f10\t" + integ(f10, n)
    }

    def integ(f: (Double) => Double, n: Int) : String =
    {
        val a = 0.0
        val b = 1.0
        val h = (b - a) / n.toDouble

        return "%.1E".format(rectangles(f, n, a, h)) + "\t\t" +
        "%.1E".format(trapezes(f, n, a, b, h)) + "\t\t" +
        "%.1E".format(simpson(f, n, a, b, h)) + "\n"
    }

    def rectangles(f: (Double) => Double, n: Int, a: Double, h: Double) :  Double =
    {
        var s = 0.0

        for (i <- 0 to (n - 1))
           s += f(a + h * i.toDouble)

        return (scala.math.abs ((h * s) - 1.0))
    }

    def trapezes(f: (Double) => Double, n: Int, a: Double, b: Double, h: Double) : Double =
    {
        var s = 0.0

        for (i <- 1 to (n - 1))
            s += f(a + (i.toInt * h))

        return scala.math.abs((((b - a) / (2.0 * n)) * (f(a) + f(b) + (2.0 * s))) - 1.0)
    }

    def simpson(f: (Double) => Double, n: Int, a: Double, b: Double, h: Double) : Double =
    {
        var s1 = 0.0
        var s2 = 0.0

        for (i <- 1 to (n - 1))
            s1 += f(a + (i.toInt * h))

        for (i <- 0 to (n - 1))
            s2 += f(a + (i.toInt * h) + (h / 2.0))

        return scala.math.abs((((b - a) / (6.0 * n)) * (f(a) + f(b) + (2.0 * s1 + 4.0 * s2))) - 1.0)
    }

    def f1(x : Double) : Double =
    {
        return 1.0
    }

    def f2(x : Double) : Double =
    {
        return 2.0 * x;
    }

    def f3(x : Double) : Double =
    {
        return 3.0 * scala.math.pow(x, 2.0)
    }

    def f4(x : Double) : Double =
    {
        return 4.0 * scala.math.pow(x, 3.0)
    }

    def f5(x : Double) : Double =
    {
        return 5.0 * scala.math.pow(x, 4.0)
    }

    def f6(x : Double) : Double =
    {
        return 6.0 * scala.math.pow(x, 5.0)
    }

    def f7(x : Double) : Double =
    {
        return 1.0 / (2.0 * (scala.math.sqrt(2) - 1.0) * scala.math.sqrt(x + 1.0))
    }

    def f8(x : Double) : Double =
    {
        return 2.0 / scala.math.pow(x + 1.0, 2.0)
    }

    def f9(x : Double) : Double =
    {
        return (scala.math.Pi / 2.0) * scala.math.sin((scala.math.Pi / 2.0) * x)
    }

    def f10(x : Double) : Double =
    {
        return scala.math.pow(math.E, x) / (scala.math.E - 1.0)
    }
}
