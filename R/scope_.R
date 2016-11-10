#' Create a new "scope" function
#'
#' This function is a "constructor" for \code{scope_...} functions.  It
#' is only needed if you want to alter some global state which is
#' not covered by the existing \code{scope_...} functions, see
#' \link{withr-package} for an overview.
#'
#' @param set \code{[function(...)]}\cr Function used to set the state.
#'   The function can have arbirarily many arguments, they will be replicated
#'   in the formals of the returned function.
#' @param reset \code{[function(x)]}\cr Function used to reset the state.
#'   The first argument can be named arbitrarily, further arguments with default
#'   values, or a "dots" argument, are supported but not used: The function will
#'   be called as \code{reset(old)}.
#' @param envir \code{[environment]}\cr Environment of the returned function.
#' @return \code{[function(new, code, ...)]} A function with at least two arguments,
#' \itemize{
#' \item \code{new}: New state to use
#' \item \code{code}: Code to run in that state.
#' }
#' If there are more arguments to the function passed in \code{set} they are
#' added to the returned function.  If \code{set} does not have arguments,
#' the returned function only has a \code{code} argument.
#' @keywords internal
#' @export
scope_ <- function(set, reset = set, envir = parent.frame()) {
  fmls <- c(formals(set))

  # called pass all extra formals on
  called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))
  set_call <- as.call(c(substitute(set), called_fmls))

  fun <- eval(bquote(function(args) {
    old <- .(set_call)
    later::defer(.(reset)(old), envir = .scoped_envir)
    old
  }, as.environment(list(set_call = set_call,
                         reset = if (missing(reset)) substitute(set) else substitute(reset)))))

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- c(fmls, alist(.scoped_envir = parent.frame()))

  environment(fun) <- envir

  fun
}
