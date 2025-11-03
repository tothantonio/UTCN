module RecipeView exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Recipe = 
  { title: String
  , linkToOriginal: String
  , ingredients: List String
  , method: List String
  }

brownies = 
  { title = "Bloomin' brilliant brownies"
  , linkToOriginal = """http://www.jamieoliver.com/recipes/chocolate-recipes/
                        bloomin-brilliant-brownies"""
  , ingredients = 
    [ "200 g quality dark chocolate (70%)"
    , "250 g unsalted butter"
    , "75 g dried sour cherries , optional"
    , "50 g chopped nuts , optional"
    , "80 g quality cocoa powder"
    , "65 g plain flour"
    , "1 teaspoon baking powder"
    , "360 g caster sugar"
    , "4 large free-range eggs"
    ]
  , method = 
    [
      """Preheat the oven to 180C/350F/gas 4. 
         Line a 24cm square baking tin with greaseproof paper."""
    , """Snap the chocolate into a large bowl, 
         add the butter and place over a pan of simmering water, 
         until melted, stirring regularly. 
         Stir through the cherries and nuts (if using)."""
    , """Sift the cocoa powder and flour into a separate bowl, 
         add the baking powder and sugar, then mix together."""
    , """Add the dry ingredients to the chocolate, 
         cherry and nut mixture and stir together well. Beat the eggs, 
         then mix in until you have a silky consistency."""
    , """Pour the brownie mix into the baking tin, 
         and place in the oven for around 25 minutes. 
         You don't want to overcook them so, unlike cakes, you don't want 
         a skewer to come out clean - the brownies should be slightly
         springy on the outside but still gooey in the middle."""
    ]
  }

recipeView : Recipe -> Html msg
recipeView recipe = 
  div [class "recipe"]
      [h1 [] [ text recipe.title ]
      , p []
        [ a 
        [ href """http://www.jamieoliver.com/recipes/chocolate-recipes/
                  bloomin-brilliant-brownies"""]
        [ text "Original recipe" ]
      ]
      ] 


main = recipeView brownies
