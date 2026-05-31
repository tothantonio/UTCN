module Generic exposing (..)


reverseTuple : (a, a) -> (a, a)
reverseTuple (a, b) = (b, a)



type Box a = Box a



unboxInt : Box Int -> Int
unboxInt (Box i) = i



type Pair a b = Pair a b
type alias IntPair = Pair Int Int

addIntPair : IntPair -> Int
addIntPair (Pair a b) = a + b

