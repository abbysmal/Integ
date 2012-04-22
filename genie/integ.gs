[indent=4]

init
    if args[1] == null do return
    if int.parse(args[1]) > 100 || int.parse(args[1]) < 10 do return
    print calc_integ (int.parse(args[1]))

def calc_integ (n : int) : string
    begin:string = "n = %d\tRectangles\tTrapezes\tSimpson\n".printf(n)
    return begin + "f1\t" + integ(1, n) + "f2\t" + integ(2, n) + "f3\t" + integ(3, n) + "f4\t" + integ(4, n) + "f5\t" + integ(5, n) + "f6\t" + integ(6, n) + "f7\t" + integ(7, n) + "f8\t" + integ(8, n) + "f9\t" + integ(9, n) + "f10\t" + integ(10, n)

def integ (f:int, n:double) : string
    a:double = 0.0
    b:double = 1.0
    h:double = (b - a) / n

    return "%.1E".printf(rectangles(f, n, a, h)) + "\t\t" + "%.1E".printf(trapezes(f, n, a, b, h)) + "\t\t" + "%.1E".printf(simpson(f, n, a, b, h)) + "\t\t" + "\n"

def rectangles (f:int, n:double, a:double, h:double) : double
    s:double = 0.0
    for var i = 0 to (n - 1)
        s += fu(f, a + h * i)
    return Math.fabs((h * s) - 1)

def trapezes(f:int, n:double, a:double, b:double, h:double) : double
    s:double = 0.0
    for var i = 1 to (n - 1)
        s += fu(f, a + (i * h))
    return Math.fabs((((b - a) / (2.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1)

def simpson(f:int, n:double, a:double, b:double, h:double) : double
    s1:double = 0.0
    s2:double = 0.0

    for var i = 1 to (n - 1)
        s1 += fu(f, a + (i * h))
    for var i = 0 to (n - 1)
        s2 += fu(f, a + (i * h) + (h / 2.0))
    return Math.fabs((((b - a) / (6.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s1 + 4.0 * s2))) - 1)

def fu (f:int, x:double) : double
    if f == 1 do return 1
    if f == 2 do return 2 * x
    if f == 3 do return 3.0 * Math.pow(x, 2.0)
    if f == 4 do return 4.0 * Math.pow(x, 3.0)
    if f == 5 do return 5.0 * Math.pow(x, 4.0)
    if f == 6 do return 6.0 * Math.pow(x, 5.0)
    if f == 7 do return 1.0 / (2.0 * (Math.sqrt(2) - 1.0) * Math.sqrt(x + 1.0))
    if f == 8 do return 2.0 / Math.pow(x + 1.0, 2.0)
    if f == 9 do return (Math.PI / 2.0) * Math.sin((Math.PI / 2.0) * x)
    if f == 10 do return Math.pow(Math.E, x) / (Math.E - 1.0)
    return 0.0
