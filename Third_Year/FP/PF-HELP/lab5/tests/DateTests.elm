module DateTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Date exposing (..)

suite : Test
suite = 
  describe "Date module"
    [ describe "Date.createDate"
      [ test "createDate fails if the date is not between 1970 or 3000" <|
          \_ -> Expect.equal Nothing (Date.createDate 14 Apr 1800)
      , test "createDate fails if the day is not between 1 and 28 for February" <|
          \_ -> Expect.equal Nothing (Date.createDate 30 Feb 2001)
      ]
    ]
