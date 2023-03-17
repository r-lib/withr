#' Connections which close themselves
#'
#' R file connections which are automatically closed.
#'
#' @template with
#' @param con For `with_connection()` a named list with the connection(s) to
#' create. For `local_connection()` the code to create a single connection,
#' which is then returned.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @examples
#' with_connection(list(con = file("foo", "w")), {
#'   writeLines(c("foo", "bar"), con)
#' })
#'
#' read_foo <- function() {
#'   readLines(local_connection(file("foo", "r")))
#' }
#' read_foo()
#'
#' unlink("foo")
#' @export
with_connection <- function(con, code) {

  stopifnot(all(is.named(con)))

  on.exit({
    for (connection in con) close(connection)
  })
  eval(substitute(code), envir = con, enclos = parent.frame())
}

#' @rdname with_connection
#' @export
local_connection <- function(con, .local_envir = parent.frame()) {
  defer(close(con), envir = .local_envir)
  con
}
