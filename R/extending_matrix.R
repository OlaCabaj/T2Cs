#' Generate an extended matrix for visualization where rows and columns are extended proportionally to the shortest restriction fragment
#' 
#' @param normalized matrix from \code{normalization} function and 
#' regions from \code{read.hicup} function
#' @param regions output of \code{read_hicup} function - object of class \code{hicup}
#' 
#' @return extended matrix of class \code{extended.matrix} for heatmap
#' @export
extending_matrix <- function(normalized, regions){

  # tests
  if(missing(normalized)) stop('missing normalized')
  if(!'normalized' %in% class(normalized)) stop('wrong class of normalized')
  if(missing(regions)) stop('missing regions')
  if(!'hicup' %in% class(regions)) stop('wrong class of regions')

  # extending parameters
  reg_diff <- regions[, 2] - regions[, 1]
  min_diff <- min(reg_diff)
  params <- round(reg_diff / min_diff, 0)

  # extending rows
  ext_row <- extending_rows(normalized, params)
  ext_col <- extending_cols(ext_row, params)

  # add class
  attr(ext_col, 'class') <- c(class(ext_col), 'extended.matrix')
  return(ext_col)
}
