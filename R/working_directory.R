#' @include with_something.R

# working directory ----------------------------------------------------------

#' @title Working Directory
#' @inheritParams withr
#' @export
with_dir <- with_something(setwd)
