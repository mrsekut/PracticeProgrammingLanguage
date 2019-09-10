import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main = Browser.sandbox {init=init, update=update, view=view}


-- Model =======

type alias Model =
    { input: String
    , todos: List String
    }

init : Model
init = Model "" []


-- Msg =======

type Msg = Input String | Add | Delete Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        Input todo -> { model | input = todo }
        Add -> { model | input = "", todos = model.todos ++ [model.input] }
        Delete n -> { model | todos = removeFromList n model.todos }

removeFromList i xs = (List.take i xs) ++ (List.drop (i+1) xs)


-- View =======

view : Model -> Html Msg
view model =
    div []
        [ input [type_ "text", placeholder "todo", value model.input, onInput Input] []
        , button [onClick Add] [text "add"]
        , div [] [renderList model.todos]
        ]


renderList : List String -> Html Msg
renderList lst =
    lst
        |> List.indexedMap (\i l -> li [onClick (Delete i)] [text l])
        |> ul []