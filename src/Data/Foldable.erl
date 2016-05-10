% module Data.Foldable
-module(data_foldable@foreign).
-export([foldrArray/1, foldlArray/1]).


% foreign import foldrArray :: forall a b. (a -> b -> b) -> b -> Array a -> b
% foreign import foldlArray :: forall a b. (b -> a -> b) -> b -> Array a -> b

foldrArray(F) ->
  fun (Init) ->
    fun (Xs) ->
      array:foldr(fun (_, X, A) -> (F(X))(A) end, Init, Xs)
    end
  end.

foldlArray(F) ->
  fun (Init) ->
    fun (Xs) ->
      array:foldl(fun (_, X, A) -> (F(A))(X) end, Init, Xs)
    end
  end.
