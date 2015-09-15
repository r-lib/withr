#' Get/set the PATH variable.
#'
#' @param path character vector of paths
#' @return \code{set_path} invisibly returns the old path.
#' @name path
#' @family path
#' @seealso \code{\link{with_path}} to temporarily set the path for a block
#'   of code
NULL

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
