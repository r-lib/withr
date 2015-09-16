#' @include with_something.R
NULL

# par ------------------------------------------------------------------------

#' Graphics parameters
#'
#' Temporarily change graphics parameters.
#'
#' @inheritParams withr
#' @param new \code{[named list]}\cr New graphics parameters and their values
#' @param no.readonly \code{[logical(1)]}\cr see \code{\link{par}} documentation.
#' @seealso \code{\link{par}}
#' @export
with_par <- with_something(par)
