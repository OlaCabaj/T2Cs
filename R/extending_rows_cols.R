# extending rows and columns to final size
#' @export
extending_rows <- function(normalized,param){
  ext_row<-numeric()
  for(i in 1:nrow(normalized)) {
    colstemp<-numeric()
    repeat{
      colstemp<-rbind(colstemp, normalized[i,])
      if(nrow(colstemp)==param[i]) break
    }
    ext_row<-rbind(ext_row,colstemp)
  }
  return(ext_row)
}

#' @export
extending_cols <-function(ext_row,param){
  cols2a<-numeric()
  for(i in 1:length(ext_row[1,])){
    colstempa<-numeric()
    repeat{
      colstempa<-rbind(colstempa,ext_row[,i])
      if(nrow(colstempa)==param[i]) break
    }
    cols2a<-rbind(cols2a,colstempa)
  }
  return(cols2a)
}
