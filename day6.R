

txt <- readLines("day6.input.txt")

chars <- strsplit(txt, '')[[1]]

X <- matrix(chars, nrow = length(chars)+1, ncol=4)

apply(X, 1, \(x) length(unique(x))) |> match(x=4)


X <- matrix(chars, nrow = length(chars)+1, ncol=14)
apply(X, 1, \(x) length(unique(x))) |> match(x=14) + 13
