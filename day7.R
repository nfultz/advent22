

lines <- readLines("day7.input.txt")

lines <- grep("^[$] ls|^dir", lines, value = TRUE, invert = TRUE)

paths <- rep("/", length(lines))
size <- rep(0, length(lines))

for(i in seq_along(lines)) {
  if (lines[i] == "$ cd /") {
    path <- "/"
  } else if (lines[i] == "$ cd ..") {
    path <- sub("/[^/]*/$", "/", path)
  } else if (grepl("[$] cd", lines[i])) {
    path <- paste0(path, substr(lines[i], 6, 99), "/")
  } else {
    file <- strsplit(lines[i], split = " ")[[1]]
    size[i] <- as.numeric(file[1])
    paths[i] <- paste0(path, file[2])
  }
  
}

files <- data.frame(paths, size)
files <- files[!duplicated(files),]

files2 <- files

files3 <- list()

done <- FALSE
while(nrow(files2) > 1) {
  files2$paths <- sub("/[^/]*$", "", files2$paths)
  files2 <- aggregate(size~paths, files2, FUN=sum)
  
  files3 <- append(files3, list(files2))
}

df <- files3[[11]]
for(i in 10:1) {
  df <- rbind(df, subset(files3[[i]], !paths %in% df$paths) )
  
}





