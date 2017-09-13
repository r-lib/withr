#' Automatically close connections
#'
#' Connections which are automatically closed.
#'
#' @param ... One or more named parameters with the connection(s) to create and
#'   one unnamed parameter with the code to run.
#' @param con The connection to create, this is returned by
#'   `local_connection()`.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @importFrom stats setNames
#' @examples
#' with_connection(con = file("foo", "w"), {
#'   writeLines(c("foo", "bar"), con)
#' })
#'
#' read_foo <- function() {
#'   readLines(local_connection(file("foo", "r")))
#' }
#' read_foo()
#' @export
with_connection <- function(...) {
  args <- eval(substitute(alist(...)))
  named <- names(args) != ""
  stopifnot(sum(named) == 1)

  connections <- setNames(lapply(which(named), function(x) eval(call("force", as.symbol(paste0("..", x))))), names(args)[named])

  nme <- tempfile()
  (get("attach", baseenv()))(connections, name = nme, warn.conflicts = FALSE)
  on.exit({
    for (connection in connections) close(connection)
    detach(nme, character.only = TRUE)
  })
  eval(call("force", as.symbol(paste0("..", which(!named)))))
}

#' @rdname with_connection
#' @export
local_connection <- function(con, .local_envir = parent.frame()) {
  defer(close(con), envir = .local_envir)
  return(con)
}
