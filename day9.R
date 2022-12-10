moves <- read.table("day9.input.txt")


H <- T <- c(0,0)

visited <- list()

for (i in 1:nrow(moves)) {
  m <- switch(moves[i,1], U=0:1, L=-1:0, D=0:-1, R=0:1)
  n <- moves[i,2]
  
  for(j in 1:n) {
    H_update <- H + m
    
    z <- length(intersect(H_update, T))
    
    if(z == 0) {
      if (sum(abs(H_update - T)) == 3) {
        browser()
        T <- H
      }
    }
    else if (z == 1){
      if (2 %in% abs(H_update - T)) {
        T <- T + m
      }
    } else if (z == 2) {
      
    }
    
    

    H <- H_update
    visited <- append(visited, list(T))
  }
}
