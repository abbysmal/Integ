#define _BSD_SOURCE
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char	*integ(int f, double n);
static double	rectangles(int f, double n, double a, double h);
static double	trapezes(int f, double n, double a, double b, double h);
static double	simpson(int f, double n, double a, double b, double h);
static void	start_integ(double nb);
static double	fu(double i, double x);

static char	*integ(int f, double n)
{
  double a = 0.0;
  double b = 1.0;
  double h = (b - a) / n;
  char str[1024];

  sprintf(str, "%.1E\t\t%.1E\t\t%.1E",
	  rectangles(f, n, a, h),
	  trapezes(f, n, a, b, h),
	  simpson(f, n, a, b, h));
  return (strdup(str));
}

static double	rectangles(int f, double n, double a, double h)
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

static double	trapezes(int f, double n, double a, double b, double h)
{
  double s = 0.0;
  int token = 1.0;

  while (token < n)
    {
      s += fu(f, (a + (token * h)));
      token++;
    }
  return fabs((((b - a) / (2.0 * n)) * (fu(f, a) + fu(f, b) + (2.0 * s))) - 1.0);
}

static double	 simpson(int f, double n, double a, double b, double h)
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

static void	start_integ(double nb)
{
  char *str;
  printf("%s%d%s\n", "n=", (int) nb, "   Rectangles\tTrapezes\tSimpson");
  str = integ(1, nb);
  printf("%s\t%s\n", "F1:", str);
  free(str);
  str = integ(2, nb);
  printf("%s\t%s\n", "F2:", str);
  free(str);
  str = integ(3, nb);
  printf("%s\t%s\n", "F3:", str);
  free(str);
  str = integ(4, nb);
  printf("%s\t%s\n", "F4:", str);
  free(str);
  str = integ(5, nb);
  printf("%s\t%s\n", "F5:", str);
  free(str);
  str = integ(6, nb);
  printf("%s\t%s\n", "F6:", str);
  free(str);
  str = integ(7, nb);
  printf("%s\t%s\n", "F7:", str);
  free(str);
  str = integ(8, nb);
  printf("%s\t%s\n", "F8:", str);
  free(str);
  str = integ(9, nb);
  printf("%s\t%s\n", "F9:", str);
  free(str);
  str = integ(10, nb);
  printf("%s\t%s\n", "F10:", str);
  free(str);
}

static double	fu(double i, double x)
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
    return (M_PI / 2.0) * sin((M_PI / 2.0) * x);
  if (i == 10)
    return pow(M_E, x) / (M_E - 1.0);
  return (0);
}

int main(int argc, char *argv[])
{
  if (argc != 2)
    {
      printf ("%s\n", "Bad option");
      return (EXIT_FAILURE);
    }
  start_integ(atoi(argv[1]));
  return 0;
}
