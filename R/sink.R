# sink -----------------------------------------------------------------------

# FIXME: Use (a better version of) pryr:::partial2 when available
output_sink <- function(file = NULL, append = FALSE, split = FALSE) {
  sink(file = file, append = append, type = "output", split = split)
}

message_sink <- function(file = NULL, append = FALSE) {
  sink(file = file, append = append, type = "message", split = FALSE)
}

#' @include wrap.R
set_output_sink <- wrap(
  output_sink,
  if (is.null(file)) {
    stop("file cannot be NULL", call. = FALSE)
  },
  list(n = sink.number()))

set_message_sink <- wrap(
  message_sink,
  {
    if (is.null(file)) {
      stop("file cannot be NULL,", call. = FALSE)
    }
    if (sink.number(type = "message") != 2L) {
      stop("Cannot establish message sink when another sink is active.",
           call. = FALSE)
    }
    con <- if (is.character(file)) {
      file <- file(file, if (append) "a" else "w")
    }
  },
  {
    list(n = sink.number(type = "message"), con = con)
  })

reset_output_sink <- function(sink_info) {
  repeat {
    n <- sink.number()
    delta <- n - sink_info$n

    if (delta >= 0L) {
      sink()

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

reset_message_sink <- function(sink_info) {
  if (!is.null(sink_info$con)) {
    on.exit(close(sink_info$con), add = TRUE)
  }

  do_reset_message_sink(sink_info)
}

do_reset_message_sink <- function(sink_info) {
  n <- sink.number(type = "message")
  if (n == 2L) {
    warning("No message sink to remove.", call. = FALSE)
  } else if (n == sink_info$n) {
    sink(type = "message")
  } else {
    warning("Not removing a different message sink.", call. = FALSE)
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
#' @name with_sink
with_output_sink <- with_(set_output_sink, reset_output_sink)

#' @rdname with_sink
#' @export
with_message_sink <- with_(set_message_sink, reset_message_sink)
