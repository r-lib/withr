#' @include with_something.R

# lib ------------------------------------------------------------------------

set_libpaths <- function(paths, action = "replace") {
  paths <- normalizePath(paths, mustWork = TRUE)

  old <- .libPaths()
  paths <- merge_new(old, paths, action)

  .libPaths(paths)
  invisible(old)
}

#' Library paths
#'
#' Temporarily change library paths.
#'
#' @inheritParams withr
#' @param new \code{[character]}\cr New library paths
#' @param action \code{[character(1)]}\cr should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing paths.
#' @seealso \code{\link{.libPaths}}
#' @export
with_libpaths <- with_something(set_libpaths, .libPaths)
