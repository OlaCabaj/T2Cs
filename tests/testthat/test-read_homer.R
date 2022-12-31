testthat::test_that(
  "checks if read_homer() works as expected",
  {
    get_example_tags <- function() {
      system.file(package="T2C", "example_files/chr7.tags.tsv")
    }
    path <- get_example_tags()
    coordinates <- c(7, 110902983, 110912860)
    out <- T2C::read_homer(path, coordinates)
    reference <- as.data.frame(rbind(c(7, 110902984, 7, 110912432, 18),c(7, 110912432, 7, 110902984, 18)))
    rownames(reference) <- c(as.integer(6974), as.integer(7024))
    colnames(reference) <- c("V2", "V3", "V7", "V8", "tags[, 5]")
    reference[, 1] <- as.character(reference[, 1])
    reference[, 3] <- as.character(reference[, 3])
    attr(reference, "class") <- c('data.frame', 'homer')
    testthat::expect_equal(out, reference)
  }
)
