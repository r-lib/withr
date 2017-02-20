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
#' Setting the `LC_ALL` category is currently not implemented.
#'
#' @template with
#' @param new `[named character]`\cr New locale settings
#' @inheritParams with_collate
#' @seealso [Sys.setlocale()]
#' @export
with_locale <- with_(set_locale)

#' @rdname with_locale
#' @export
local_locale <- local_(set_locale)
