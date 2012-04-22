#include "calcul.h"
#include <sstream>
#include <cmath>

typedef double (*Fonction)(double);

static double rectangles(Fonction f, double n, double a, double h)
{
    double s = 0.0;

    for(int i = 0; i < n; ++i)
    {
        s += f(a + h * i);
    }

    return std::fabs((h * s) - 1);
}

static double trapezes(Fonction f, double n, double a, double b, double h)
{
    double s = 0;

    for(int i = 1; i < n; ++i)
    {
        s += f(a + (i * h));
    }

    return std::fabs((((b - a) / (2.0 * n)) * (f(a) + f(b) + (2.0 * s))) - 1);
}

static double simpson(Fonction f, double n, double a, double b, double h)
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

    return std::fabs((((b - a) / (6.0 * n)) * (f(a) + f(b) + (2.0 * s1 + 4.0 * s2))) - 1);
}

static double f1(double)
{
    return 1;
}

static double f2(double x)
{
    return 2.0 * x;
}

static double f3(double x)
{
    return 3.0 * std::pow(x, 2.0);
}

static double f4(double x)
{
    return 4.0 * std::pow(x, 3.0);
}

static double f5(double x)
{
    return 5.0 * std::pow(x, 4.0);
}

static double f6(double x)
{
    return 6.0 * std::pow(x, 5.0);
}

static double f7(double x)
{
    return 1.0 / (2.0 * (std::sqrt(2) - 1.0) * std::sqrt(x + 1.0));
}

static double f8(double x)
{
    return 2.0 / std::pow(x + 1.0, 2.0);
}

static double f9(double x)
{
    return (M_PI / 2.0) * std::sin((M_PI / 2.0) * x);
}

static double f10(double x)
{
    return std::pow(M_E, x) / (M_E - 1.0);
}

static std::string calcul_integ(Fonction f, double n)
{
    double a = 0.0;
    double b = 1.0;
    double h = (b - a) / n;
    std::stringstream s;

    s.precision(1);
    s.flags(std::ios::scientific);

    s << rectangles(f, n, a, h) <<
    "\t\t" << trapezes(f, n, a, b, h) <<
    "\t\t" << simpson(f, n, a, b, h) << "\n";

    return s.str();
}

std::string Calcul::calcul(int n)
{
    std::stringstream s;
    s << n;

    return "n = " + s.str() + "\tReclangles\tTrapezes\tSimpson\n" +
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
