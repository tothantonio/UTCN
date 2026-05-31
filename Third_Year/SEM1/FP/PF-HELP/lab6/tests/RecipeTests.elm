module RecipeTests exposing (..)

import RecipeView
import Expect exposing (Expectation)
import Test exposing (..)
import Test.Html.Query as Q
import Test.Html.Selector as S



atLeastOneIngredient : Test
atLeastOneIngredient = skip <| test "each recipe contains at least one ingredient" <|
  \_ -> 
    RecipeView.recipeView RecipeView.brownies
      |> Q.fromHtml
      |> Q.find [S.tag "ul"]
      |> Q.children [S.tag "li"]
      |> Q.count (Expect.atLeast 1)



atLeastOneIngredientClass : Test
atLeastOneIngredientClass = 
  skip <| test "each recipe contains at least one ingredient (using classes)" <|
    \_ -> 
      RecipeView.recipeView RecipeView.brownies
        |> Q.fromHtml
        |> Q.findAll [S.class "ingredient"]
        |> Q.count (Expect.atLeast 1)



eachIngredientHasClassIngredient : Test
eachIngredientHasClassIngredient = skip <| test "each ingredient has class ingredient" <|
  \_ -> 
    RecipeView.recipeView RecipeView.brownies
      |> Q.fromHtml
      |> Q.find [S.tag "ul"]
      |> Q.children [S.tag "li"]
      |> Q.each (Expect.all [Q.has [S.class "ingredient"]])
