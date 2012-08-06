import std.stdio;
import std.conv;
import std.format;
import std.string;
import std.math;

void main(char[][] args)
{
 int ac;

 if (args.length < 2)
   return;
 ac = parse!int(args[1]);
  write(calc_integ(ac));
}

string calc_integ(int n)
{
 string begin = format("%s%d%s\n", "n=", (cast(int) n), "   Rectangles\tTrapezes\tSimpson");
 return begin ~  "f1\t" ~ integ(1, n) ~ "f2\t" ~ integ(2, n) ~ "f3\t" ~ integ(3, n) ~ "f4\t" ~ integ(4, n) ~ "f5\t" ~ integ(5, n) ~ "f6\t" ~ integ(6, n) ~ "f7\t" ~ integ(7, n) ~ "f8\t" ~ integ(8, n) ~ "f9\t" ~ integ(9, n) ~ "f10\t" ~ integ(10, n);
}

string integ(int f, double n)
{
  double a = 0.0;
  double b = 1.0;
  double h = (b - a) / n;

  return format("%.1E", rectangles(f, n, a, h)) ~ "\t\t" ~ format("%.1E",
  trapezes(f, n, a, b, h)) ~ "\t\t" ~ format("%.1E", simpson(f, n, a, b, h)) ~
  "\t\t" ~ "\n";
}

double   rectangles(int f, double n, double a, double h)
{
  double s = 0.0;
  int token = 0;

  while (token < n)
    {
      s += fu(f, (a + h * token));
      token++;
        }
  return (fabs ((h * s) - 1.0));
}

double   trapezes(int f, double n, double a, double b, double h)
{
  double s = 0.0;
  double token = 1.0;

  while (token < n)
    {
      s += fu(f, (a + (token * h)));
      token++;
    }
  return fabs((((b - a) / (2.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1.0);
}

double    simpson(int f, double n, double a, double b, double h)
{
  double s1 = 0.0;
  double s2 = 0.0;
  int token = 1;

  while (token < n)
  {
    s1 += fu(f, a + (token * h));
    token++;
  }
  token = 0;
  while (token < n)
    {
      s2 += fu(f, a + (token * h) + (h / 2.0));
      token++;
    }
  return fabs((((b - a) / (6.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s1 + 4.0 * s2))) - 1.0);
}

double   fu(double i, double x)
{
  if (i == 1)
    return 1;
  if (i == 2)
    return 2 * x;
  if (i == 3)
    return 3 * (pow(x, 2.0));
  if (i == 4)
    return 4 * (pow(x, 3.0));
  if (i == 5)
    return 5 * pow(x, 4.0);
  if (i == 6)
    return 6 * pow(x, 5.0);
  if (i == 7)
    return 1.0 / (2.0 * (sqrt(2.0) - 1.0) * sqrt(x + 1.0));
  if (i == 8)
    return 2.0 / pow((x + 1.0), 2.0);
  if (i == 9)
    return (PI / 2.0) * sin((PI / 2.0) * x);
  if (i == 10)
    return pow(E, x) / (E - 1.0);
  return (0);
}

