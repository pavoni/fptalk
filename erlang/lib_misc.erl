-module(lib_misc).
-export([qsort/1,pythag/1]).

qsort([]) -> [];
qsort([Pivot|T]) ->
          qsort([X || X <- T, X < Pivot])
          ++ [Pivot] ++
          qsort([X || X<- T, X>= Pivot]).


pythag(N) ->
          [{A,B,C} ||
              A <- lists:seq(1,N),
              B <- lists:seq(1,N),
              C <- lists:seq(1,N),
              A+B+C =< N,
              A =< B,
              B =< C,
              A*A+B*B =:= C*C
          ].