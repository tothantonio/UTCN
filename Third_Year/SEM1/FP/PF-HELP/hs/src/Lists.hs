module Lists where


filterComp p l = [x | x <- l, p x]



mapComp f l = [f x | x <- l]



cartesianComp lx ly = [(x, y) | x <- lx, y <- ly]

