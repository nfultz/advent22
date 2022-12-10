

trees <- read.fwf("day8.input.txt", rep(1, 99)) |> as.matrix()

vis <- 0*trees

for(i in 1:nrow(trees)) {
  for(j in 1:ncol(trees)) {
    if(i == 1 || j == 1 || i == nrow(trees) || j == ncol(trees)){
      vis[i,j] <- TRUE
      next
    } 
    vis[i,j] <- all(trees[1:(i-1), j] < trees[i,j]) || 
                all(trees[(i+1):nrow(trees), j] < trees[i,j]) ||
                all(trees[i, 1:(j-1)] < trees[i,j]) || 
                all(trees[i,(j+1):ncol(trees)] < trees[i,j])     
  }
}

sum(vis)


score <- trees * 0

for(i in 1:nrow(trees)) {
  for(j in 1:ncol(trees)) {
    a <- b <- c <- d <- 1
    tij <- trees[i,j]
    if(i > 1 ) {
      a <- sum(trees[(i-1):1, j] == cummax(trees[(i-1):1, j]))
    } 
    if(i < nrow(trees) ) {
      b <- sum(trees[(i+1):nrow(trees), j] == cummax(trees[(i+1):nrow(trees), j]))
    } 
    if(j > 1 ) {
      c <- sum(trees[i,(j-1):1] == cummax(trees[i,(j-1):1]))
    } 
    if(j < ncol(trees) ) {
      d <- sum(trees[i,(j+1):ncol(trees)] == cummax(trees[i,(j+1):nrow(trees)]))
      #d <- trees[i,(j+1):ncol(trees)] |> cummin() |> unique() |> length()
    } 
    
    score[i,j] <- prod(a,b,c,d)
  }
}
max(score)
