import sys
import calcul

if __name__ == "__main__":
    args = sys.argv
    if (len(args) == 2):
        n = int(args[1])

        if (n >= 10 and n <= 100):
            calculs = calcul.calcul(n)

            sys.stdout.write(calculs)
        else:
            sys.stderr.write(".\n")
    else:
        sys.stderr.write("..\n")
