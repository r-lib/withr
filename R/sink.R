# sink -----------------------------------------------------------------------

#' @include wrap.R
set_sink <- wrap(
  sink,
  {
    if (is.null(file)) {
      stop("file cannot be NULL", call. = FALSE)
    }
    type <- match.arg(type)
    con <- if (type == "message") {
      if (sink.number(type = type) != 2L) {
        stop("Cannot establish message sink when another sink is active.")
      }
      if (is.character(file)) {
        file <- file(file, if (append) "a" else "w")
      }
    }
  },
  {
    list(n = sink.number(type = type), type = type, con = con)
  })

reset_sink <- function(sink_info) {
  if (!is.null(sink_info$con)) {
    on.exit(close(sink_info$con), add = TRUE)
  }

  do_reset_sink(sink_info)
}

do_reset_sink <- function(sink_info) {
  repeat {
    n <- sink.number(type = sink_info$type)
    if (sink_info$type == "message") {
      if (n == 2L) {
        warning("No more sinks to remove", call. = FALSE)
        return()
      }

      delta <- if (n != sink_info$n) 1L else 0L
    } else if (sink_info$type == "output") {
      delta <- n - sink_info$n
    }

    if (delta >= 0L) {
      sink(type = sink_info$type)

      if (delta > 0L) {
        warning("Removing a different sink.", call. = FALSE)
      } else {
        return()
      }
    } else {
      warning("Sink #", sink_info$n, " already removed.", call. = FALSE)
      return()
    }
  }
}

#' Output redirection
#'
#' Temporarily divert output to a file via \code{\link{sink}}.  For
#' sinks of type \code{message}, an error is raised if such a sink is already
#' active.
#'
#' @template with
#' @param new \code{[character(1)|connection]}\cr
#'   A writable \link{connection} or a character string naming the file to write
#'   to. Passing \code{NULL} will throw an error.
#' @inheritParams base::sink
#' @seealso \code{\link{sink}}
#' @export
with_sink <- with_(set_sink, reset_sink)
