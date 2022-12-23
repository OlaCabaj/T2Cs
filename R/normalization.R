normalization <-function(bins, norm_param){
  # testing
  if(missing(bins)) stop('missing bins')
  if(!'rawbins' %in% class(bins)) stop('wrong class of bins - yes we are checking it too')
  if(missing(norm_param)) stop('missing norm_param')
  if(!'norm.param' %in% class(norm_param)) stop('wrong class of bins - yes we are checking it too')

  normalized <- bins/norm_param
  normalized[is.nan(normalized)] <- 0

  attr(normalized, 'class') <- c(class(normalized), 'normalized')
  return(normalized)
}
