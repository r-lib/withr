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
with_locale <- function(new, code) {
  local_locale(new)
  code
}

#' @rdname with_locale
#' @export
local_locale <- function(.new = list(),
                         ...,
                         .local_envir = parent.frame()) {
  new <- list_combine(as.list(.new), list(...))
  cats <- as_locale_cats(new)

  old <- get_locale(cats)
  defer(set_locale(old), envir = .local_envir)
  set_locale(cats)

  # <https://github.com/r-lib/withr/issues/179>
  # R supports setting LC_COLLATE to C via envvar. When that is the
  # case, it takes precedence over the currently set locale. We need
  # to set both the envvar and the locale for collate to fully take
  # effect.
  if ("LC_COLLATE" %in% names(cats)) {
    collate <- cats["LC_COLLATE"]
    local_envvar(collate, .local_envir = .local_envir)
  }

  invisible(old)
}

set_locale <- function(cats) {
  mapply(Sys.setlocale, names(cats), cats)
}
get_locale <- function(cats) {
  vapply(names(cats), Sys.getlocale, character(1))
}

as_locale_cats <- function(cats) {
  cats <- as_character(cats)
  stopifnot(is.named(cats))

  if ("LC_ALL" %in% names(cats)) {
    stop("Setting LC_ALL category not implemented.", call. = FALSE)
  }

  cats
}
