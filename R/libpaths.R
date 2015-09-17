#' @include with_.R

# lib ------------------------------------------------------------------------

set_libpaths <- function(paths, action = "replace") {
  paths <- normalizePath(paths, mustWork = TRUE)

  old <- .libPaths()
  paths <- merge_new(old, paths, action)

  .libPaths(paths)
  invisible(old)
}

set_temp_libpath <- function() {
  paths <- tempfile("temp_libpath")
  dir.create(paths)
  set_libpaths(paths, action = "prefix")
}

#' Library paths
#'
#' Temporarily change library paths.
#'
#' @template with
#' @param new \code{[character]}\cr New library paths
#' @param action \code{[character(1)]}\cr should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing paths.
#' @seealso \code{\link{.libPaths}}
#' @family libpaths
#' @export
with_libpaths <- with_(set_libpaths, .libPaths)

#' Library paths
#'
#' Temporarily prepend a new temporary directory to the library paths.
#'
#' @template with
#' @seealso \code{\link{.libPaths}}
#' @family libpaths
#' @export
with_temp_libpaths <- with_(set_temp_libpath, .libPaths)
