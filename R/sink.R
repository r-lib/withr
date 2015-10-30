# sink -----------------------------------------------------------------------

#' Output redirection
#'
#' Temporarily divert output to a file via \code{\link{sink}}.
#'
#' @template with
#' @inheritParams base::sink
#' @seealso \code{\link{sink}}
#' @export
with_sink <- with_(sink, function(old) sink())
