
module Shapes exposing (..)

type Shape
  = Circle Float
  | Rectangle Float Float
  | Triangle Float Float Float


type ShapeRec
  = CircleRec { radius : Float }
  | RectangleRec { width : Float, height : Float }
  | TriangleRec { sideA : Float, sideB : Float, sideC : Float }


heron a b c =
  sqrt
    (((a + b + c) / 2)
      * (((a + b + c) / 2) - a)
      * (((a + b + c) / 2) - b)
      * (((a + b + c) / 2) - c)
    )


area : Shape -> Float
area shape =
  case shape of
    Circle radius -> pi * radius * radius
    Rectangle width height -> width * height
    Triangle a b c -> heron a b c


heronShort a b c =
  let
    s = (a + b + c) / 2
  in
    sqrt (s * (s - a) * (s - b) * (s - c))

