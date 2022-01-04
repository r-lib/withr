#' Temporary files
#'
#' Temporarily create a tempfile, which is automatically removed afterwards.
#' @template with
#' @param new `[character vector]`\cr (Deprecated for `local_tempfile()`) Names of temporary file handles to create.
#' @param envir `[environment]`\cr Deprecated in favor of `.local_envir`.
#' @param clean `[logical(1)]`\cr A logical indicating if the temporary
#'   directory should be deleted after use (`TRUE`, default) or left alone (`FALSE`).
#' @inheritParams with_collate
#' @inheritParams base::tempfile
#' @examples
#' # check how big iris would be if written as csv vs RDS
#' tf <- with_tempfile("tf", {write.csv(iris, tf); file.size(tf)})
#' tf <- with_tempfile("tf", {saveRDS(iris, tf); file.size(tf)})
#' @export
with_tempfile <- function(new, code, envir = parent.frame(), .local_envir = parent.frame(),
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  if (!missing(envir)) {
    .Deprecated(msg = "`envir` argument of with_tempfile() is deprecated.\n  Use `with_tempfile(.local_envir=)` instead.")
    .local_envir <- envir
  }
  env <- new.env(parent = .local_envir)
  for (f in new) {
    assign(f,
      tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext),
      envir = env)
  }
  on.exit(unlink(mget(new, envir = env), recursive = TRUE))
  eval(substitute(code), envir = env)
}

#' @rdname with_tempfile
#' @param lines Optionally, supply lines to be fed into
#' @export
local_tempfile <- function(new = NULL, lines = NULL, envir = parent.frame(), .local_envir = parent.frame(),
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  if (!missing(envir)) {
    .Deprecated(msg = "`envir` argument of local_tempfile() is deprecated.\n  Use `local_tempfile(.local_envir=)` instead.")
    .local_envir <- envir
  }
  if (is.null(new)) {
    path <- tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext)
    if (!is.null(lines)) {
      writeLines(lines, path)
    }

    defer(unlink(path, recursive = TRUE), envir = .local_envir)
    return(path)
  }

  .Deprecated(msg = "`new` argument of local_tempfile() is deprecated.\n  Use `path <- local_tempfile()` instead.")

  for (f in new) {
    assign(f,
      tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext),
      envir = .local_envir)
  }
  defer(unlink(mget(new, envir = .local_envir), recursive = TRUE), envir = .local_envir)
}


#' @rdname with_tempfile
#' @export
with_tempdir <- function(code, clean = TRUE,
  pattern = "file", tmpdir = tempdir(), fileext = "") {
  if (length(clean) > 1 || !is.logical(clean)) {
    stop("`clean` must be a single TRUE or FALSE", call. = FALSE)
  }

  tmp <- tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext)

  dir.create(tmp)
  if (clean) {
    on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  }
  withr::with_dir(tmp, code)
}

#' @rdname with_tempfile
#' @export
local_tempdir <- function(pattern = "file", tmpdir = tempdir(),
                          fileext = "", .local_envir = parent.frame(), clean = TRUE) {
  if (length(clean) > 1 || !is.logical(clean)) {
    stop("`clean` must be a single TRUE or FALSE", call. = FALSE)
  }

  path <- tempfile(pattern = pattern, tmpdir = tmpdir, fileext = fileext)

  dir.create(path, recursive = TRUE)

  if (isTRUE(clean)) {
    defer(unlink(path, recursive = TRUE), envir = .local_envir)
  }

  path
}
