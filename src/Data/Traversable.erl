% module Data.Traversable
-module(data_traversable@foreign).
-export([traverseArrayImpl/1]).

traverseArrayImpl(Apply) ->
  fun (Map) ->
    fun (Pure) ->
      fun (F) ->
        fun (Array) ->
          Cons = fun (X) -> fun (XS) -> [X|XS] end end,
          BuildFrom = fun (_, X, YS) ->
            (Apply( (Map(Cons))(F(X)) ))(YS)
          end,
          ResultList = array:foldr(BuildFrom, Pure([]), Array),
          (Map(fun array:from_list/1))(ResultList)
        end
      end
    end
  end.
