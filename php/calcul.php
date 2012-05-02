<?php
function calcul($n)
{
    return sprintf("n = %d\tRectangles\tTrapezes\tSimpson\n", $n) .
            "f1\t" . calcul_integ(function($x) { return f1($x); }, $n) .
            "f2\t" . calcul_integ(function($x) { return f2($x); }, $n) .
            "f3\t" . calcul_integ(function($x) { return f3($x); }, $n) .
            "f4\t" . calcul_integ(function($x) { return f4($x); }, $n) .
            "f5\t" . calcul_integ(function($x) { return f5($x); }, $n) .
            "f6\t" . calcul_integ(function($x) { return f6($x); }, $n) .
            "f7\t" . calcul_integ(function($x) { return f7($x); }, $n) .
            "f8\t" . calcul_integ(function($x) { return f8($x); }, $n) .
            "f9\t" . calcul_integ(function($x) { return f9($x); }, $n) .
            "f10\t" . calcul_integ(function($x) { return f10($x); }, $n);
}

function calcul_integ($f, $n)
{
    $a = 0.0;
    $b = 1.0;
    $h = ($b - $a) / $n;

    return sprintf("%.1E", rectangles($f, $n, $a, $h)) . "\t\t" .
      sprintf("%.1E", trapezes($f, $n, $a, $b, $h)) . "\t\t" .
      sprintf("%.1E", simpson($f, $n, $a, $b, $h)) . "\n";
}

function rectangles($f, $n, $a, $h)
{
    $s = 0.0;

    foreach (range(0, $n - 1) as $i)
        $s += $f($a + $h * $i);

    return abs(($h * $s) - 1.0);
}

function trapezes($f, $n, $a, $b, $h)
{
    $s = 0.0;

    foreach (range(1, $n - 1) as $i)
        $s += $f($a + ($i * $h));

    return abs(((($b - $a) / (2.0 * $n)) * ($f($a) + $f($b) + (2.0 * $s))) - 1.0);
}

function simpson($f, $n, $a, $b, $h)
{
    $s1 = 0.0;
    $s2 = 0.0;

    foreach (range(1, $n - 1) as $i)
        $s1 += $f($a + ($i * $h));

    foreach (range(0, $n - 1) as $i)
        $s2 += $f($a + ($i * $h) + ($h / 2.0));

    return abs(((($b - $a) / (6.0 * $n)) * ($f($a) + $f($b) + (2.0 * $s1 + 4.0 * $s2))) - 1);
}

function f1($x)
{
    return 1;
}

function f2($x)
{
    return 2.0 * $x;
}

function f3($x)
{
    return 3.0 * pow($x, 2.0);
}

function f4($x)
{
    return 4.0 * pow($x, 3.0);
}

function f5($x)
{
    return 5.0 * pow($x, 4.0);
}

function f6($x)
{
    return 6.0 * pow($x, 5.0);
}

function f7($x)
{
    return 1.0 / (2.0 * (sqrt(2.0) - 1.0) * sqrt($x + 1.0));
}

function f8($x)
{
    return 2.0 / pow($x + 1.0, 2.0);
}

function f9($x)
{
    return (M_PI / 2.0) * sin((M_PI / 2.0) * $x);
}

function f10($x)
{
    return pow(M_E, $x) / (M_E - 1.0);
}
?>
