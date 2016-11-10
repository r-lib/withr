#' @include with_.R

# collate --------------------------------------------------------------------

set_collate <- function(locale) set_locale(c(LC_COLLATE = locale))[[1]]

#' Collation Order
#'
#' Temporarily change collation order by changing the value of the
#' \code{LC_COLLATE} locale.
#'
#' @template with
#' @param new \code{[character(1)]}\cr New collation order
#' @param .scoped_envir \code{[environment]}\cr The environment to use for scoping.
#' @export
with_collate <- with_(set_collate)

#' @rdname with_collate
#' @export
scoped_collate <- scoped_(set_collate)
