require("./calcul.rb")

begin
    args = ARGV

    if args.length == 1
        n = args[0].to_i

        if (n >= 10 and n <= 100)
            calculs = Calcul.calcul(n)

            $stdout.write(calculs)
        else
            $stderr.write(".\n")
        end
    else
        $stderr.write("..\n")
    end
end
