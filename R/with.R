#' Execute code in temporarily altered environment
#'
#' All functions prefixed by `with_` work as follows. First, a particular
#' aspect of the global environment is modified (see below for a list).
#' Then, custom code (passed via the `code` argument) is executed.
#' Upon completion or error, the global environment is restored to the previous
#' state.
#'
#' @section Arguments pattern:
#' \tabular{lll}{
#'   `new` \tab `[various]` \tab Values for setting \cr
#'   `code` \tab `[any]` \tab Code to execute in the temporary environment \cr
#'   `...` \tab \tab Further arguments \cr
#' }
#' @section Usage pattern:
#' `with_...(new, code, ...)`
#' @name withr
#' @docType package
#' @section withr functions:
#' \itemize{
#' \item [with_collate()]: collation order
#' \item [with_dir()]: working directory
#' \item [with_envvar()]: environment variables
#' \item [with_libpaths()]: library paths, replacing current libpaths
#' \item [with_locale()]: any locale setting
#' \item [with_makevars()]: Makevars variables
#' \item [with_options()]: options
#' \item [with_par()]: graphics parameters
#' \item [with_path()]: `PATH` environment variable
#' \item [with_sink()]: output redirection
#' }
#' @section Creating new "with" functions:
#' All `with_` functions are created by a helper function,
#' [with_()].  This functions accepts two arguments:
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
