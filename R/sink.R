# sink -----------------------------------------------------------------------

#' @include wrap.R
set_sink <- wrap(
  sink,
  {
    if (is.null(file)) {
      stop("file cannot be NULL", call. = FALSE)
    }
    type <- match.arg(type)
    con <- if (type == "message" && is.character(file)) {
      file <-  file(file, "a")
    }
  },
  {
    list(n = sink.number(), type = type, con <- con)
  })

reset_sink <- function(sink_info) {
  if (!is.null(sink_info$con)) {
    close(sink_info$con)
  }

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
      warning("Sink #", sink_info$n, " already closed.", call. = FALSE)
      return()
    }
  }
}

#' Output redirection
#'
#' Temporarily divert output to a file via \code{\link{sink}}.
#'
#' @template with
#' @param new \code{[character(1)|connection]}\cr
#'   A writable \link{connection} or a character string naming the file to write
#'   to. Passing \code{NULL} will throw an error.
#' @inheritParams base::sink
#' @seealso \code{\link{sink}}
#' @export
with_sink <- with_(set_sink, reset_sink)
