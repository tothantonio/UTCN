module Patterns where

import Prelude hiding (takeWhile, dropWhile)


fib n =
  if n == 0 then
    0
  else if n == 1 then
    1
  else
    fib (n-1) + fib (n-2)



fibPat 0 = 0
fibPat 1 = 1
fibPat n = fibPat (n-1) + fibPat (n-2)



fibGuards n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fibGuards (n-1) + fibGuards (n-2)



fibCase n =
  case n of
    0 -> 0
    1 -> 1
    n ->  fibCase (n-1) + fibCase (n-2)



safeDiv _ 0 = Nothing
safeDiv num d = Just (div num d)



takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs) =
  if p x then
    x : takeWhile p xs
  else
    []



dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p (x:xs) =
  if p x then
    dropWhile p xs
  else
    x:xs



takeWhileGuard :: (a -> Bool) -> [a] -> [a]
takeWhileGuard _ [] = []
takeWhileGuard p (x:xs)
  | p x = x : takeWhile p xs
  | otherwise = []



dropWhileGuard :: (a -> Bool) -> [a] -> [a]
dropWhileGuard _ [] = []
dropWhileGuard p (x:xs)
  | p x = dropWhile p xs
  | otherwise = x:xs



checkDiv num d =
  case safeDiv num d of
    Nothing -> "Div by 0!"
    Just res
      | res == 0 -> "Smaller"
      | otherwise -> "Equal or Greater"



cmpList [] [] = EQ
cmpList [] _ = LT
cmpList _ [] = GT
cmpList (x:xs) (y:ys)
  | x < y = LT
  | x > y = GT
  | x == y = cmpList xs ys



heron a b c = sqrt (s * (s - a) * (s - b) * (s - c)) where
  s = (a + b + c) / 2



quadruple a = q where
  d = a * a
  q = d * d




partialHead (x:_) = x

