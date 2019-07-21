import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main = Browser.sandbox {init=init, update=update, view=view}

type alias Model = Int

-- 初期値
init : Model
init = 0

-- reduxならaction creator
type Msg = Increment | Decrement

-- reducerのイメージ
update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment -> model + 1
        Decrement -> model - 1


-- onClickにactionを渡す
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-"]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+"]
        ]
