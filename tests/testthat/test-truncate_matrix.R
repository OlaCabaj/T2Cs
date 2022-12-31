testthat::test_that(
  "checks if truncate_matrix() works as expected",
  {
    m_in <- matrix(seq(1, 12, 3), ncol = 2, nrow = 2)
    out <- T2C::truncate_matrix(m_in, limit = 0.25)
    reference <- matrix(c(1, 2.5, 2.5, 2.5), ncol = 2, nrow = 2)
    attr(reference, 'class') <- c(class(reference), 'truncated_m')
    testthat::expect_equal(out, reference)
  }
)
