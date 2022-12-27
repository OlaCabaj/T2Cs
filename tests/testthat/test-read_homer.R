test_that("chromosome names have the prefix removed", {
  expect_equal(gsub("^chr","",c("chr1","chr10","chr15","mbop")),c(1,10,15,"mbop"))
})

test_that("the correct chromosome gets chosen",{
  m <- rbind(c(1,10), c(1,20), c(2,15))
  expect_equal(m[m[,1] == 1, ],rbind(c(1,10), c(1,20)))
})

test_that("tegions chosen are in correct range",{
  m <- rbind(c(1,10,10), c(1,20,20), c(1,15,18))
  mm <- m[m[,2] >= 9 & m[,2] <= 16,]
  mmm<-mm[mm[,3] >= 9 & mm[,3] <= 16,]
  expect_equal(mmm,c(1,10,10))
})

