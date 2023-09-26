#' Time zone
#'
#' Change the time zone, and restore it afterwards.
#'
#' `with_timezone()` runs the code with the specified time zone and
#' resets it afterwards.
#'
#' `local_timezone()` changes the time zone for the caller
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
#' with_timezone("America/Los_Angeles", print(Sys.time()))
#'
with_timezone <- function(tz, code) {
  reset_timezone()
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
#'   local_timezone("America/Los_Angeles")
#'   print(Sys.time())
#' }
#' Sys.time()
#' fun1()
#' fun2()
#' Sys.time()
local_timezone <- function(tz, .local_envir = parent.frame()) {
  reset_timezone(envir = .local_envir)
  local_envvar(c(TZ = tz), .local_envir = .local_envir)
}

reset_timezone <- function(envir = parent.frame()) {
  base_env <- baseenv()
  old <- get0(".sys.timezone", base_env, mode = "character",
              inherits = FALSE, ifnotfound = NA_character_)
  is_locked <- bindingIsLocked(".sys.timezone", env = base_env)
  if (is_locked) {
    base_env$unlockBinding(".sys.timezone", env = base_env)
  }
  defer({
    assign(".sys.timezone", old, envir = base_env)
    if (is_locked) {
      lockBinding(".sys.timezone", env = base_env)
    }
  }, envir = envir)
  assign(".sys.timezone", NA_character_, envir = base_env)
}
