import math

def calcul(n):
    begin = "n = {0}\tReclangles\tTrapezes\tSimpson\n".format(n)

    return begin + \
            "f1\t" + calcul_integ(f1, n) + \
            "f2\t" + calcul_integ(f2, n) + \
            "f3\t" + calcul_integ(f3, n) + \
            "f4\t" + calcul_integ(f4, n) + \
            "f5\t" + calcul_integ(f5, n) + \
            "f6\t" + calcul_integ(f6, n) + \
            "f7\t" + calcul_integ(f7, n) + \
            "f8\t" + calcul_integ(f8, n) + \
            "f9\t" + calcul_integ(f9, n) + \
            "f10\t" + calcul_integ(f10, n)

def calcul_integ(f, n):
    a = 0.0
    b = 1.0
    h = (b - a) / n

    return "{0:.1E}".format(rectangles(f, n, a, h)) + "\t\t" + \
            "{0:.1E}".format(trapezes(f, n, a, b, h)) + "\t\t" + \
            "{0:.1E}".format(simpson(f, n, a, b, h)) + "\n"

def rectangles(f, n, a, h):
    s = 0.0

    for i in range(0, n):
        s += f(a + h * i)

    return math.fabs((h * s) - 1.0)

def trapezes(f, n, a, b, h):
    s = 0.0

    for i in range(1, n):
        s += f(a + (i * h))

    return math.fabs((((b - a) / (2.0 * n)) * (f(a) + f(b) + (2.0 * s))) - 1.0)

def simpson(f, n, a, b, h):
    s1 = 0.0
    s2 = 0.0

    for i in range(1, n):
        s1 += f(a + (i * h))

    for i in range(0, n):
        s2 += f(a + (i * h) + (h / 2.0))

    return math.fabs((((b - a) / (6.0 * n)) * (f(a) + f(b) + (2.0 * s1 + 4.0 * s2))) - 1);

def f1(x):
    return 1

def f2(x):
    return 2.0 * x

def f3(x):
    return 3.0 * math.pow(x, 2.0)

def f4(x):
    return 4.0 * math.pow(x, 3.0)

def f5(x):
    return 5.0 * math.pow(x, 4.0)

def f6(x):
    return 6.0 * math.pow(x, 5.0)

def f7(x):
    return 1.0 / (2.0 * (math.sqrt(2.0) - 1.0) * math.sqrt(x + 1.0))

def f8(x):
    return 2.0 / math.pow(x + 1.0, 2.0)

def f9(x):
    return (math.pi / 2.0) * math.sin((math.pi / 2.0) * x)

def f10(x):
    return math.pow(math.e, x) / (math.e - 1.0)
