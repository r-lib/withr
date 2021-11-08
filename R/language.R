#' Language
#'
#' Temporarily change the language used for translations.
#'
#' @param lang A BCP47 language code like "en" (English), "fr" (French),
#'   "fr_CA" (French Canadian). Formally, this is a lower case two letter
#'   [ISO 639 country code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes),
#'   optionally followed by "_" or "-" and an upper case two letter
#'   [ISO 3166 region code](https://en.wikipedia.org/wiki/ISO_3166-2).
#' @inheritParams with_collate
#' @export
#' @examples
#' with_language("en", try(mean[[1]]))
#' with_language("fr", try(mean[[1]]))
#' with_language("es", try(mean[[1]]))
with_language <- function(lang, code) {
  local_language(lang)
  code
}

#' @export
#' @rdname with_language
local_language <- function(lang, .local_envir = parent.frame()) {
  if (!is.character(lang) || length(lang) != 1) {
    stop("`lang` must be a string")
  }
  # https://stackoverflow.com/questions/6152321
  lang <- gsub("-", "_", lang, fixed = TRUE)

  if (!has_nls()) {
    warning("Changing language has no effect when R installed without NLS")
  }

  # > Note: The variable LANGUAGE is ignored if the locale is set to ‘C’.
  # > In other words, you have to first enable localization, by setting LANG
  # > (or LC_ALL) to a value other than ‘C’, before you can use a language
  # > priority list through the LANGUAGE variable.
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
