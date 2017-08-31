#' Temporary files
#'
#' Temporarily create a tempfile, which is automatically removed afterwards.
#' @template with
#' @param new `[character vector]`\cr Names of temporay file handles to create.
#' @param envir `[environment]`\cr Environment in which to define the temporary files.
#' @inheritParams base::tempfile
#' @export
with_tempfile <- function(new, code, envir = parent.frame(),
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  env <- new.env(parent = envir)
  for (f in new) {
    assign(f,
      tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext),
      envir = env)
  }
  on.exit(unlink(mget(new, envir = env)))
  eval(substitute(code), envir = env)
}

#' @rdname with_tempfile
#' @export
local_tempfile <- function(new, envir = parent.frame(),
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  for (f in new) {
    assign(f,
      tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext),
      envir = envir)
  }
  defer(unlink(mget(new, envir = envir)), envir = envir)
}
