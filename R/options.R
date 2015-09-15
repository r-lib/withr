#' @include with_something.R

# options --------------------------------------------------------------------

set_options <- function(new_options) {
  do.call(options, as.list(new_options))
}
#' Options
#' @inheritParams withr
#' @export
with_options <- with_something(set_options)
