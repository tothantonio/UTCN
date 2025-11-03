module Lists exposing (..)


take : Int -> List a -> List a
take n l =
  if n <= 0 then
    []
  else
    case l of
      [] -> []
      x::xs -> x :: take (n - 1) xs



drop : Int -> List a -> List a
drop n l =
  if n <= 0 then
    l
  else
    case l of
      [] -> []
      _::xs -> drop (n - 1) xs



takeWhile : (a -> Bool) -> List a -> List a
takeWhile p l =
  case l of
    [] -> []
    x::xs -> 
      if p x then
        x :: takeWhile p xs
      else
        []



dropWhile : (a -> Bool) -> List a -> List a
dropWhile p l =
  case l of
    [] -> []
    x::xs -> 
      if p x then
        dropWhile p xs
      else
        x::xs



zip : List a -> List b -> List (a, b)
zip lx ly =
  case (lx, ly) of
    (x::xs, y::ys) -> (x, y)::(zip xs ys)
    _ -> []



unzip : List (a, b) -> (List a, List b)
unzip l =
  case l of
    [] -> ([], [])
    (x, y)::ls -> 
      let
        (xs, ys) = unzip ls
      in
        (x::xs, y::ys)



map : (a -> b) -> List a -> List b
map fn l =
  case l of 
    [] -> []
    x::xs -> (fn x)::map fn xs



filter : (a -> Bool) -> List a -> List a
filter pred l =
  case l of 
    [] -> []
    x::xs -> 
      if (pred x) then
        x::filter pred xs
      else
        filter pred xs



foldr : (a -> b -> b) -> b -> List a -> b
foldr op start l =
  case l of
    [] -> start
    x::xs -> op x (foldr op start xs)



foldl : (a -> b -> b) -> b -> List a -> b
foldl op start l =
  case l of
    [] -> start
    x::xs -> foldl op (op x start) xs




all : (a -> Bool) -> List a -> Bool
all pred l =
  case l of 
    [] -> True
    x::xs -> 
      if pred x then
        all pred xs
      else
        False



any : (a -> Bool) -> List a -> Bool
any pred l =
  case l of
    [] -> False
    x::xs -> 
      if pred x then
        True
      else
        any pred xs



partition : comparable -> List comparable -> (List comparable, List comparable)
partition pivot l = 
  (filter (\x -> x < pivot) l, filter (\x -> x >= pivot) l)



quicksort : List comparable -> List comparable
quicksort l =
  case l of
    [] -> []
    x::xs -> 
      let
        (less, greater) = partition x xs
      in
        (quicksort less) ++ [x] ++ (quicksort greater)


