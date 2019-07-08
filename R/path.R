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
#' @param new `[character]`\cr New `PATH` entries
#' @param action `[character(1)]`\cr Should new values `"replace"`, `"prefix"` or
#'   `"suffix"` existing paths
#' @inheritParams with_collate
#' @seealso [Sys.setenv()]
#' @examples
#' # modify temporarily the system environmnet PATH, adding your current directory
#' with_path(getwd(), Sys.getenv("PATH"))
#' # adding your current directory to the end of system environmnet PATH
#' with_path(getwd(), Sys.getenv("PATH"), "suffix")
#' @export
with_path <- with_(set_path, function(old) set_path(old, "replace"))

#' @rdname with_path
#' @export
local_path <- local_(set_path, function(old) set_path(old, "replace"))
