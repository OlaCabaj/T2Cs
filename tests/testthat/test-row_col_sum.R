test_that("tags are added in correct regions", {
  m <- data.frame(matrix(1:25, ncol = 5, nrow = 5))
  rownames(m) <- c(100,200,300,400,500)
  g1 <- integer(nrow(m))
  nms <- rownames(m)
  if(as.integer(nms[1])>=50)
    if(as.integer(nms[1])<=150)
      g1<-g1+m[,1]
  expect_equal(g1,c(1,2,3,4,5))
})


