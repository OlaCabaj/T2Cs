#' Get a path to example tags
#'
#' @return path to example tags file
#' @export
get_example_tags <- function() {
  system.file(package="T2C", "example_files/chr7.tags.tsv")
}

#' Get path to example Hicup file
#' 
#' @return path to example hicup file
#' @export
get_example_hicups <- function() {
  system.file(package="T2C", "example_files/Digest_musmus9_HindIII_None.txt")
}
