#' Language
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
  if (!has_nls()) {
    warning("Changing language has no effect when R installed without NLS")
  }

  # Note: The variable LANGUAGE is ignored if the locale is set to ‘C’.
  # In other words, you have to first enable localization, by setting LANG
  # (or LC_ALL) to a value other than ‘C’, before you can use a language
  # priority list through the LANGUAGE variable.
  # --- https://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html
  if (identical(Sys.getenv("LANG"), "C")) {
    warning("Changing language has no effect when envvar LANG='C'")
  }

  local_envvar(LANGUAGE = lang, .local_envir = .local_envir)
  if (Sys.info()[["sysname"]] != "Windows") {
    # Reset cache to avoid gettext() retrieving cached value from a previous
    # language. I think this works because Sys.setlocale() calls setlocale()
    # which https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=931456 claims
    # resets the cache. So if there's some OS/setup that this technique fails
    # on, we might try bindtextdomain() instead or as well.
    local_locale(c(LC_MESSAGES = ""), .local_envir = .local_envir)
  }
}

has_nls <- function() capabilities("NLS")[[1]]
