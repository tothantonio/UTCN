module Records exposing (..)


type Color = Red | Green | Blue



type alias ColoredCircle = { x: Int, y: Int, color: Color, radius: Int}



moveConstructor : ColoredCircle -> Int -> Int -> ColoredCircle
moveConstructor circle dx dy =
  ColoredCircle (circle.x + dx) (circle.y + dy) circle.color circle.radius



moveRec : ColoredCircle -> Int -> Int -> ColoredCircle
moveRec circle dx dy =
  { x = circle.x + dx
  , y = circle.y + dy
  , color = circle.color
  , radius = circle.radius
  }



moveDestructure : ColoredCircle -> Int -> Int -> ColoredCircle
moveDestructure circle dx dy =
  let 
    { x, y, color, radius } = circle
  in
    { x = x + dx, y = y + dy, color = color, radius = radius }



moveUpdate : ColoredCircle -> Int -> Int -> ColoredCircle
moveUpdate circle dx dy =
  { circle | x = circle.x + dx, y = circle.y + dy }

