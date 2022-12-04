lines <- readLines("day3.input.txt")

items <- strsplit(lines, '')

both <- vapply(items, \(x, m=matrix(x, ncol=2)) intersect(m[,1], m[,2]), 'A')

priority <- c(setNames(1:26, letters), setNames(27:52, LETTERS))

sum(priority[both])

three <- tapply(items, rep(1:100, each=3), \(x) Reduce(intersect, x))

sum(priority[three])
