

stacks <- read.fwf("day5.input.txt", widths = c(-1, rep(4,9)), n=8, header = FALSE) |>
  lapply(substr, 1, 1) |>
  lapply(trimws) |>
  lapply(Filter, f=nchar)


cmds <- read.table("day5.input.txt", header=FALSE, skip = 10, sep=' ')
cmds <- data.frame(n=cmds$V2, from=cmds$V4, to=cmds$V6)


for(i in seq_along(cmds$n)) {
  
  n <- cmds$n[i]
  to <- cmds$to[i]
  from <- cmds$from[i]
  
  for(j in seq(n)) {
    stacks[[to]] <- c(stacks[[from]][1], stacks[[to]])
    stacks[[from]] <- stacks[[from]][-1]
  }
}

vapply(stacks, `[[`, "", 1) |> paste(collapse="")


# Part 2

stacks <- read.fwf("day5.input.txt", widths = c(-1, rep(4,9)), n=8, header = FALSE) |>
  lapply(substr, 1, 1) |>
  lapply(trimws) |>
  lapply(Filter, f=nchar)

for(i in seq_along(cmds$n)) {
  
  n <- cmds$n[i]
  to <- cmds$to[i]
  from <- cmds$from[i]
  stacks[[to]] <- c(stacks[[from]][1:n], stacks[[to]])
  stacks[[from]] <- stacks[[from]][-(1:n)]
}

vapply(stacks, `[[`, "", 1) |> paste(collapse="")

