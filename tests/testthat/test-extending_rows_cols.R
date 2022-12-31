testthat::test_that(
  "checks if extending_rows() works as expected",
  {
    regions_in <- c(1, 2)
    m_in <- matrix(2, ncol = 2, nrow = 2)
    out <- T2C::extending_rows(m_in, regions_in)
    reference <- matrix(2, ncol = 2, nrow = 3)
    
    testthat::expect_equal(out, reference)
  }
)

testthat::test_that(
  "checks if extending_cols() works as expected",
  {
    regions_in <- c(1 ,2)
    m_in <- matrix(2, ncol = 2, nrow = 3)
    out <- T2C::extending_cols(m_in, regions_in)
    reference <- matrix(2, ncol = 3, nrow = 3)
    
    testthat::expect_equal(out, reference)
  }
)
