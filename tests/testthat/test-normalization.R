testthat::test_that(
  "checks if normalization() works as expected",
  {
    m_in <- matrix(1:3, ncol = 3, nrow = 3)
    attr(m_in, 'class') <- c(class(m_in), 'rawbins')
    out_n <- cbind(c(6, 9, 12), c(9, 12, 15), c(12, 15, 18))
    rownames(out_n) <- c(rep("reads_sums", times = 3))
    attr(out_n, 'class') <- c(class(out_n), 'norm.param')
    
    out <- T2C::normalization(m_in, out_n)
    reference <- m_in/out_n
    rownames(reference) <- c(rep("reads_sums", times = 3))
    attr(reference, 'class') <- c(class(reference), 'normalized')
    testthat::expect_equal(out, reference)
  }
)
