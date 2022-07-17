#' Debugging states which unset themselves
#'
#' Create debugging states, which are then automatically unset afterwards.
#' @template with
#'
#' @param file,.file `[named list]`\cr Files to create.
#' @param ... Additional (possibly named) arguments of files to create.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#'
#' @examples
#' with_file("file1", {
#'   writeLines("foo", "file1")
#'   readLines("file1")
#' })
#'
#' with_file(list("file1" = writeLines("foo", "file1")), {
#'   readLines("file1")
#' })
#'
#' @export
with_trace <- function(what, code,
                       tracer = NULL,
                       exit = NULL,
                       at = numeric(),
                       print = TRUE,
                       signature = NULL,
                       where = topenv(parent.frame()),
                       edit = FALSE) {
  if (!is.character(what)) what <- as.character(substitute(what))
  methods::.TraceWithMethods(what, tracer, exit, at, print, signature, where, edit)
  on.exit(untrace(what, signature, where))
  force(code)
}

#' @rdname with_trace
#' @export
local_trace <- function(what, code,
                        tracer = NULL,
                        exit = NULL,
                        at = numeric(),
                        print = TRUE,
                        signature = NULL,
                        where = topenv(.local_envir),
                        edit = FALSE,
                        .local_envir = parent.frame()) {
  defer(untrace(what, signature, where), envir = .local_envir)

  trace(what, tracer, exit, at, print, signature, where, edit)
}
