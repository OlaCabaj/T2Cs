testthat::test_that(
  "checks if read_hicup() works as expected",
  {
    get_example_hicups <- function() {
      system.file(package="T2C", "example_files/Digest_musmus9_HindIII_None.txt")
    }
    path <- get_example_hicups()
    coordinates <- c(7, 110901160, 110902860)
    out <- T2C::read_hicup(path,coordinates)
    reference <- as.data.frame(rbind(c(110901160, 110902364), c(110902365, 110902858)))
    rownames(reference) <- c(as.integer(345525), as.integer(345526))
    colnames(reference) <- c("V2", "V3")
    attr(reference, "class") <- c('data.frame', 'hicup')
    testthat::expect_equal(out, reference)
  }
)
