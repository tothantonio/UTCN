module Functions exposing (..)


const : a -> (b -> a)
const x = \_ -> x



flip : (a -> b -> c) -> (b -> a -> c)
flip f = \x -> \y -> f y x



uncurry: (a -> b -> c) -> ((a, b) -> c)
uncurry f = \(x, y) -> f x y



pow : Int -> Int -> Int
pow n i = if i == 0 then 1 else n * pow n (i - 1)



square : Int -> Int
square n = pow n 2



cubePf : Int -> Int
cubePf = (flip pow) 3



fibTail : Int -> Int
fibTail n = 
  let
    fibTailHelper f1 f2 i = if i == 0 then f2 else fibTailHelper f2 (f1 + f2) (i - 1)
  in
    fibTailHelper 0 1 n



fibTailPf : Int -> Int
fibTailPf = 
  let
    fibTailHelper f1 f2 i = if i == 0 then f2 else fibTailHelper f2 (f1 + f2) (i - 1)
  in
    fibTailHelper 0 1



countFromTo : Int -> Int -> List Int
countFromTo start end =
  let
    cnt acc lo hi = if lo >= hi then acc else cnt ((hi - 1)::acc) lo (hi - 1)
  in
    cnt [] start end



countFromToPf : Int -> Int -> List Int
countFromToPf =
  let
    cnt acc lo hi = if lo >= hi then acc else cnt ((hi - 1)::acc) lo (hi - 1)
  in
    cnt []



countFromToCl : Int -> Int -> List Int
countFromToCl start end =
  let
    cnt acc i = if start >= i then acc else cnt ((i - 1)::acc) (i - 1)
  in
    cnt [] end



between : Int -> Int -> Int -> Bool
between lo hi n = (lo <= n) && (n <= hi)



betweenClo : Int -> Int -> Int -> Bool
betweenClo lo hi =
  let
    betweenInner n = (lo <= n) && (n <= hi)
  in
    betweenInner



betweenLam : Int -> Int -> Int -> Bool
betweenLam lo hi = \n -> (lo <= n) && (n <= hi)



curried : Int -> Int -> Int -> Int
curried =
  let
    curriedX x =
      let
        curriedY y =
          let
            curriedZ z = x + y + z
          in
            curriedZ
      in
        curriedY
  in
    curriedX

