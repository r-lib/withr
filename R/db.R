#' DBMS Connections which disconnect themselves.
#'
#' Connections to Database Management Systems which automatically disconnect. In
#' particular connections which are created with `DBI::dbConnect()` and closed
#' with `DBI::dbDisconnect()`.
#'
#' @template with
#' @param con For `with_db_connection()` a named list with the connection(s) to
#' create. For `local_db_connection()` the code to create a single connection,
#' which is then returned.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @importFrom stats setNames
#' @examples
#' db <- tempfile()
#' with_db_connection(
#'   list(con = DBI::dbConnect(RSQLite::SQLite(), db)), {
#'     DBI::dbWriteTable(con, "mtcars", mtcars)
#' })
#'
#' head_db_table <- function(...) {
#'   con <- local_db_connection(DBI::dbConnect(RSQLite::SQLite(), db))
#'   head(DBI::dbReadTable(con, "mtcars"), ...)
#' }
#' head_db_table()
#' unlink(db)
#' @export
with_db_connection <- function(con, code) {
  requireNamespace("DBI", quietly = TRUE)

  stopifnot(all(is.named(con)))
  stopifnot(all(vlapply(con, methods::is, "DBIConnection")))

  nme <- tempfile()
  (get("attach", baseenv()))(con, name = nme, warn.conflicts = FALSE)
  on.exit({
    for (connection in con) DBI::dbDisconnect(connection)
    detach(nme, character.only = TRUE)
  })
  force(code)
}

#' @rdname with_db_connection
#' @export
local_db_connection <- function(con, .local_envir = parent.frame()) {
  requireNamespace("DBI", quietly = TRUE)
  stopifnot(methods::is(con, "DBIConnection"))

  defer(DBI::dbDisconnect(con), envir = .local_envir)
  con
}
