module Theme exposing (..)


type ThemeConfig = Light | Dark


type Color = White | Black



parseTheme : String -> Maybe ThemeConfig
parseTheme s = 
   case s of
      "dark" -> Just Dark
      "light" -> Just Light
      _ -> Nothing



themeToColor : ThemeConfig -> Color
themeToColor th =
  case th of
    Light -> White
    Dark -> Black



pageBackground : String -> Color
pageBackground s = 
  s 
    |> parseTheme 
    |> Maybe.map themeToColor
    |> Maybe.withDefault White

