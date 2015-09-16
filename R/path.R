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
#' @inheritParams withr
#' @param action should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing paths.
#' @family path
#' @export
with_path <- with_something(set_path, function(old) set_path(old, "replace"))
