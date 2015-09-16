#' @include with_something.R

# collate --------------------------------------------------------------------

set_collate <- function(locale) set_locale(c(LC_COLLATE = locale))[[1]]

#' Collation Order
#'
#' Temporarily change collation order by changing the value of the
#' \code{LC_COLLATE} locale.
#'
#' @inheritParams withr
#' @export
with_collate <- with_something(set_collate)
