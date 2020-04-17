#' Temporary files
#'
#' Temporarily create a tempfile, which is automatically removed afterwards.
#' @template with
#' @param new `[character vector]`\cr Names of temporary file handles to create.
#' @param envir `[environment]`\cr Environment in which to define the temporary files.
#' @inheritParams base::tempfile
#' @examples
#' # check how big iris would be if written as csv vs RDS
#' with_tempfile("tf", {write.csv(iris, tf); file.size(tf)})
#' with_tempfile("tf", {saveRDS(iris, tf); file.size(tf)})
#' @export
with_tempfile <- function(new, code, envir = parent.frame(),
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  env <- new.env(parent = envir)
  for (f in new) {
    assign(f,
      tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext),
      envir = env)
  }
  on.exit(unlink(mget(new, envir = env), recursive = TRUE))
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
  defer(unlink(mget(new, envir = envir), recursive = TRUE), envir = envir)
}
