testthat::test_that(
  "checks if blackout_cells() works as expected",
  {
    m_in <- cbind(c(1, 2), c(0, 0))
    attr(m_in, 'class') <- c(class(m_in), 'truncated_m')
    out <- T2C::blackout_cells(m_in)
    reference <- out
    reference[, 1] <- c(1, 2, 1, 1, 2)
    reference[, 2] <- c(2, 2, 1, 2, 2)
    reference[, 3] <- as.factor(c(rep("black", times = 2), rep("white", times = 3)))

    testthat::expect_equal(out, reference)
  }
)

