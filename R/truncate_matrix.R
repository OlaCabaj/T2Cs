## truncate matrix to the highest value of 0.25
truncate_matrix <- function(ext_matrix, limit=0.25){
  limit <- limit * max(ext_matrix)
  ext_matrix[ext_matrix >= limit] <- limit

  # add class
  attr(ext_matrix, 'class') <- c(class(ext_matrix), 'obcieta')
  return(ext_matrix)
}
