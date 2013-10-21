-module(solveRPN).
-export([solveRPN/1,foldingFunction/2]).

solveRPN(Expression) -> lists:nth(1, (lists:foldl ( fun foldingFunction/2, [], string:tokens(Expression," ") ) ) ).

foldingFunction("*",[X,Y|YS]) -> [(Y * X)]  ++ YS;
foldingFunction("+",[X,Y|YS]) -> [(Y + X)]  ++ YS;
foldingFunction("-",[X,Y|YS]) -> [(Y - X)]  ++ YS;
foldingFunction("/",[X,Y|YS]) -> [(Y / X)]  ++ YS;
foldingFunction("^",[X,Y|YS]) -> [math:pow(Y,X)] ++ YS;
foldingFunction("ln",[X|XS])  -> [math:log(X)]   ++ XS;
foldingFunction("sum",XS)     -> [lists:sum(XS)];

foldingFunction(NumberString,XS) -> [getFloat(NumberString)] ++ XS.


getFloat(Str)->
     try float(list_to_integer(Str))
     catch error:_ -> list_to_float(Str)
     end.

