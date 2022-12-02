scores <- matrix(c(
  4, 1, 7,
  8, 5, 2,
  3, 9, 6
), nrow = 3,   dimnames = list(c("A", "B", "C"), c("X", "Y", "Z")))

strat <- read.table("day2.input.txt") |> as.matrix()

scores[strat] |> sum()

strat2 <- strat
strat2[ strat[,2] == 'X' ,2] <- vapply(strat[strat[,2] == 'X',1], switch, FUN.VALUE = 'A', 'A'='C', 'B'='A', 'C'='B')# X means lose, eg same
strat2[ strat[,2] == 'Y' ,2] <- strat[strat[,2] == 'Y',1] # Y means tie, eg same
strat2[ strat[,2] == 'Z' ,2] <- vapply(strat[strat[,2] == 'Z',1], switch, FUN.VALUE = 'A', 'A'='B', 'B'='C', 'C'='A')# X means lose, eg same
table(strat2[,2])
strat2[  ,2]<- vapply(strat2[,2], switch, FUN.VALUE = 'A', 'A'='X', 'B'='Y', 'C'='Z')# Back to XYZ

scores[strat2] |> sum()
