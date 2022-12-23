plot_results<-function(obcieta, title = c("T2C results"), black_cells, colors_palette = c("blue","deepskyblue2","green","yellow","orange","red","red3")){
  if(missing(obcieta)) stop('missing obcieta')
  if(!'obcieta' %in% class(obcieta)) stop('wrong class of obcieta')
  if(missing(black_cells)) stop('black_cells')

  rainbows<-colorRampPalette(colors_palette)(600)

  heatmap_t2c <- heatmap3::heatmap3(as.matrix(obcieta*(upper.tri(obcieta,diag=T))),
                                    Rowv=NA, Colv=NA, col=rainbows, symm=T, main=title,
                                    colorCell=black_cells, labRow = FALSE, labCol = FALSE)
  return(heatmap_t2c)
}
