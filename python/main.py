import sys
import calcul

if __name__ == "__main__":
    args = sys.argv
    if (len(args) == 2):
        n = int(args[1])

        calculs = calcul.calcul(n)

        sys.stdout.write(calculs)
    else:
        sys.stderr.write("..\n")
