module OrganizedTests exposing (..)

import Expect exposing (Expectation)
import Lists exposing (..)
import Test exposing (..)


listTests : Test
listTests =
  describe "Lists module"
    [ describe "Lists.take"
      [ test "Take for an empty list returns the empty list" <|
        \_ -> Expect.equal [] (Lists.take 1 [])
      , test "Take 0 returns the empty list for any list" <|
        \_ -> Expect.equal [] (Lists.take 0 [ 1, 2 ])
      ]
    , describe "List.drop"
      [ test "Drop for an empty list returns the empty list" <|
        \_ -> Expect.equal [] (Lists.drop 1 [])
      , test "Drop 0 returns the original list for any list" <|
        \_ -> Expect.equal [ 1, 2 ] (Lists.drop 0 [ 1, 2 ])
      ]
    ]

