#!/usr/bin/env perl6

sub MAIN($nb) {
    if $nb < 10 || $nb > 100 { say "Bad option"; exit;  }
    say "n=" ~ $nb ~ "   Rectangles\tTrapezes\tSimpson";
    say "F1:    " ~ integ(1, $nb);
    say "F2:    " ~ integ(2, $nb);
    say "F3:    " ~ integ(3, $nb);
    say "F4:    " ~ integ(4, $nb);
    say "F5:    " ~ integ(5, $nb);
    say "F6:    " ~ integ(6, $nb);
    say "F7:    " ~ integ(7, $nb);
    say "F8:    " ~ integ(8, $nb);
    say "F9:    " ~ integ(9, $nb);
    say "F10:   " ~ integ(10, $nb);
}

sub integ($f, $n) {
    my $a = 0;
    my $b = 1;
    my $h = ($b - $a) / $n;

    my $string =
	sprintf("%.1E", rectangles($f, $n, $a, $h))   ~ "\t\t" ~
	sprintf("%.1E", trapezes($f, $n, $a, $b, $h)) ~ "\t\t" ~
	sprintf("%.1E", simpson($f, $n, $a, $b, $h))  ~ "\t\t";
    return $string
}

sub rectangles($f, $n, $a, $h) {
    my $s = 0;
    my $token = 0;

    while $token < $n {
	$s += f($f, $a + $h *  $token);
	$token++;
    }
   return abs (($h * $s) - 1)
}

sub trapezes($f, $n, $a, $b, $h) {
    my $s = 0;
    my $token = 1;

    while $token < $n {
	$s += f($f, $a + ($token * $h));
	$token++;
    }
    return abs(((($b - $a) / (2 * $n)) * (f($f, $a) + f($f, $b) + (2 * $s))) - 1)
}

sub simpson($f, $n, $a, $b, $h) {
    my $s1 = 0;
    my $s2 = 0;
    my $token = 1;

    while $token < $n {
	$s1 += f($f, $a + ($token * $h));
	$token++;
    }
    $token = 0;
    while $token < $n {
	$s2 += f($f, $a + ($token * $h) + ($h / 2));
	$token++;
    }
    return abs (((($b - $a) / (6 * $n)) * (f($f, $a) + f($f, $b) + (2 * $s1 + 4 * $s2))) - 1)
}

sub f($i, $x) {
    if $i == 1  {return 1}
    if $i == 2  {return 2 * $x}
    if $i == 3  {return 3 * ($x ** 2)}
    if $i == 4  {return 4 * ($x ** 3)}
    if $i == 5  {return 5 * ($x ** 4)}
    if $i == 6  {return 6 * ($x ** 5)}
    if $i == 7  {return 1 / (2 * (sqrt(2) - 1) * sqrt($x + 1))}
    if $i == 8  {return 2 / (($x + 1) ** 2)}
    if $i == 9  {return (pi / 2) * sin((pi / 2) * $x)}
    if $i == 10 {return (e ** $x) / (e - 1)}
}
