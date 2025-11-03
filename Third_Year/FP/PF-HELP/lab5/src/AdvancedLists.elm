module AdvancedLists exposing (..)

import Lists exposing (foldl, map, filter)


sumOfOddLastDigits : List Int -> Int
sumOfOddLastDigits l =
  foldl (+) 0 (map (modBy 10) (filter (\x -> modBy 2 x == 1) l))



sumOfOddLastDigitsPipe : List Int -> Int
sumOfOddLastDigitsPipe l =
  l 
    |> filter (\x -> modBy 2 x == 1)
    |> map (modBy 10)
    |> foldl (+) 0


all: (a->Bool) -> List a -> Bool
all expr list = 
  list
    |> map expr
    |> foldl (&&) True

any: (a->Bool) -> List a -> Bool
any expr list = 
  list
    |> map expr
    |> foldl (||) False

map2 : (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
map2 f ma mb = 
  case ma of
    Just a ->
      case mb of
        Just b -> Just (f a b)
        Nothing -> Nothing
    Nothing -> Nothing