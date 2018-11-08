#' Summary on data frame columns.
#'
#' This function allows to do summary on
#' all the numeric columns in a data frame.
#'
#' The function asks the user to pick one data frame,
#' and the summary type he or she is interested in.
#' Then the user can applies a summary function to
#' every numeric column in a selected data frame and
#' get the analysis results quickly.
#'
#' @param x The datasets the user is interested in.
#' @param f The summary function the user is interested in.
#'
#' @examples
#' col_sum(iris, median)
#' @export
col_sum <- function(x = mpg, f = mean) {
  library(purrr)
  library(maps)
  x <- keep(x, is.numeric)
  map_dbl(x, f)
}

