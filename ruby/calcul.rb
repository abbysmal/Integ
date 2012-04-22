module Calcul
    def self.calcul(n)
        return "n = #{n}\tReclangles\tTrapezes\tSimpson\n" +
            "f1\t" + calcul_integ(:f1, n) +
            "f2\t" + calcul_integ(:f2, n) +
            "f3\t" + calcul_integ(:f3, n) +
            "f4\t" + calcul_integ(:f4, n) +
            "f5\t" + calcul_integ(:f5, n) +
            "f6\t" + calcul_integ(:f6, n) +
            "f7\t" + calcul_integ(:f7, n) +
            "f8\t" + calcul_integ(:f8, n) +
            "f9\t" + calcul_integ(:f9, n) +
            "f10\t" + calcul_integ(:f10, n)
    end

    private
    def self.calcul_integ(f, n)
        a = 0.0
        b = 1.0
        h = (b - a) / n

        return sprintf("%.1E", rectangles(f, n, a, h)) + "\t\t" +
            sprintf("%.1E", trapezes(f, n, a, b, h)) + "\t\t" +
            sprintf("%.1E", simpson(f, n, a, b, h)) + "\n"
    end

    def self.rectangles(f, n, a, h)
        s = 0.0

        (0..n - 1).each do |i|
            s += method(f).call(a + h * i)
        end

        return ((h * s) - 1).abs
    end

    def self.trapezes(f, n, a, b, h)
        s = 0

        (1..n - 1).each do |i|
            s += method(f).call(a + (i * h))
        end

        return ((((b - a) / (2.0 * n)) * (method(f).call(a) + method(f).call(b) + (2.0 * s))) - 1).abs
    end

    def self.simpson(f, n, a, b, h)
        s1 = 0
        s2 = 0

        (1..n - 1).each do |i|
            s1 += method(f).call(a + (i * h))
        end

        (0..n - 1).each do |i|
            s2 += method(f).call(a + (i * h) + (h / 2.0))
        end

        return ((((b - a) / (6.0 * n)) * (method(f).call(a) + method(f).call(b) + (2.0 * s1 + 4.0 * s2))) - 1).abs
    end

    def self.f1(x)
        return 1
    end

    def self.f2(x)
        return 2.0 * x
    end

    def self.f3(x)
        return 3.0 * (x ** 2.0)
    end

    def self.f4(x)
        return 4.0 * (x ** 3.0)
    end

    def self.f5(x)
        return 5.0 * (x ** 4.0)
    end

    def self.f6(x)
        return 6.0 * (x ** 5.0)
    end

    def self.f7(x)
        return 1.0 / (2.0 * (Math.sqrt(2) - 1.0) * Math.sqrt(x + 1.0))
    end

    def self.f8(x)
        return 2.0 / ((x + 1.0) ** 2.0)
    end

    def self.f9(x)
        return (Math::PI / 2.0) * Math.sin((Math::PI / 2.0) * x)
    end

    def self.f10(x)
        return (Math::E ** x) / (Math::E - 1.0)
    end
end
