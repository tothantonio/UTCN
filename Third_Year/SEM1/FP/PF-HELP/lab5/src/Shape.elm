module Shape exposing (..)


type Shape
  = Circle Float
  | Rectangle Float Float
  | Triangle Float Float Float


heron a b c =
  let
    s = (a + b + c) / 2
  in
    sqrt (s * (s - a) * (s - b) * (s - c))


type InvalidShapeError
  = InvalidCircle
  | InvalidRectangle InvalidRectangleError
  | InvalidTriangle InvalidTriangleError



type InvalidRectangleError
  = InvalidWidth
  | InvalidHeight



type InvalidTriangleError
 = NegativeSide TriangleSide
 | ImpossibleTriangle



type TriangleSide = A | B | C



safeAreaEnum : Shape -> Result InvalidShapeError Float
safeAreaEnum shape =
  case shape of
    Circle radius ->
      if radius < 0 then
        Err InvalidCircle
      else
        Ok (pi * radius * radius)
    Rectangle width height ->
      safeRectangleAreaEnum width height |> Result.mapError InvalidRectangle
    Triangle a b c -> 
      safeHeronEnum a b c |> Result.mapError InvalidTriangle 



safeRectangleAreaEnum : Float -> Float -> Result InvalidRectangleError Float
safeRectangleAreaEnum width height =
  if (width < 0) then
    Err InvalidWidth
  else if (height < 0) then
    Err InvalidHeight
  else
    Ok (width * height)



safeHeronEnum : Float -> Float -> Float -> Result InvalidTriangleError Float
safeHeronEnum a b c =
  if (a < 0) then
    Err (NegativeSide A)
  else if (b < 0) then
    Err (NegativeSide B)
  else if (c < 0) then
    Err (NegativeSide C)
  else if ((a + b < c) || (a + c < b) || (b + c < a)) then
    Err ImpossibleTriangle
  else Ok (heron a b c)

