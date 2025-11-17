module Countries exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Http
import Json.Decode as Dec


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Country =
    { name : String
    , area : Float
    , region : String
    }




decodeCountry : Dec.Decoder Country
decodeCountry =
    Dec.map3 Country 
        (Dec.at  ["name", "common"] Dec.string)
        (Dec.field "area" Dec.float)
        (Dec.field "region" Dec.string)



type Model
    = Initial
    | RequestSent
    | Success (List Country)
    | Error Http.Error



init : () -> ( Model, Cmd Msg )
init _ =
    ( Initial
    , Cmd.none
    )




type Msg
    = GetCountries
    | GotCountries (Result Http.Error (List Country))



getCountries : Cmd Msg
getCountries = Http.get 
    { url = "https://restcountries.com/v3.1/all"
    , expect = Http.expectJson GotCountries (Dec.list decodeCountry) 
    }



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetCountries ->
            ( RequestSent
            , getCountries
            )

        GotCountries (Ok countries) ->
            ( Success countries
            , Cmd.none
            )

        GotCountries (Err err) ->
            ( Error err
            , Cmd.none
            )



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none




view : Model -> Html Msg
view model =
    case model of
        Initial ->
            viewInitial

        RequestSent ->
            div [] [ text "Loading..." ]

        Success countries ->
            viewSuccess countries

        Error err ->
            viewError err


viewInitial : Html Msg
viewInitial =
    div []
        [ button [ onClick GetCountries ] [ text "Get countries" ]
        ]


viewCountry : Country -> Html msg
viewCountry {name, area, region} =
    div [style "border" "solid 1px", style "margin" "2px"] 
        [ p [] [text <| "Name:" ++ name]
        , p [] [text <| "Area: " ++ String.fromFloat area]
        ]



viewSuccess : List Country -> Html msg
viewSuccess countries =
    div [] ((h2 [] [ text "ok" ])::List.map viewCountry countries)


httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        Http.BadUrl _ ->
            "Bad Url"

        Http.Timeout ->
            "Timeout"

        Http.NetworkError ->
            "Network Error"

        Http.BadStatus status ->
            "BadS tatus: " ++ String.fromInt status

        Http.BadBody _ ->
            "Bad Body"


viewError : Http.Error -> Html msg
viewError err =
    div [] [ h2 [] [ text "Rip" ], p [] [ text <| httpErrorToString err ] ]


    
