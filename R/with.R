#' Execute code in temporarily altered environment.
#'
#' @param new Values for setting
#' @param code Code to execute in that environment
#' @name withr
#' @docType package
#' @section withr functions:
#' \itemize{
#' \item \code{with_collate}: collation order
#' \item \code{with_dir}: working directory
#' \item \code{with_envvar}: environment variables
#' \item \code{with_libpaths}: library paths, replacing current libpaths
#' \item \code{with_locale}: any locale setting
#' \item \code{with_makevars}: Makevars variables
#' \item \code{with_options}: options
#' \item \code{with_par}: graphics parameters
#' \item \code{with_path}: PATH environment variable
#' \item \code{with_something}: Execute code in temporarily altered environment
#' }
#' @examples
#' getwd()
#' in_dir(tempdir(), getwd())
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
