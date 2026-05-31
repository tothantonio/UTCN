module Debugging exposing (..)

import List as L


sumOfOddLastDigitsPipe : List Int -> Int
sumOfOddLastDigitsPipe l =
  l 
    |> Debug.log "Original list: "
    |> L.filter (\x -> modBy 2 x == 1)
    |> Debug.log "Odd elements: "
    |> L.map (modBy 10)
    |> Debug.log "Last digits: "
    |> L.foldl (+) 0
    |> Debug.log "Final sum: "

