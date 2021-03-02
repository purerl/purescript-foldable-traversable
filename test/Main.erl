% module Test.Main
-module(test_main@foreign).
-export([arrayFrom1UpTo/1, arrayReplicate/2, mkNEArray/3, foldMap1NEArray/3, deferEff/1]).

arrayFrom1UpTo(N) -> array:from_list(lists:seq(1,N)).

arrayReplicate(N,X) -> 
  array:from_list(lists:duplicate(N, X)). 

mkNEArray(Nothing,Just,Arr) ->
  case array:size(Arr) of
    N when N > 0 -> Just(Arr);
    _ -> Nothing
  end.

foldMap1NEArray(Append,F,Arr) ->
  [H | T] = array:to_list(Arr),
  lists:foldl(fun (X, Acc) -> (Append(Acc))(F(X)) end, F(H), T).

deferEff(F) -> fun () -> F(unit) end.