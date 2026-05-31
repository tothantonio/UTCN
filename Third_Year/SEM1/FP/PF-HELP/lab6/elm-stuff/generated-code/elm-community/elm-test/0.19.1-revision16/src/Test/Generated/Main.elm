module Test.Generated.Main exposing (main)

import CoinFlipTests
import CounterTests
import Example
import RecipeTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 385664778493600
        , processes = 8
        , globs =
            []
        , paths =
            [ "D:\\TUCN\\UTCN\\Third_Year\\FP\\PF-HELP\\lab6\\tests\\CoinFlipTests.elm"
            , "D:\\TUCN\\UTCN\\Third_Year\\FP\\PF-HELP\\lab6\\tests\\CounterTests.elm"
            , "D:\\TUCN\\UTCN\\Third_Year\\FP\\PF-HELP\\lab6\\tests\\Example.elm"
            , "D:\\TUCN\\UTCN\\Third_Year\\FP\\PF-HELP\\lab6\\tests\\RecipeTests.elm"
            ]
        }
        [ ( "CoinFlipTests"
          , [ Test.Runner.Node.check CoinFlipTests.initialViewTest
            ]
          )
        , ( "CounterTests"
          , [ Test.Runner.Node.check CounterTests.viewHasTwoButtons
            , Test.Runner.Node.check CounterTests.viewContainsTheCurrentCount
            , Test.Runner.Node.check CounterTests.buttonDisabledOver10
            ]
          )
        , ( "Example"
          , [ Test.Runner.Node.check Example.suite
            ]
          )
        , ( "RecipeTests"
          , [ Test.Runner.Node.check RecipeTests.atLeastOneIngredient
            , Test.Runner.Node.check RecipeTests.atLeastOneIngredientClass
            , Test.Runner.Node.check RecipeTests.eachIngredientHasClassIngredient
            ]
          )
        ]