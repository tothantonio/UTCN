module FirstTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Lists exposing (..)


emptyListTakeTest : Test
emptyListTakeTest = test "Take for an empty list returns the empty list" <|
    \_ -> Expect.equal [] (Lists.take 1 [])

