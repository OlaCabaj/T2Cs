#' Generating a basic interaction matrix containing raw interaction  counts in provided regions
#'
#' @param bgmodel A HOMER tags file read in by \code{read_homer} function.
#' 
#' @return A basic contact (interaction) matrix of class \code{raw.inter}.
#' 
#' @export
inter_matrix <- function(bgmodel){
  
  # tests
  if(missing(bgmodel)) stop('Where is the input ?')
  if(!'homer' %in% class(bgmodel)) stop('Homer class required - result from read.homer')

  crd_x <- sort(unique(bgmodel[, 2]))
  crd_y <- sort(unique(bgmodel[, 4]))

  tmp <- matrix(0, nrow = length(crd_x), ncol = length(crd_y))

  rownames(tmp) <- crd_x
  colnames(tmp) <- crd_y

  for(i in 1:nrow(bgmodel)) {
    y <- unlist(bgmodel[i, ])
    id_x <- rownames(tmp) == y[2]
    id_y <- colnames(tmp) == y[4]
    tmp[id_x, id_y] <- tmp[id_x, id_y] + as.integer(y[5])
  }
  
  attr(tmp, 'class') <- c(class(tmp), 'raw.inter')
  return(tmp)
}
