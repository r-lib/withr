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
  local_language(lang)
  code
}

#' @export
#' @rdname with_language
local_language <- function(lang, .local_envir = parent.frame()) {
  local_envvar(LANGUAGE = lang, .local_envir = .local_envir)
  if (Sys.info()[["sysname"]] != "Windows") {
    # Set locale to reset cache
    local_locale(c(LC_MESSAGES = ""), .local_envir = .local_envir)
  }


}
