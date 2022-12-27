test_that("missing values are substituted by 0", {
 m <- matrix(NaN, ncol=4, nrow=4)
 m[is.nan(m)] <- 0
 expect_equal(m,matrix(0,ncol=4,nrow=4))
})
