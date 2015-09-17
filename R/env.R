# env ------------------------------------------------------------------------

set_envvar <- function(envs, action = "replace") {
  if (length(envs) == 0) return()

  stopifnot(is.named(envs))
  stopifnot(is.character(action), length(action) == 1)
  action <- match.arg(action, c("replace", "prefix", "suffix"))

  # if there are duplicated entries keep only the last one
  envs <- envs[!duplicated(names(envs), fromLast = TRUE)]

  old <- Sys.getenv(names(envs), names = TRUE, unset = NA)
  set <- !is.na(envs)

  both_set <- set & !is.na(old)
  if (any(both_set)) {
    if (action == "prefix") {
      envs[both_set] <- paste(envs[both_set], old[both_set])
    } else if (action == "suffix") {
      envs[both_set] <- paste(old[both_set], envs[both_set])
    }
  }

  if (any(set))  do.call("Sys.setenv", as.list(envs[set]))
  if (any(!set)) Sys.unsetenv(names(envs)[!set])

  invisible(old)
}

#' Environment variables
#'
#' Temporarily change system environment variables.
#'
#' @template with
#' @param new \code{[named character]}\cr New environment variables
#' @param action should new values \code{"replace"}, \code{"prefix"} or
#'   \code{"suffix"} existing variables with the same name.
#' @details if \code{NA} is used those environment variables will be unset.
#' If there are any duplicated variable names only the last one is used.
#' @seealso \code{\link{Sys.setenv}}
#' @export
with_envvar <- with_(set_envvar)
