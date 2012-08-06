<?php
include("calcul.php");

if (count($argv) == 2)
{
    $n = (int)$argv[1];

    $calculs = calcul($n);

    fprintf(STDOUT, $calculs);
}
else
{
    fprintf(STDERR, "..\n");
}
?>
