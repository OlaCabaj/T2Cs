testthat::test_that(
  "checks if plot_results() works as expected",
  {
    m_in <- cbind(c(1, 2, 1), c(0, 0, 1), c(1, 3, 1))
    attr(m_in, 'class') <- c(class(m_in), 'truncated_m')
    cells_n <- T2C::blackout_cells(m_in)
    out <- T2C::plot_results(m_in, black_cells = cells_n)
    colors_palette1 <- c("blue", "deepskyblue2", "green", "yellow", "orange", "red", "red3")
    rainbows <- colorRampPalette(colors_palette1)(600)
    reference <- heatmap3::heatmap3(as.matrix(m_in*(upper.tri(m_in, diag = TRUE))),
                                                Rowv = NA, Colv = NA, col = rainbows, symm = TRUE, main=c("T2C results"),
                                                colorCell = cells_n, labRow = FALSE, labCol = FALSE)
    testthat::expect_equal(out, reference)
  }
)
