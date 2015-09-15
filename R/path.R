#' @include with_something.R

#' @title Get/set the PATH variable.
#' @param path character vector of paths
#' @return \code{set_path} invisibly returns the old path.
#' @name path
#' @family path
#' @seealso \code{\link{with_path}} to temporarily set the path for a block
#'   of code
NULL

# path -----------------------------------------------------------------------

# @rdname path
get_path <- function() {
  strsplit(Sys.getenv("PATH"), .Platform$path.sep)[[1]]
}

#' @export
#' @param action One of \code{"prefix"} (default), \code{"suffix"} or \code{"replace"},
#'   determines if the existing paths should be prepended, appended, or replaced by the
#'   existing paths.
#' @rdname path
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
