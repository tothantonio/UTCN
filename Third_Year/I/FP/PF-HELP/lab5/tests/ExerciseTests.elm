module ExerciseTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Exercises exposing (..)
import Theme

suite : Test
suite = 
  describe "Exercises module"
    [ skip <| describe "Exercises.usersWithPhoneNumbers"
      [ test "First example" <| 
          \_ -> 
            let 
              user1 = makeUser "john00" "johndoe@gmail.com" "John" "Doe" (Just "0123456789")
              user2 = makeUser "jane12" "jane12@yahoo.com" "Jane" "Doe" Nothing
              user3 = makeUser "jacob14" "jacobh@yahoo.com" "Jacob" "Hunt" (Just "345870481")
            in
              Expect.equal [user1.email, user3.email] <| usersWithPhoneNumbers [user1, user2, user3]
      , todo "Write a second test"
      ]
    , skip <| describe "Exercises.changePreferenceToDarkTheme"
      [ test "First example" <| 
          \_ -> 
            let 
              config1 = AccountConfiguration Theme.Light True False
              config1Dark = AccountConfiguration Theme.Dark True False
              config2 = AccountConfiguration Theme.Dark False False
              config3 = AccountConfiguration Theme.Dark False True
            in
              Expect.equal [config1Dark, config2, config3] <| changePreferenceToDarkTheme [config1, config2, config3]
      , todo "Write a second test"
      ]
    ]
