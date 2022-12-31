testthat::test_that(
  "checks if extending_matrix() works as expected",
  {
    regions_in <- cbind(c(80, 100), c(90, 102))
    m_in <- matrix(2, ncol = 2, nrow = 2)
    attr(m_in, 'class') <- c(class(m_in), 'normalized')
    attr(regions_in, 'class') <- c(class(regions_in), 'hicup')
    out <- T2C::extending_matrix(m_in, regions_in)
    reference <- matrix(2, ncol = 6, nrow = 6)
    attr(reference, 'class') <- c(class(reference), 'extended.matrix')
    
    testthat::expect_equal(out, reference)
  }
)
