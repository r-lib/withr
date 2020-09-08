# locale ---------------------------------------------------------------------

set_locale <- function(cats) {
  cats <- as_character(cats)
  stopifnot(is.named(cats))

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
#' @param new,.new `[named character]`\cr New locale settings
#' @param ... Additional arguments with locale settings.
#' @inheritParams with_collate
#' @seealso [Sys.setlocale()]
#' @examples
#'
#' ## Change locale for time:
#' df <- data.frame(
#'   stringsAsFactors = FALSE,
#'   date = as.Date(c("2019-01-01", "2019-02-01")),
#'   value = c(1, 2)
#' )
#' with_locale(new = c("LC_TIME" = "es_ES"), code = plot(df$date, df$value))
#' ## Compare with:
#' #  plot(df$date, df$value)
#'
#' ## Month names:
#' with_locale(new = c("LC_TIME" = "en_GB"), format(ISOdate(2000, 1:12, 1), "%B"))
#' with_locale(new = c("LC_TIME" = "es_ES"), format(ISOdate(2000, 1:12, 1), "%B"))
#'
#' ## Change locale for currencies:
#' with_locale(new = c("LC_MONETARY" = "it_IT"), Sys.localeconv())
#' with_locale(new = c("LC_MONETARY" = "en_US"), Sys.localeconv())
#'
#' ## Ordering:
#' x <- c("bernard", "bérénice", "béatrice", "boris")
#' with_locale(c(LC_COLLATE = "fr_FR"), sort(x))
#' with_locale(c(LC_COLLATE = "C"), sort(x))
#'
#' @export
with_locale <- with_(set_locale)

#' @rdname with_locale
#' @export
local_locale <- local_(set_locale, dots = TRUE)
