# sink -----------------------------------------------------------------------

#' Output redirection
#'
#' Temporarily divert output to a file via \code{\link{sink}}.
#'
#' @template with
#' @param new \code{[character(1)|connection]}\cr
#'   A writable \link{connection} or a character string naming the file to write
#'   to, or \code{NULL} to stop sink-ing.
#' @inheritParams base::sink
#' @seealso \code{\link{sink}}
#' @export
with_sink <- with_(sink, function(old) sink())
