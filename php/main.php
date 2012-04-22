<?php
include("calcul.php");

if (count($argv) == 2)
{
    $n = (int)$argv[1];

    if ($n >= 10 and $n <= 100)
    {
        $calculs = calcul($n);

        fprintf(STDOUT, $calculs);
    }
    else
    {
        fprintf(STDERR, ".\n");
    }
}
else
{
    fprintf(STDERR, "..\n");
}
?>
