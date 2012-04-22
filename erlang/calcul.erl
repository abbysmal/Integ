-module(calcul).
-export([calcul/1]).

calcul(N) ->
    "n = " ++ erlang:integer_to_list(N) ++
    "\tReclangles\tTrapezes\tSimpson\n" ++
    "f1\t" ++ calcul_integ(fun(X) -> f1(X) end, N) ++
    "f2\t" ++ calcul_integ(fun(X) -> f2(X) end, N) ++
    "f3\t" ++ calcul_integ(fun(X) -> f3(X) end, N) ++
    "f4\t" ++ calcul_integ(fun(X) -> f4(X) end, N) ++
    "f5\t" ++ calcul_integ(fun(X) -> f5(X) end, N) ++
    "f6\t" ++ calcul_integ(fun(X) -> f6(X) end, N) ++
    "f7\t" ++ calcul_integ(fun(X) -> f7(X) end, N) ++
    "f8\t" ++ calcul_integ(fun(X) -> f8(X) end, N) ++
    "f9\t" ++ calcul_integ(fun(X) -> f9(X) end, N) ++
    "f10\t" ++ calcul_integ(fun(X) -> f10(X) end, N).

calcul_integ(F, N) ->
    A = 0.0,
    B = 1.0,
    H = (B - A) / N,

    io_lib:format("~.2e", [rectangles(F, N, A, H)]) ++ "\t\t" ++
    io_lib:format("~.2e", [trapezes(F, N, A, B, H)]) ++ "\t\t" ++
    io_lib:format("~.2e", [simpson (F, N, A, B, H)]) ++ "\n".

somme(I, E, F) ->
    if
        I < E -> F(I) + somme(I + 1, E, F);
        true -> 0.0
    end.

rectangles(F, N, A, H) ->
    Inner_somme = fun(I) -> F(A + H * I) end,
    S = somme(0, N, Inner_somme),

    abs((H * S) - 1.0).

trapezes(F, N, A, B, H) ->
    Inner_somme = fun(I) -> F(A + H * I) end,
    S = somme(1, N, Inner_somme),

    abs((((B - A) / (2.0 * N)) * (F(A) + F(B) + (2.0 * S))) - 1.0).

simpson(F, N, A, B, H) ->
    Inner_somme1 = fun(I) -> F(A + H * I) end,
    Inner_somme2 = fun(I) -> F(A + (I * H) + (H / 2.0)) end,
    S1 = somme(1, N, Inner_somme1),
    S2 = somme(0, N, Inner_somme2),

    abs((((B - A) / (6.0 * N)) * (F(A) + F(B) + (2.0 * S1 + 4.0 *
    S2))) - 1.0).

f1(_) -> 1.0.

f2(X) -> 2.0 * X.

f3(X) -> 3.0 * math:pow(X, 2.0).

f4(X) -> 4.0 * math:pow(X, 3.0).

f5(X) -> 5.0 * math:pow(X, 4.0).

f6(X) -> 6.0 * math:pow(X, 5.0).

f7(X) -> 1.0 / (2.0 * (math:sqrt(2.0) - 1.0) * math:sqrt(X + 1.0)).

f8(X) -> 2.0 / math:pow((X + 1.0), 2.0).

f9(X) -> (math:pi() / 2.0) * math:sin((math:pi() / 2.0) * X).

f10(X) -> math:exp(X) / (math:exp(1.0) - 1.0).
