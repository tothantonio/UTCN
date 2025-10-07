
module PointInShape exposing (..)

type alias Point = {x: Float, y: Float}
type Shape2D
  = Circle {center: Point, radius: Float}
  | Rectangle {topLeftCorner: Point, bottomRightCorner: Point}
  | Triangle {pointA: Point, pointB: Point, pointC: Point}

