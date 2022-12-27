test_that("matrix gets limited to a fraction of the maximum value of input matrix ", {
  limit=0.5
  m<-cbind(c(1:10),c(10:1),c(1:10))
  
  limit <- limit * max(m)
  m[m >= limit] <- limit
  expect_equal(max(m),5)
})
