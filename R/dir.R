#' @include with_.R
NULL

# working directory ----------------------------------------------------------

#' Working directory
#'
#' Temorarily change the current working directory.
#'
#' @template with
#' @param new \code{[character(1)]}\cr New working directory
#' @seealso \code{\link{setwd}}
#' @export
with_dir <- with_(setwd)
