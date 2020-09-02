#' @include with_.R
NULL

# working directory ----------------------------------------------------------

#' Working directory
#'
#' Temporarily change the current working directory.
#'
#' @template with
#' @param new `[character(1)]`\cr New working directory
#' @param clean `[logical(1)]`\cr A logical indicating if the temporary
#'   directory should be deleted after use (`TRUE`, default) or left alone (`FALSE`).
#' @inheritParams with_collate
#' @seealso [setwd()]
#' @export
#' @examples
#' getwd()
#'
#' with_dir(tempdir(), getwd())
with_dir <- with_(setwd)

#' @rdname with_dir
#' @export
local_dir <- local_(setwd)

#' @rdname with_dir
#' @export
with_tempdir <- function(code, clean = TRUE) {
  if (length(clean) > 1 || !is.logical(clean)) {
    stop("`clean` must be a single TRUE or FALSE", call. = FALSE)
  }
  tmp <- tempfile()
  dir.create(tmp)
  if (clean) {
    on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  }
  withr::with_dir(tmp, code)
}

#' @rdname with_dir
#' @inheritParams with_tempfile
#' @export
local_tempdir <- function(pattern = "file", tmpdir = tempdir(),
                          fileext = "", .local_envir = parent.frame(), clean = TRUE) {
  if (length(clean) > 1 || !is.logical(clean)) {
    stop("`clean` must be a single TRUE or FALSE", call. = FALSE)
  }

  path <- tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext)

  dir.create(path, recursive = TRUE)
  old_dir <- setwd(path)

    defer({
      if (isTRUE(clean)) {
        unlink(path, recursive = TRUE)
      }
    }, envir = .local_envir)

  path
}
