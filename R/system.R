#' Run a system command and check if it succeeds.
#'
#' This function automatically quotes both the command and each
#' argument so they are properly protected from shell expansion.
#' @param cmd the command to run.
#' @param args a vector of command arguments.
#' @param env a named character vector of environment variables.  Will be quoted
#' @param quiet if \code{FALSE}, the command to be run will be echoed.
#' @param ... additional arguments passed to \code{\link[base]{system2}}
#' @return \code{TRUE} if the command succeeds, an error will be thrown if the
#' command fails.
#' @export
system_check <- function(cmd, args = character(), env = character(),
                         quiet = FALSE, ...) {
  full <- paste(c(shQuote(cmd), lapply(args, shQuote)), collapse = " ")

  if (!quiet) {
    message(wrap_command(full), "\n")
  }

  result <- suppressWarnings(with_envvar(env,
    system(full, intern = quiet, ignore.stderr = quiet, ...)
    ))

  if (quiet) {
    status <- attr(result, "status") %||% 0
  } else {
    status <- result
  }

  if (!identical(as.character(status), "0")) {
    stop("Command ", sQuote(full), " failed (", status, ")", call. = FALSE)
  }

  invisible(TRUE)
}

wrap_command <- function(x) {
  lines <- strwrap(x, getOption("width") - 2, exdent = 2)
  continue <- c(rep(" \\", length(lines) - 1), "")
  paste(lines, continue, collapse = "\n")
}
