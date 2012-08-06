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
    io:format("~s", [calcul:calcul(N)]).
