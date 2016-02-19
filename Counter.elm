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
  div [ containerStyle ]
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    , hr [] []
    , button [ secondaryBtnStyle, onClick address Double ] [ text "*2" ]
    , button [ secondaryBtnStyle, onClick address Reset ] [ text "reset" ]
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

secondaryBtnStyle : Attribute
secondaryBtnStyle =
  style
    [ ("margin-right", "5px")
    , ("background-color", "#e7e7e7")
    , ("outline", "none")
    , ("border", "none")
    , ("font-size", "16px")
    ]

containerStyle : Attribute
containerStyle =
  style
    [ ("width", "100px")
    , ("margin", "20px auto")
    , ("text-align", "center")
    ]
