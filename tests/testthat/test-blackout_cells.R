test_that("class of first two columns is integer", {
  is.true(class(cells[,c(1,2)]),"integer")
})
