#!/usr/bin/escript

-module(main).
-export([main/1]).
-import(calcul).

main([Args]) ->
    if
        length([Args]) == 1 -> inner(erlang:list_to_integer(Args));
        true -> io:format("..\n")
    end.

inner(N) ->
    if
        N >= 10, N =< 100 -> io:format("~s", [calcul:calcul(N)]);
        true -> io:format(".\n")
    end.
