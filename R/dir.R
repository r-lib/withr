#' @include with_.R
NULL

# working directory ----------------------------------------------------------

#' Working directory
#'
#' Temporarily change the current working directory.
#'
#' @template with
#' @param new \code{[character(1)]}\cr New working directory
#' @inheritParams with_collate
#' @seealso \code{\link{setwd}}
#' @export
with_dir <- with_(setwd)

#' @rdname with_dir
#' @export
local_dir <- local_(setwd)
