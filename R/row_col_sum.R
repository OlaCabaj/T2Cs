# Returns sums of row and column tags to construct bins of restriction fragment size
row_sum <- function(regs, bgcov){
  rows <- numeric()
  for(j in 1:nrow(regs)){
    g <- integer( ncol(bgcov) )
    nms <- rownames(bgcov)
    for(i in 1:nrow(bgcov)) {
      if(as.integer(nms[i]) >= regs[j, 1])
        if(as.integer(nms[i]) <= regs[j, 2])
          g <- g+bgcov[i, ]

    }
    rows <- rbind(rows, g)
  }
  return(rows)
}

col_sum <- function(regs, bgcov, rows){
  cols <- numeric()
  for(j in 1:nrow(regs)){
    g1 <- integer(nrow(rows))
    nms <- rownames(bgcov)
    for(i in 1:ncol(rows)) {
      if(as.integer(nms[i]) >= regs[j, 1])
        if(as.integer(nms[i]) <= regs[j, 2])
          g1 <- g1+rows[, i]
    }
    cols <- cbind(cols, g1)
  }
  return(cols)
}

