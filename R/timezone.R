#' Time zone
#'
#' Change the time zone, and restore it afterwards.
#'
#' `with_time_zone()` runs the code with the specified time zone and
#' resets it afterwards.
#'
#' `local_time_zone()` changes the time zone for the caller
#' execution environment.
#'
#' @template with
#' @param tz `[character(1)]` a valid time zone specification, note that
#'   time zone names might be platform dependent.
#'
#' @seealso [Sys.timezone()].
#' @export
#' @examples
#' Sys.time()
#' with_timezone("Europe/Paris", print(Sys.time()))
#' with_timezone("US/Pacific", print(Sys.time()))
#'
with_timezone <- function(tz, code) {
  old <- get0(".sys.timezone", baseenv(), mode = "character",
              inherits = FALSE, ifnotfound = NA_character_)
  on.exit(assign(".sys.timezone", old, envir = baseenv()), add = TRUE)
  assign(".sys.timezone", NA, envir = baseenv())
  with_envvar(c(TZ = tz), code)
}

#' @rdname with_timezone
#' @param .local_envir The environment to apply the change to.
#' @export
#' @examples
#' fun1 <- function() {
#'   local_timezone("CET")
#'   print(Sys.time())
#' }
#'
#' fun2 <- function() {
#'   local_timezone("US/Pacific")
#'   print(Sys.time())
#' }
#' Sys.time()
#' fun1()
#' fun2()
#' Sys.time()
local_timezone <- function(tz, .local_envir = parent.frame()) {
  old <- get0(".sys.timezone", baseenv(), mode = "character",
              inherits = FALSE, ifnotfound = NA_character_)
  withr::defer(
     assign(".sys.timezone", old, envir = baseenv()),
     envir = .local_envir)
  assign(".sys.timezone", NA, envir = baseenv())
  local_envvar(c(TZ = tz), .local_envir = .local_envir)
}
