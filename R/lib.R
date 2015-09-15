#' @include with_something.R

# lib ------------------------------------------------------------------------

set_libpaths <- function(paths, action = "replace") {
  paths <- normalizePath(paths, mustWork = TRUE)

  old <- .libPaths()
  paths <- merge_new(old, paths, action)

  .libPaths(paths)
  invisible(old)
}

#' library paths, replacing current libpaths
#' @inheritParams withr
#' @param action should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing paths.
#' @export
with_libpaths <- with_something(set_libpaths, .libPaths)
