test_that("sum() returns sums of rows", {
  m <- data.frame(matrix(1:25, ncol = 5, nrow = 5))
  sums <- numeric(nrow(m))
  for(i in 1:nrow(m))
    sums[i] <- sum(m[i,])
  expect_equal(sums,c(55,60,65,70,75))
})

test_that("extending stops after reaching a certain number of columns", {
  p = 5
    kol<-numeric()
    repeat{
      kol<-cbind(kol, c(1,1))
      if(ncol(kol)==5) break
    }
  expect_equal(ncol(kol),5)
})
