# input normalized matrix from normalization and regions from read.hicup
# output extended matrix for heatmap

extending_matrix <- function(normalized, regions){

  # tests
  if(missing(normalized)) stop('missing normalized')
  if(!'normalized' %in% class(normalized)) stop('wrong class of normalized - yes we are checking it too')
  if(missing(regions)) stop('missing regions')
  if(!'hicup' %in% class(regions)) stop('wrong class of regions - yes we are checking it too')

  # extending parameters
  reg_diff <- regions[,2] - regions[,1]
  min_diff <- min(reg_diff)
  params <- round(reg_diff/min_diff, 0)

  # extending rows
  ext_row <- extending.rows(normalized, params)
  ext_col <- extending.cols(ext_row, params)

  # add class
  attr(ext_col, 'class') <- c(class(ext_col), 'extended.matrix')
  return(ext_col)
}
