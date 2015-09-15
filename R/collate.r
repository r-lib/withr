#' @include with_something.R

# collate --------------------------------------------------------------------

set_collate <- function(locale) set_locale(c(LC_COLLATE = locale))[[1]]

#' @title Collation Order
#' @inheritParams withr
#' @export
with_collate <- with_something(set_collate)
