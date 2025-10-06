# Elm - Common patterns and package management

## Pipelines: the |> and <| operators

Elm repl:

```Elm
import Lists as L
> [1, 2, 3] |> L.take 1
[1] : List number
> [1, 2, 3] |> L.drop 1 |> L.take 1
[2] : List number
> List.drop 1 <| List.take 1 [1, 2, 3]
[2] : List number
> 1 |> (\x -> x + 1)
2 : number
```

Elm repl:

```Elm
List.take 2 <| List.drop 2 [1, 2, 3, 4]
[3,4] : List number
```

## Function composition: the >> and << operators

Elm repl:

```Elm
> inc = \x -> x + 1
<function> : number -> number
> triple = \x -> x * 3
<function> : number -> number
> (inc >> triple) 1
6 : number
> (inc << triple) 1
4 : number
> (inc >> inc >> triple) 1
9 : number
```

Elm repl:

```Elm
> applyTwice f x = (f >> f) x
<function> : (a -> b) -> a -> b
> applyTwice (\x -> x + 1) 1
3 : number
```

Elm repl:

```Elm
> applyTwice (inc >> inc) 1
5 : number
> applyTwice (inc >> triple) 1
21 : number
```

## Debugging with Debug.log and Debug.toString

Elm repl:

```Elm
> import Debugging exposing (..)
> sumOfOddLastDigitsPipe [21, 2, 13, 4, 25, 6]
Original list: : [21,2,13,4,25,6]
Odd elements: : [21,13,25]
Last digits: : [1,3,5]
Final sum: : 9
9 : Int
```

## Advanced records

### Accessors and structural typing

Elm repl:

```Elm
> .name
<function> : { b | name : a } -> a
> .name { name = "John" }
"John" : String
> { name = "John" }.name
"John" : String
```

Elm repl:

```Elm
> type PetType = Cat | Dog
> type alias Pet = { name: String, petType: PetType }
> type alias User = { name: String, emailAddress: String}
> let fluffy = { name = "Fluffy", petType = Cat } in .name fluffy
"Fluffy" : String
> let john = { name = "John", emailAddress = "john@email.com" } in .name john
"John" : String
```

Elm repl:

```Elm
> List.map .x [{x=1, y=2}, {x=3,y=3}, {x=4, y=2}, {x=0, y=2}]
[1,3,4,0] : List number
> List.map .name [{name="John", age=32}, {name="Alice", age=23}, {name="Bob", age=35}]
["John","Alice","Bob"] : List String
> List.filter (.center >> .x >> (\x -> x > 0)) [{center={x=1, y=2}}, {center={x=-3, y=4}}]
[{center={x=1, y=2}}] : List {center: {x: number, y: number1}}
```

### Record updates

## Elegant error handling with Maybe and Result

### Transforming success values: the map function

Elm repl:

```Elm
> Just 3 |> Maybe.map (\x -> x + 1)
Just 4 : Maybe number
> Nothing |> Maybe.map (\x -> x + 1)
Nothing : Maybe number
> Ok 2 |> Result.map (\x -> x + 1)
Ok 3 : Result error number
> Err "Invalid number" |> Result.map (\x -> x + 1)
Err ("Invalid number") : Result String number
```

Elm repl:

```Elm
> type alias User = {name: String, age: Int}
> Maybe.map2 User (Just "John") (Just 30)
Just { age = 30, name = "John" }: Maybe User
> Maybe.map2 User Nothing (Just 30)
Nothing : Maybe User
> Result.map2 User (Ok "John") (Ok 30)
Ok { age = 30, name = "John" } : Result x User
> Result.map2 User (Err "No name") (Ok 30)
Err ("No name") : Result String User
```

### Extracting values without pattern matching: the withDefault function

Elm repl:

```Elm
> greet name = "Hello, " ++ name
<function> : String -> String
> Nothing |> Maybe.withDefault "stranger" |> greet
"Hello, stranger" : String
> type NameError = NoNameProvided | NameTooShort
> Err NoNameProvided |> Result.withDefault "stranger" |> greet
"Hello, stranger" : String
```

### Chaining functions that can fail: the andThen function

Elm repl:

```Elm
> List.tail [1, 2, 3]
Just [2,3] : Maybe (List number)
> List.tail [1, 2, 3] |> Maybe.andThen List.tail
Just [3] : Maybe (List number)
> List.tail [1, 2, 3] |> Maybe.andThen List.tail |> Maybe.andThen List.head
Just 3 : Maybe number
> List.tail [1] |> Maybe.andThen List.tail |> Maybe.andThen List.head
Nothing : Maybe number
> List.tail [1, 2] |> Maybe.andThen List.tail |> Maybe.andThen List.head
Nothing : Maybe number
```

### Transforming errors: the mapError function

### Error handling patterns

#### Applying a series of transformations to a result and supplying a default value at the end

Elm repl:

```Elm
> import Theme exposing (..)
> pageBackground "dark"
Black : Color
> pageBackground ""
White : Color
> pageBackground "green"
White : Color
```

## Package management: Using libraries from the elm package repository

## Testing with elm-test

### Setting up elm-test

### The anatomy of a test

### Organizing tests

### Choosing which tests to run

## Practice problems

Elm repl:

```Elm
> chunks 2 [1, 2, 3, 4, 5, 6]
[[1, 2], [3, 4], [5, 6]] : List (List number)
> chunks 3 [1, 2, 3, 4]
[[1, 2, 3], [4]]: List (List number)
```

Elm repl:

```Elm
> splitLast [1, 2, 3]
Just ([1, 2], 3) : Maybe (List number, number)
> splitLast [1]
Just ([], 1) : Maybe (List number, number)
> splitLast []
Nothing : Maybe (List number, number)
```

