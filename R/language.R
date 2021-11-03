#' Langugage
#'
#' Temporarily change language used for translations.
#'
#' @param lang A BCP47 language code like "en" (English), "fr" (French),
#'   "fr_CA" (French Canadian).
#' @inheritParams with_collate
#' @export
#' @examples
#'
#' with_language("en", try(mean[[1]]))
#' with_language("fr", try(mean[[1]]))
#' with_language("es", try(mean[[1]]))
#'
with_language <- function(lang, code) {
  with_envvar(list(LANGUAGE = lang), code)
}

#' @export
#' @rdname with_language
local_language <- function(lang, .local_envir = parent.frame()) {
  local_envvar(list(LANGUAGE = lang), .local_envir = .local_envir)
}
