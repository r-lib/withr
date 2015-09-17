# locale ---------------------------------------------------------------------

set_locale <- function(cats) {
  stopifnot(is.named(cats), is.character(cats))

  if ("LC_ALL" %in% names(cats)) {
    stop("Setting LC_ALL category not implemented.", call. = FALSE)
  }

  old <- vapply(names(cats), Sys.getlocale, character(1))

  mapply(Sys.setlocale, names(cats), cats)
  invisible(old)
}

#' Locale settings
#'
#' Temporarily change locale settings.
#'
#' Setting the \code{LC_ALL} category is currently not implemented.
#'
#' @template with
#' @param new \code{[named character]}\cr New locale settings
#' @seealso \code{\link{Sys.setlocale}}
#' @export
with_locale <- with_(set_locale)
