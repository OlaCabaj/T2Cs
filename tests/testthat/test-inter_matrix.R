testthat::test_that(
  "checks if inter_matrix() works as expected",
  {
    m_in <- as.data.frame(cbind(c(7, 7), c(100, 100), c(7, 7), c(100, 300), c(5, 8)))
    attr(m_in, "class") <- c('data.frame', 'homer')
    out <- T2C::inter_matrix(m_in)
    reference <- cbind(5, 8)
    colnames(reference) <- c("100", "300")
    rownames(reference) <- c("100")
    attr(reference, 'class') <- c(class(reference), 'raw.inter')
    testthat::expect_equal(out, reference)
  }
)
