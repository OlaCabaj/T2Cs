test_that("only zeros are chosen from data frame", {
  m <- data.frame(matrix(0, ncol = 5, nrow = 5))
  m <- cbind(m,rep(1,times=5))
    coor<-which(m==0,arr.ind=TRUE)
  expect_equal(max(coor), 5)
})

test_that("upper triangle including a diagonal is chosen",{
  mm<-matrix(1:16,ncol=4,nrow=4)
  cor<-mm[which(lower.tri(mm,diag=FALSE)==FALSE,arr.ind=TRUE)]
  expect_equal(length(cor),10)
})

