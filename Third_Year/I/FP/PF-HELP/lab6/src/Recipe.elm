module Recipe exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main = div [] 
  [ h1 [ style "font-family" "arial" ] 
    [ a 
      [ href """http://www.jamieoliver.com/recipes/chocolate-recipes/
                bloomin-brilliant-brownies"""]
      [ text "Bloomin' brilliant brownies" ]
    ]
  , h3 [] [ i [] [ text "Ingredients:" ]]
  , ul []
    [ li [] [ text "200 g quality dark chocolate (70%)"]
    , li [] [ text "250 g unsalted butter"]
    , li [] [ text "75 g dried sour cherries , optional"]
    , li [] [ text "50 g chopped nuts , optional"]
    , li [] [ text "80 g quality cocoa powder"]
    , li [] [ text "65 g plain flour"]
    , li [] [ text "1 teaspoon baking powder"]
    , li [] [ text "360 g caster sugar"]
    , li [] [ text "4 large free-range eggs"]
    ]
  , h3 [] [ i [] [ text "Method:" ]]
  , p [] [ text """Preheat the oven to 180C/350F/gas 4. 
                   Line a 24cm square baking tin with greaseproof paper."""]
  , p [] [ text """Snap the chocolate into a large bowl, 
                   add the butter and place over a pan of simmering water, 
                   until melted, stirring regularly. 
                   Stir through the cherries and nuts (if using)."""]
  , p [] [ text """Sift the cocoa powder and flour into a separate bowl, 
                   add the baking powder and sugar, then mix together."""]
  , p [] [ text """Add the dry ingredients to the chocolate, 
                   cherry and nut mixture and stir together well. Beat the eggs, 
                   then mix in until you have a silky consistency."""]
  , p [] [ text """Pour the brownie mix into the baking tin, 
                   and place in the oven for around 25 minutes. 
                   You don't want to overcook them so, unlike cakes, you don't want 
                   a skewer to come out clean - the brownies should be slightly
                   springy on the outside but still gooey in the middle."""]
  ]
  
