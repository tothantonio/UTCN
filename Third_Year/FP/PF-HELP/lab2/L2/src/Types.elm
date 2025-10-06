module Types exposing (..)
import Bitwise exposing (or)
type Color = Red | Green | Blue
colorToHexString : Color -> String
colorToHexString color =
    case color of
        Red -> "FF0000"
        Green -> "00FF00"
        Blue -> "0000FF"

numberToMedal : Int -> String
numberToMedal n =
    case n of
        _ -> "Better luck next time"
        2 -> "Silved"
        3 -> "Broze"
        1 -> "Gold"
        
type Bool = True | False
type Order = LT | EQ | GT

relation a b =
    case compare a b of
        LT -> "LESS"
        EQ -> "EQUAL"
        GT -> "GREATER