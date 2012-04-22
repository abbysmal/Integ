let pi = 4.0 *. atan 1.0

let rec somme i e f =
    if i < e then
        (f (float_of_int i)) +. (somme (i + 1) e f)
    else
        0.0

let rectangles f n a h =
    let inner_somme i = f (a +. h *. i) in
    let s = somme 0 n inner_somme in

    abs_float ((h *. s) -. 1.0)

let trapezes f n a b h =
    let inner_somme i = f (a +. h *. i) in
    let s = somme 1 n inner_somme in

    abs_float ((((b -. a) /. (2.0 *. (float_of_int n))) *. ((f a) +. (f b) +. (2.0 *. s))) -. 1.0)

let simpson f n a b h =
    let inner_somme1 i = f (a +. h *. i) in
    let inner_somme2 i = f (a +. (i *. h) +. (h /. 2.0)) in
    let s1 = somme 1 n inner_somme1
    and s2 = somme 0 n inner_somme2 in

    abs_float ((((b -. a) /. (6.0 *. (float_of_int n))) *. ((f a) +. (f b) +. (2.0 *. s1 +. 4.0 *. s2)))
    -. 1.0)

let f1 x = 1.0

let f2 x = 2.0 *. x

let f3 x = 3.0 *. (x ** 2.0)

let f4 x = 4.0 *. (x ** 3.0)

let f5 x = 5.0 *. (x ** 4.0)

let f6 x = 6.0 *. (x ** 5.0)

let f7 x = 1.0 /. (2.0 *. ((sqrt 2.0) -. 1.0) *. (sqrt (x +. 1.0)))

let f8 x = 2.0 /. ((x +. 1.0) ** 2.0)

let f9 x = (pi /. 2.0) *. (sin ((pi /. 2.0) *. x))

let f10 x = (exp x) /. ((exp 1.0) -. 1.0)

let calcul_integ f n =
    let a = 0.0
    and b = 1.0 in
    let h = (b -. a) /. (float_of_int n) in

    (Printf.sprintf "%.1E" (rectangles f n a h)) ^ "\t\t" ^
    (Printf.sprintf "%.1E" (trapezes f n a b h)) ^ "\t\t" ^
    (Printf.sprintf "%.1E" (simpson f n a b h)) ^ "\t\t" ^ "\n"

let calcul n =
    "n = " ^ (string_of_int n) ^ "\tReclangles\tTrapezes\tSimpson\n" ^
    "f1\t" ^ (calcul_integ f1 n) ^
    "f2\t" ^ (calcul_integ f2 n) ^
    "f3\t" ^ (calcul_integ f3 n) ^
    "f4\t" ^ (calcul_integ f4 n) ^
    "f5\t" ^ (calcul_integ f5 n) ^
    "f6\t" ^ (calcul_integ f6 n) ^
    "f7\t" ^ (calcul_integ f7 n) ^
    "f8\t" ^ (calcul_integ f8 n) ^
    "f9\t" ^ (calcul_integ f9 n) ^
    "f10\t" ^ (calcul_integ f10 n)
