module ColoredSphere exposing (..)


type alias Point = {x: Int, y: Int, z: Int}
type Color = Red | Green | Blue

type alias ColoredSphere = {center: Point, color: Color, radius: Int}

