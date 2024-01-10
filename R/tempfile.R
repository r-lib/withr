#' Temporary files and directories
#'
#' Temporarily create a file or directory, which will automatically deleted
#' once you're finished with it.
#'
#' @template with
#' @param new `[character vector]`\cr (Deprecated for `local_tempfile()`) Names of temporary file handles to create.
#' @param envir `[environment]`\cr Deprecated in favor of `.local_envir`.
#' @param clean `[logical(1)]`\cr A logical indicating if the temporary
#'   directory should be deleted after use (`TRUE`, default) or left alone (`FALSE`).
#' @inheritParams with_collate
#' @inheritParams base::tempfile
#' @examples
#' # local_tempfile() is the easiest to use because it returns a path
#' local({
#'   path1 <<- local_tempfile(lines = c("x,y", "1,2"))
#'   readLines(path1)
#' })
#' # the file is deleted automatically
#' file.exists(path1)
#'
#' # with_tempfile() is a bit trickier; the first argument gives the name
#' # of a variable that will contain the path:
#' with_tempfile("path2", {
#'   print(path2)
#'   write.csv(iris, path2)
#'   file.size(path2)
#' })
#'
#' # Note that this variable is only available in the scope of with_tempfile
#' try(path2)
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
#' @param lines Optionally, supply a character vector of lines to be written to
#'   `path`. This is useful if you want to seed the file with some default
#'   content.
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
      con <- file(path, open = "wb", encoding = "native.enc")
      defer(close(con))

      writeLines(enc2utf8(lines), con, useBytes = TRUE)
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
