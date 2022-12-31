testthat::test_that(
  "checks if row_sum() works as expected",
  {
    regions_in <- matrix(1:4, ncol = 2, nrow = 2)
    m_in <- matrix(1:4, ncol = 2, nrow = 2)
    colnames(m_in) <- c(0, 4)
    rownames(m_in) <- c(0, 4)
    out <- T2C::row_sum(regions_in, m_in)
    reference <- matrix(c(0, 2, 0, 4), ncol = 2, nrow = 2)
    colnames(reference) <- c(0, 4)
    rownames(reference) <- c("g", "g")
    
    testthat::expect_equal(out, reference)
  }
)

testthat::test_that(
  "checks if col_sum() works as expected",
  {
    regions_in <- matrix(1:4, ncol = 2, nrow = 2)
    m_in <- matrix(1:4, ncol = 2, nrow = 2)
    colnames(m_in) <- c(0, 4)
    rownames(m_in) <- c(0, 4)
    rows_n <- matrix(c(0, 2, 0, 4), ncol=2, nrow=2)
    colnames(rows_n) <- c(0, 4)
    rownames(rows_n) <- c("g", "g")
    out <- T2C::col_sum(regions_in, m_in, rows_n)
    reference <- matrix(c(0, 0, 0, 4), ncol=2, nrow=2)
    colnames(reference) <- c("g1", "g1")
    rownames(reference) <- c("g", "g")
    
    testthat::expect_equal(out, reference)
  }
)
