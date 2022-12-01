

df <- read.table("day1.input.txt", blank.lines.skip = FALSE)
df$elf <- cumsum(is.na(df$V1))
tapply(df$V1, df$elf, sum, na.rm=TRUE) |> max()
tapply(df$V1, df$elf, sum, na.rm=TRUE) |> sort() |> tail(3) |> sum()
