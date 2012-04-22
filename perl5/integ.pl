#!/usr/bin/env perl

use strict;
use warnings;

my $nb = $ARGV [0];
if ($nb < 10 || $nb > 100) { print "Bad option\n"; exit;  }
print "n=" . $nb . "   Rectangles\tTrapezes\tSimpson" . "\n";
print "F1:    " . integ(1, $nb) . "\n";
print "F2:    " . integ(2, $nb) . "\n";
print "F3:    " . integ(3, $nb) . "\n";
print "F4:    " . integ(4, $nb) . "\n";
print "F5:    " . integ(5, $nb) . "\n";
print "F6:    " . integ(6, $nb) . "\n";
print "F7:    " . integ(7, $nb) . "\n";
print "F8:    " . integ(8, $nb) . "\n";
print "F9:    " . integ(9, $nb) . "\n";
print "F10:   " . integ(10, $nb). "\n";

sub integ {
    my $f = $_[0];
    my $n = $_[1];
    my $a = 0.0;
    my $b = 1.0;
    my $h = ($b - $a) / $n;

    my $string =
	sprintf("%.1E", rectangles($f, $n, $a, $h))   . "\t\t" .
	sprintf("%.1E", trapezes($f, $n, $a, $b, $h)) . "\t\t" .
	sprintf("%.1E", simpson($f, $n, $a, $b, $h))  . "\t\t";
    return $string
}

sub rectangles {
    my $f = $_[0];
    my $n = $_[1];
    my $a = $_[2];
    my $h = $_[3];
    my $s = 0.0;
    my $token = 0.0;

    while ($token < $n) {
	$s += f($f, $a + $h *  $token);
	$token++;
    }
   return abs (($h * $s) - 1.0)
}

sub trapezes {
    my $f = $_[0];
    my $n = $_[1];
    my $a = $_[2];
    my $b = $_[3];
    my $h = $_[4];
    my $s = 0.0;
    my $token = 1.0;

    while ($token < $n) {
	$s += f($f, $a + ($token * $h));
	$token++;
    }
    return abs(((($b - $a) / (2.0 * $n)) * (f($f, $a) + f($f, $b) + (2.0 * $s))) - 1.0)
}

sub simpson {
    my $f = $_[0];
    my $n = $_[1];
    my $a = $_[2];
    my $b = $_[3];
    my $h = $_[4];
    my $s1 = 0.0;
    my $s2 = 0.0;
    my $token = 1.0;

    while ($token < $n) {
	$s1 += f($f, $a + ($token * $h));
	$token++;
    }
    $token = 0.0;
    while ($token < $n) {
	$s2 += f($f, $a + ($token * $h) + ($h / 2.0));
	$token++;
    }
    return abs (((($b - $a) / (6.0 * $n)) * (f($f, $a) + f($f, $b) + (2.0 * $s1 + 4.0 * $s2))) - 1.0)
}

sub f {
    my $i = $_[0];
    my $x = $_[1];
    my $pi = 3.14159265358979;
    my $e = 2.71828182845905;
    if ($i == 1)  {return 1.0}
    if ($i == 2)  {return 2.0 * $x}
    if ($i == 3)  {return 3.0 * ($x ** 2.0)}
    if ($i == 4)  {return 4.0 * ($x ** 3.0)}
    if ($i == 5)  {return 5.0 * ($x ** 4.0)}
    if ($i == 6)  {return 6.0 * ($x ** 5.0)}
    if ($i == 7)  {return 1.0 / (2.0 * (sqrt(2.0) - 1.0) * sqrt($x + 1.0))}
    if ($i == 8)  {return 2.0 / (($x + 1.0) ** 2.0)}
    if ($i == 9)  {return ($pi / 2.0) * sin(($pi / 2.0) * $x)}
    if ($i == 10) {return ($e ** $x) / ($e - 1.0)}
}
