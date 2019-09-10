import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main = Browser.sandbox {init=init, update=update, view=view}


-- Model =======

type alias Model =
    { input: Maybe String
    , todos: List String
    }

init : Model
init = Model Nothing []


-- Msg =======

type Msg = Input String | Add | Delete Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        Input todo -> { model | input = Just todo }
        Add -> case model.input of
            Nothing -> { model | input = Nothing }
            Just i -> { model | input = Nothing, todos = model.todos ++ [i] }
        Delete n -> { model | todos = removeFromList n model.todos }

removeFromList i xs = (List.take i xs) ++ (List.drop (i+1) xs)


-- View =======

view : Model -> Html Msg
view model =
    div []
        [ input [type_ "text", placeholder "todo", value <| Maybe.withDefault "" model.input, onInput Input] []
        , button
            [disabled (model.input == Nothing), onClick Add]
            [text "add"]
        , div [] [renderList model.todos]
        ]


renderList : List String -> Html Msg
renderList lst =
    lst
        |> List.indexedMap (\i l -> li [onClick (Delete i)] [text l])
        |> ul []