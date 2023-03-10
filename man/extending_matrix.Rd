% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extending_matrix.R
\name{extending_matrix}
\alias{extending_matrix}
\title{Generate an extended matrix for visualization where rows and columns are extended proportionally to the shortest restriction fragment}
\usage{
extending_matrix(normalized, regions)
}
\arguments{
\item{normalized}{matrix from \code{normalization} function and
regions from \code{read.hicup} function}

\item{regions}{output of \code{read_hicup} function - object of class \code{hicup}}
}
\value{
extended matrix of class \code{extended.matrix} for heatmap
}
\description{
Generate an extended matrix for visualization where rows and columns are extended proportionally to the shortest restriction fragment
}
