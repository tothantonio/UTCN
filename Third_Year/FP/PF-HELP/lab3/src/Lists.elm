module Lists exposing (..)


countFromTo : Int -> Int -> List Int
countFromTo from to =
  if from >= to then
    []
  else
    from :: countFromTo (from + 1) to



sumOfElements : List Int -> Int
sumOfElements l =
  case l of
    [] -> 0
    x::xs -> x + sumOfElements xs

len : List Int -> Int
len l = 
  case l of
    [] -> 0
    x::xs -> 1 + len xs



countFromToTail : Int -> Int -> List Int
countFromToTail from to =
  let
    cnt a b acc = 
      if a >= b then
        acc
      else
        cnt a (b - 1) ((b - 1)::acc)
  in
    cnt from to []



append : List a -> List a -> List a
append lx ly =
  case lx of
    [] -> ly
    x::xs -> x :: append xs ly



reverse : List a -> List a
reverse l =
  let
    reverseAcc lx acc = 
      case lx of
        [] -> acc
        x::xs -> reverseAcc xs (x::acc)
  in
    reverseAcc l []



appendTail : List a -> List a -> List a
appendTail la lb =
  let
    appTail lx acc =
      case lx of 
        [] -> acc
        x::xs -> appTail xs (x::acc)
  in
    appTail (reverse la) lb



head : List a -> Maybe a
head l =
  case l of
    [] -> Nothing
    x::_ -> Just x



tail : List a -> Maybe (List a)
tail l =
  case l of
    [] -> Nothing
    _::xs -> Just xs

