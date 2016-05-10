% module Test.Main
-module(test_main@foreign).
-export([arrayFrom1UpTo/1]).

arrayFrom1UpTo(N) -> array:from_list(lists:seq(1,N)).
