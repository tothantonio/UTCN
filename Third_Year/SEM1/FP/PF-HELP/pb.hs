ito xss = i (foldr (++) [] xss) where
    i [] = []
    i (x:xs) = i [s | s <- xs, s < x] ++ (x:i [b|b <- xs, b > x])