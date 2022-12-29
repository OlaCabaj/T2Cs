# T2Cs

## Example of a pipeline

- Load T2C package

```
library(T2C)
```

- Define coordinates to plot on heatmap - vector of three elements `c(<chromosome>, <start>, <end>)`

```
coord <- c(7, 110901160, 111101971)
```

- Define files names

```
# hicup file
hicup_filename <- get_example_hicups()

# homer file with tags
homer_tags_filename <- get_example_tags()
```

- Read HOMER tags

```
bgmodel_m <- read_homer(homer_tags_filename, coord)
```

Example:
```
head(bgmodel_m)
```
```
     V2        V3 V7        V8 tags[, 5]
6922  7 110902701  7 110912432         7
6923  7 110902701  7 110936417         1
6924  7 110902701  7 110937111       116
6925  7 110902701  7 111016576         1
6926  7 110902701  7 111085594        25
6927  7 110902701  7 111092199        18
```

- Read Hicup file with a reference genome cut with a chosen enzyme using Hicup

```
regions_m <- read_hicup(hicup_filename, coord)
```

Example:
```
head(regions_m)
```
```
              V2        V3
345525 110901160 110902364
345526 110902365 110902858
345527 110902859 110908549
345528 110908550 110911903
345529 110911904 110912563
345530 110912564 110914555
```

- Creating a basic interaction matrix

```
basic_interaction_matrix_m <- inter_matrix(bgmodel_m)
```

- Creating bins

```
raw_matrix_with_bins <- make_bins(regions_m, basic_interaction_matrix_m)
```

- Preparing the matrix for normalization

```
matrix_to_normalize <- norm_param(raw_matrix_with_bins)
```

- Matrix normalization

```
normalized_m <- normalization(raw_matrix_with_bins, matrix_to_normalize)
```

- Extending the matrix to the full resolution

```
extended_m <- extending_matrix(normalized_m, regions_m)
```

- Truncate matrix to the highest value of the limit (deafult `0.25`)

```
truncated_m <- truncate_matrix(extended_m, limit = 0.25)
```

- Prepare a `data.frame` of zeros to cover background in `heatmap3` function

```
black_cells <- blackout_cells(truncated_m)
```

Example:
```
str(black_cells)
```
```
'data.frame':	7422798 obs. of  3 variables:
 $ row    : int  1 2 3 4 5 6 7 8 9 10 ...
 $ col    : int  1 1 1 1 1 1 1 1 1 1 ...
 $ colordf: chr  "black" "black" "black" "black" ...
```

- Plots a heatmap of the contact matrix
```
plot_results(truncated_m, title = "T2C brain", black_cells)
```


## Raw data reference:

Kolovos, P., van de Werken, H.J., Kepper, N. et al. Targeted Chromatin Capture (T2C): a novel high resolution high throughput method to detect genomic interactions and regulatory elements. Epigenetics & Chromatin 7, 10 (2014). https://doi.org/10.1186/1756-8935-7-10
