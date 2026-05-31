module Lists exposing (..)
import Html exposing (a)

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

last : List a -> Maybe a
last l = 
  case l of
      [] -> Nothing
      [x] -> Just x
      _::xs -> last xs

len : List Int -> Int
len l = 
  case l of
    [] -> 0
    _::xs -> 1 + len xs

lenTail : List Int -> Int
lenTail la = 
  let
    lenAcc lb acc = 
      case lb of
          [] -> acc
          _::xs -> lenAcc xs (acc + 1)
  in
  lenAcc la 0

safeDiv : Int -> Int -> Maybe Int
safeDiv a b = 
  if b == 0 then Nothing
  else Just (a // b)

indexList : Int -> List Int -> Maybe Int
indexList i l = 
  case l of
    [] -> Nothing
    x::xs -> 
      if i == 0 then
        Just x
      else indexList (i-1) xs

fib : number -> number
fib n = if (n == 0) || (n == 1) then 1 else (fib (n-1) + fib(n-2))

fibs : number -> number -> List (number, number)
fibs start end = 
  if start >= end then []
  else (start, fib(start)) :: fibs(start + 1) end


