-module(movingAv).
-export([mv_av/2]).


mv_av(N,L ) -> run_sums(N, lists:sum(lists:sublist(L,N)),L,lists:nthtail(N,L)).

run_sums (N,Sum,[H|HS],[T|TS]) ->  [Sum/N] ++ run_sums(N,(Sum-H+T), HS, TS);
run_sums (_,_  ,[], _)   -> [];
run_sums (N,Sum,_ ,[]) -> [Sum/N].


