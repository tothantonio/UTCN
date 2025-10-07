
module LetIn exposing (..)

howBig n =
  if n < 10 then
    "Small"
  else if n < 100 then
    "Medium"
  else
    "Large"

howBigLetIn n =
  let
    smallNumber = 10
    mediumNumber = 100
  in
    if n < smallNumber then
      "Small"
    else if n < mediumNumber then
      "Medium" 
    else 
      "Large"

