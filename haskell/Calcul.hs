module Calcul (
    calcul
) where

import qualified Text.Printf as Printf

calcul :: Integer -> String
calcul n =
    "n = " ++ (show n) ++ "\tReclangles\tTrapezes\tSimpson\n" ++
    "f1\t" ++ (calcul_integ f1 n) ++
    "f2\t" ++ (calcul_integ f2 n) ++
    "f3\t" ++ (calcul_integ f3 n) ++
    "f4\t" ++ (calcul_integ f4 n) ++
    "f5\t" ++ (calcul_integ f5 n) ++
    "f6\t" ++ (calcul_integ f6 n) ++
    "f7\t" ++ (calcul_integ f7 n) ++
    "f8\t" ++ (calcul_integ f8 n) ++
    "f9\t" ++ (calcul_integ f9 n) ++
    "f10\t" ++ (calcul_integ f10 n)

calcul_integ :: (Double -> Double) -> Integer -> String
calcul_integ f n =
    let a = 0.0
        b = 1.0
        h = (b - a) / (fromIntegral n) in

    (Printf.printf "%.1E" (rectangles f n a h)) ++ "\t\t" ++
    (Printf.printf "%.1E" (trapezes f n a b h)) ++ "\t\t" ++
    (Printf.printf "%.1E" (simpson f n a b h)) ++ "\t\t" ++ "\n"

somme :: Integer -> Integer -> (Double -> Double) -> Double
somme i e f
    | i < e = (f (fromInteger i)) + (somme (i + 1) e f)
    | otherwise = 0.0

rectangles :: (Double -> Double) -> Integer -> Double -> Double -> Double
rectangles f n a h =
    let inner_somme i = f (a + h * i)
        s = somme 0 n inner_somme in

    abs ((h * s) - 1.0)

trapezes :: (Double -> Double) -> Integer -> Double -> Double -> Double -> Double
trapezes f n a b h =
    let inner_somme i = f (a + h * i)
        s = somme 1 n inner_somme in

    abs ((((b - a) / (2.0 * (fromInteger n))) * ((f a) + (f b) + (2.0 * s))) - 1.0)

simpson :: (Double -> Double) -> Integer -> Double -> Double -> Double -> Double
simpson f n a b h =
    let inner_somme1 i = f (a + h * i)
        inner_somme2 i = f (a + (i * h) + (h / 2.0))
        s1 = somme 1 n inner_somme1
        s2 = somme 0 n inner_somme2 in

    abs ((((b - a) / (6.0 * (fromInteger n))) * ((f a) + (f b) + (2.0 * s1 + 4.0 * s2)))
    - 1.0)

f1 :: Double -> Double
f1 _ = 1.0

f2 :: Double -> Double
f2 x = 2.0 * x

f3 :: Double -> Double
f3 x = 3.0 * (x ** 2.0)

f4 :: Double -> Double
f4 x = 4.0 * (x ** 3.0)

f5 :: Double -> Double
f5 x = 5.0 * (x ** 4.0)

f6 :: Double -> Double
f6 x = 6.0 * (x ** 5.0)

f7 :: Double -> Double
f7 x = 1.0 / (2.0 * ((sqrt 2.0) - 1.0) * (sqrt (x + 1.0)))

f8 :: Double -> Double
f8 x = 2.0 / ((x + 1.0) ** 2.0)

f9 :: Double -> Double
f9 x = (pi / 2.0) * (sin ((pi / 2.0) * x))

f10 :: Double -> Double
f10 x = (exp x) / ((exp 1.0) - 1.0)
