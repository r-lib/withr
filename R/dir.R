#' @include with_something.R
NULL

# working directory ----------------------------------------------------------

#' Working directory
#'
#' Temorarily change the current working directory.
#'
#' @inheritParams withr
#' @param new \code{[character(1)]}\cr New working directory
#' @seealso \code{\link{setwd}}
#' @export
with_dir <- with_something(setwd)
