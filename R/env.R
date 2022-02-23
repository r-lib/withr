# env ------------------------------------------------------------------------

get_envvar <- function(envs, action = "replace") {
  envs <- as_envvars(envs)
  Sys.getenv(names(envs), names = TRUE, unset = NA)
}

set_envvar <- function(envs, action = "replace") {
  envs <- as_envvars(envs)

  stopifnot(is.character(action), length(action) == 1)
  action <- match.arg(action, c("replace", "prefix", "suffix"))

  if (length(envs) == 0) {
    return()
  }

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

as_envvars <- function(envs) {
  if (length(envs) == 0) {
    return(envs)
  }

  stopifnot(is.named(envs))

  # if any envs are null make them NA instead
  envs[vlapply(envs, is.null)] <- NA

  # if there are duplicated entries keep only the last one
  envs <- envs[!duplicated(names(envs), fromLast = TRUE)]

  envs
}

#' Environment variables
#'
#' Temporarily change system environment variables.
#'
#' @template with
#' @param new,.new `[named character]`\cr New environment variables
#' @param ... Named arguments with new environment variables.
#' @param action should new values `"replace"`, `"prefix"` or
#'   `"suffix"` existing variables with the same name.
#' @inheritParams with_collate
#' @details if `NA` is used those environment variables will be unset.
#' If there are any duplicated variable names only the last one is used.
#' @seealso [Sys.setenv()]
#' @examples
#' with_envvar(new = c("GITHUB_PAT" = "abcdef"), Sys.getenv("GITHUB_PAT"))
#'
#' # with_envvar unsets variables after usage
#' Sys.getenv("TEMP_SECRET")
#' with_envvar(new = c("TEMP_SECRET" = "secret"), Sys.getenv("TEMP_SECRET"))
#' Sys.getenv("TEMP_SECRET")
#' @export
with_envvar <- with_(set_envvar, get = get_envvar)

#' @rdname with_envvar
#' @export
local_envvar <- local_(set_envvar, get = get_envvar, dots = TRUE)
