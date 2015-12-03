# sink -----------------------------------------------------------------------

#' @include wrap.R
set_sink <- wrap(sink,
                 if (is.null(file)) stop("file cannot be NULL", call. = FALSE),
                 list(n = sink.number(type = type), type = type))

reset_sink <- function(sink_info) {
  n <- sink.number(type = sink_info$type)
  delta <- n - sink_info$n

  if (delta >= 0L) {
    if (delta > 0L) {
      warning("Closing ", delta, " sinks.", call. = FALSE)
    }
    for (i in seq_len(delta + 1L)) {
      sink(file = NULL, type = sink_info$type)
    }
  } else if (delta < 0L) {
    warning("Sink #", sink_info$n, " already closed.", call. = FALSE)
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
