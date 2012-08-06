package main

import "fmt"
import "os"
import "strconv"
import "math"

func integ_calcul(n float64) string {
	begin := fmt.Sprintf("%s%d%s\n", "n=", int(n), "   Rectangles\tTrapezes\tSimpson")
	return begin +  "f1\t" + integ(1, n) + "f2\t" + integ(2, n) + "f3\t" + integ(3, n) + "f4\t" + integ(4, n) + "f5\t" + integ(5, n) + "f6\t" + integ(6, n) + "f7\t" + integ(7, n) + "f8\t" + integ(8, n) + "f9\t" + integ(9, n) + "f10\t" + integ(10, n)
}

func integ(f int, n float64) string {
	a := 0.0
	b := 1.0
	h := (b - a) / n

	return fmt.Sprintf("%.E1", rectangles(f, n, a, h)) + "\t\t" + fmt.Sprintf("%.E1", trapezes(f, n, a, b, h)) + "\t\t" + fmt.Sprintf("%.E1", simpson(f, n, a, b, h)) + "\n"
}

func rectangles(f int, n float64, a float64, h float64) float64 {
	s := 0.0

	for i := 0.0; i < n; i++ {
		s += fu(f, (a + h * i))
	}
	return (math.Abs ((h * s) - 1.0))
}

func trapezes(f int, n float64, a float64, b float64, h float64) float64 {
	s := 0.0

	for i := 1.0; i < n; i++ {
		s += fu(f, (a + (i * h)))
	}
	return math.Abs((((b - a) / (2.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1.0)
}

func simpson(f int, n float64, a float64, b float64, h float64) float64 {
	s1 := 0.0
	s2 := 0.0

	for i := 1.0; i < n; i++ {
		s1 += fu(f, a + (i * h))
	}
	for i := 0.0; i < n; i++ {
		s2 += fu(f, a + (i * h) + (h / 2.0))
	}
	return math.Abs((((b - a) / (6.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s1 + 4.0 * s2))) - 1.0)
}

func fu(i int, x float64) float64 {
	if i == 1 {
		return 1.0
	}
	if i == 2 {
		return 2.0 * x;
	}
	if i == 3 {
		return 3.0 * math.Pow(x, 2.0)
	}
	if i == 4 {
		return 4.0 * math.Pow(x, 3.0)
	}
	if i == 5 {
		return 5.0 * math.Pow(x, 4.0)
	}
	if i == 6 {
		return 6.0 * math.Pow(x, 5.0)
	}
	if i == 7 {
		return 1.0 / (2.0 * (math.Sqrt(2) - 1.0) * math.Sqrt(x + 1.0))
	}
	if i == 8 {
		return 2.0 / math.Pow(x + 1.0, 2.0)
	}
	if i == 9 {
		return (math.Pi / 2.0) * math.Sin((math.Pi / 2.0) * x)
	}
	if i == 10 {
		return math.Pow(math.E, x) / (math.E - 1.0)
	}
	return 0.0
}

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage is: ./integ precision")
		return
	}
	i, err := strconv.Atoi(os.Args[1])
	if err != nil {
		fmt.Println(os.Args[1], "Not an integer value")
		return
	}
	fmt.Print(integ_calcul(float64(i)))
}
