#' Files which delete themselves
#'
#' Create files, which are then automatically removed afterwards.
#' @template with
#' @param file,.file `[named list]`\cr Files to create.
#' @param ... Additional (possibly named) arguments of files to create.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @examples
#' with_file("file1", {
#'   writeLines("foo", "file1")
#'   readLines("file1")
#' })
#'
#' with_file(list("file1" = writeLines("foo", "file1")), {
#'   readLines("file1")
#' })
#' @export
with_file <- function(file, code) {

  file_nms <- names2(file)
  unnamed <- file_nms == ""
  file_nms[unnamed] <- as.character(file[unnamed])
  on.exit(unlink(file_nms, recursive = TRUE))
  eval.parent(code)

  invisible(file)
}

#' @rdname with_file
#' @export
local_file <- function(.file, ..., .local_envir = parent.frame()) {
  .file <- utils::modifyList(as.list(.file), list(...))
  .file <- as_character(.file)

  file_nms <- names2(.file)
  unnamed <- file_nms == ""
  file_nms[unnamed] <- as.character(.file[unnamed])
  defer(unlink(file_nms, recursive = TRUE), envir = .local_envir)

  invisible(.file)
}
