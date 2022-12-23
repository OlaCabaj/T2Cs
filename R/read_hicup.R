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
