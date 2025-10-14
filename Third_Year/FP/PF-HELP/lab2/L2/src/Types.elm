
module Types exposing (..)

type Person = Person String String

type alias PersonRec = {firstName: String, lastName: String}

fullName : Person -> String
fullName (Person firstName lastName) = firstName ++ " " ++ lastName

fullNameLetIn : Person -> String
fullNameLetIn person =
  let
    (Person firstName lastName) = person
  in
    firstName ++ " " ++ lastName

fullNameRec : PersonRec -> String
fullNameRec {firstName, lastName} = firstName ++ " " ++ lastName

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
    1 -> "Gold"
    2 -> "Silved"
    3 -> "Broze"
    _ -> "Better luck next time"


-- https://en.wikipedia.org/wiki/Launch_commit_criteria
type WeatherConditions = WeatherConditions {windSpeed: Int, cloudLayer: Int}

launchCommit : WeatherConditions -> (String, Bool)
launchCommit (WeatherConditions {windSpeed, cloudLayer}) =
  case (windSpeed < 61, cloudLayer < 1400) of
    (True, True) -> ("Launch can proceed", True)
    (False, True) -> ("Wind speeds are too high", False)
    (True, False) -> ("Cloud layer is too thick", False)
    (_, _) -> ("Suboptimal conditions", False)

