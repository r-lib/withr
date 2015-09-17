# path -----------------------------------------------------------------------

get_path <- function() {
  strsplit(Sys.getenv("PATH"), .Platform$path.sep)[[1]]
}

set_path <- function(path, action = "prefix") {
  path <- normalizePath(path, mustWork = FALSE)

  old <- get_path()
  path <- merge_new(old, path, action)

  path <- paste(path, collapse = .Platform$path.sep)
  Sys.setenv(PATH = path)
  invisible(old)
}

#' PATH environment variable
#'
#' Temporarily change the system search path.
#'
#' @template with
#' @param new \code{[character]}\cr New \code{PATH} entries
#' @param action \code{[character(1)]}\cr Should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing paths
#' @seealso \code{\link{Sys.setenv}}
#' @export
with_path <- with_(set_path, function(old) set_path(old, "replace"))
