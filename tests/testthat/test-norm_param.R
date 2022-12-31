testthat::test_that(
  "checks if norm_param() works as expected",
  {
    m_in <- matrix(rep(1:3, times = 3), ncol = 3, nrow = 3)
    attr(m_in, 'class') <- c(class(m_in), 'rawbins')
    out <- T2C::norm_param(m_in)
    reference <- cbind(c(6, 9, 12), c(9, 12, 15), c(12, 15, 18))
    rownames(reference) <- c(rep("reads_sums", times = 3))
    attr(reference, 'class') <- c(class(reference), 'norm.param')
    testthat::expect_equal(out, reference)
  }
)
