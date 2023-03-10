#' Generating a matrix of the sum of the reads in bins (mapping to both fragments involved in the interaction) for normalization
#'
#' @param bins a matrix of restriction fragment sized bins generated by \code{make_bins} function.
#' @return A matrix of the sum of the reads for normalization of class \code{norm.param}.
#'
#' @export
norm_param <-function(bins){
  
  # tests
  if(missing(bins)) stop('missing bins')
  if(!'rawbins' %in% class(bins)) stop('wrong class of bins')
  
  reads_sums <- numeric(nrow(bins))
  for(i in 1:nrow(bins)) {
    reads_sums[i] <- sum(bins[i, ])
  }
  collength <- ncol(bins)
  rowlength <- nrow(bins)
  
  kol <- numeric()
  kol <- cbind(reads_sums, reads_sums)
  repeat{
    kol <- cbind(kol, reads_sums)
    if (ncol(kol) == collength) break
  }
  
  row <- numeric()
  row <- rbind(reads_sums, reads_sums)
  repeat{
    row <- rbind(row, reads_sums)
    if (nrow(row) == rowlength) break
  }

  norm <- row + kol
  attr(norm, 'class') <- c(class(norm), 'norm.param')
  return(norm)
}
