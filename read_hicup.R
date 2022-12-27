#' Reads in a Hicup file cut with restriction enzyme
#'
#' @param fn path to file and filename of a reference genome cut by restriction enzyme using Hicup.
#' @param coord A vector with three elements c(chrom, start, end) like c(7, 110901160, 111101971).
#' @return A data frame of regions between cuts made by the restriction enzyme.
#' @examples
#' -
##
#' @export
# input file is reference genome cut with a chosen enzyme using Hicup
read_hicup <- function(fn, coord){
  if(missing(coord)) stop('Chromosome coordinates missing')
  if(missing(fn)) stop('Hicup filename missing')

  hicup <- read.delim(fn, header=FALSE, stringsAsFactors=FALSE)[, 1:3] # read only coordinates
  # fix chrom name
  hicup[,1] <- gsub("^chr", "", hicup[,1])

  coord <- as.integer(coord)

  # get chromosome
  hicup <- hicup[hicup[,1] == coord[1], ]
  # get forward in range
  hicup <- hicup[hicup[,2] >= coord[2] & hicup[,2] <= coord[3],]
  # get reverse in range
  hicup <- hicup[hicup[,3] >= coord[2] & hicup[,3] <= coord[3],]
  # get regions
  hicup <- hicup[,2:3]

  attr(hicup, "class") <- c('data.frame', 'hicup')
  return(hicup)
}
