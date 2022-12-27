test_that("no duplicates can be found in coordinates", {
  m <- matrix(1:20,ncol=5,nrow = 4)
  mc <- unique(m[,2])
  expect_equal(anyDuplicated(unique(m[,2])),0)
})

test_that("values are written in correct array indices", {
  m <- data.frame(matrix(0, ncol = 5, nrow = 5))
  colnames(m) <- c("m1","m2","m3","m4","m5")
  rownames(m) <- c("m1","m2","m3","m4","m5")
  id_x<-rownames(m)=="m1"
  id_y<-colnames(m)=="m2"
  m[id_x,id_y]<-m[id_x,id_y]+as.integer(10)
  expect_equal(m[1,2],10)
})
