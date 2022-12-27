# T2Cs

## Example of a pipeline
### \# reading hicup file
#### file<-c("PATH/TO/FILE.txt")
#### coord<-c(7,110901160,111101971) #- vector with three elements c(chrom, start, end) // c(7, 110901160, 111101971)

### \# input file is a reference genome cut with a chosen enzyme using Hicup
#### regions.m<-read.hicup(file,coord)

### \# reading homer file with tags
#### fn<-("PATH/TO/FILE/tags.tsv")
#### \# coord - vector with three elements c(chrom, start, end) // c(7, 110901160, 111101971)
##### \# output :
##### \# chr7 3188777 chr7  17687771   40
##### \# chr7 3238844 chr7  27313134   62
##### \# chr7 3238846 chr7  27313134   25

### \# reading HOMER tags
#### bgmodel.m<-read.homer(fn,coord)

#### \# creating a basin interaction matrix
#### basic.interaction.matrix.m<-inter.matrix(bgmodel.m)

#### \# summing rows and columns
#### rows.m<-row.sum(regions.m,basic.interaction.matrix.m)
#### cols.m<-col.sum(regions.m,basic.interaction.matrix.m,rows.m)

#### \# creating bins
#### matrix_raw_m<-make.bins(regions.m,basic.interaction.matrix.m)

#### \# preparing the matrix for normalization
#### matrix_to_normalize<-norm.param(matrix_raw_m)

#### \# value normalization
#### normalized_m<-normalization(matrix_raw_m,matrix_to_normalize)

#### \# extending the matrix to full resolution
#### extended_m<-extending.matrix(normalized_m,regions.m)

#### \# truncate matrix to the highest value of 0.25
#### truncated_m<-truncate.matrix(extended_m,limit=0.25)

#### \# prepare dataframe of zeros to cover background in heatmap3
#### black_cells<-blackout_cells(truncated_m)

#### \# plots a heatmap of the contact matrix
#### plot_results(truncated_m,title=c("T2C brain"),black_cells)
