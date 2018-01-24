#' @include with_.R

# lib ------------------------------------------------------------------------

set_libpaths <- function(paths, action = "replace") {
  paths <- normalizePath(paths, mustWork = TRUE)

  old <- .libPaths()
  paths <- merge_new(old, paths, action)

  .libPaths(paths)
  invisible(old)
}

set_temp_libpath <- function(action = "prefix") {
  paths <- tempfile("temp_libpath")
  dir.create(paths)
  set_libpaths(paths, action = action)
}

#' Library paths
#'
#' Temporarily change library paths.
#'
#' @template with
#' @param new `[character]`\cr New library paths
#' @param action `[character(1)]`\cr should new values `"replace"`, `"prefix"` or
#'   `"suffix"` existing paths.
#' @inheritParams with_collate
#' @seealso [.libPaths()]
#' @family libpaths
#' @export
with_libpaths <- with_(set_libpaths, .libPaths)

#' @rdname with_libpaths
#' @export
local_libpaths <- local_(set_libpaths, .libPaths)

#' Library paths
#'
#' Temporarily prepend a new temporary directory to the library paths.
#'
#' @template with
#' @seealso [.libPaths()]
#' @inheritParams with_libpaths
#' @family libpaths
#' @export
with_temp_libpaths <- with_(set_temp_libpath, .libPaths, new = FALSE)

#' @rdname with_temp_libpaths
#' @export
local_temp_libpaths <- local_(set_temp_libpath, .libPaths, new = FALSE)
