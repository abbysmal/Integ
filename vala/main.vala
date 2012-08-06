void main(string[] args)
{
    if (args.length == 2)
    {
        int n = int.parse(args[1]);

        string calculs = Calcul.calcul(n);

        GLib.stdout.printf("%s", calculs);
    }
    else
    {
        GLib.stderr.printf("..\n");
    }
}
