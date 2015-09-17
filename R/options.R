#' @include with_.R

# options --------------------------------------------------------------------

set_options <- function(new_options) {
  do.call(options, as.list(new_options))
}

#' Options
#'
#' Temporarily change global options.
#'
#' @template with
#' @param new \code{[named list]}\cr New options and their values
#' @seealso \code{\link{options}}
#' @export
with_options <- with_(set_options)
