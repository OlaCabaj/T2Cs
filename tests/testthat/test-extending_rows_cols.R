test_that("extending stops after reaching a certain length", {
  p = 5
  for(i in 1:10) {
    colstemp<-numeric()
    repeat{
      colstemp<-rbind(colstemp, i)
      if(nrow(colstemp)==5) break
    }}
    expect_equal(nrow(colstemp),5)
})
