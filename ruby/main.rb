require("./calcul.rb")

begin
    args = ARGV

    if args.length == 1
        n = args[0].to_i

        calculs = Calcul.calcul(n)

        $stdout.write(calculs)
    else
        $stderr.write("..\n")
    end
end
