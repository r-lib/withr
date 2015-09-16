#' Execute code in temporarily altered environment
#'
#' All functions prefixed by \code{with_} work as follows. First, a particular
#' aspect of the global environment is modified (see below for a list).
#' Then, custom code (passed via the \code{code} argument) is executed.
#' Upon completion or error, the global environment is restored to the previous
#' state.
#'
#' @usage with_...(new, code, ...)
#' @param new \code{[various]}\cr Values for setting
#' @param code \code{[any]}\cr Code to execute in that environment
#' @name withr
#' @docType package
#' @section withr functions:
#' \itemize{
#' \item \code{\link{with_collate}}: collation order
#' \item \code{\link{with_dir}}: working directory
#' \item \code{\link{with_envvar}}: environment variables
#' \item \code{\link{with_libpaths}}: library paths, replacing current libpaths
#' \item \code{\link{with_locale}}: any locale setting
#' \item \code{\link{with_makevars}}: Makevars variables
#' \item \code{\link{with_options}}: options
#' \item \code{\link{with_par}}: graphics parameters
#' \item \code{\link{with_path}}: PATH environment variable
#' }
#' @section Creating new "with" functions:
#' All \code{with_} functions are created by a helper function,
#' \code{\link{with_}}.  This functions accepts two arguments:
#' a setter function and an optional resetter function.  The setter function is
#' expected to change the global state and return an "undo instruction".
#' This undo instruction is then passed to the resetter function, which changes
#' back the global state. In many cases, the setter function can be used
#' naturally as resetter.
#' @examples
#' getwd()
#' with_dir(tempdir(), getwd())
#' getwd()
#'
#' Sys.getenv("HADLEY")
#' with_envvar(c("HADLEY" = 2), Sys.getenv("HADLEY"))
#' Sys.getenv("HADLEY")
#'
#' with_envvar(c("A" = 1),
#'   with_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
#' )
NULL
