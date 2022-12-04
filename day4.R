

elves <- read.delim(pipe("sed 's/-/,/g' day4.input.txt"), sep=',', header=FALSE)

subset(elves, (V1 <= V3 & V2 >= V4) | (V3 <= V1 & V4 >= V2)) |> nrow()

apply(elves, 1, function(x) length(intersect(x[1]:x[2], x[3]:x[4])) >= 1) |> sum()
