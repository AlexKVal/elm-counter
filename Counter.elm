module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

-- Model
type alias Model = Int


-- Update
type Action = Increment | Decrement | Double | Reset

update : Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    Double    -> model * 2
    Reset     -> 0


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    , hr [] []
    , button [ onClick address Double ] [ text "*2" ]
    , button [ onClick address Reset ] [ text "reset" ]
    ]

countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
