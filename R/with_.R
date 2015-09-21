#' Create a new "with" function
#'
#' This function is a "constructor" for \code{with_...} functions.  It
#' is only needed if you want to alter some global state which is
#' not covered by the existing \code{with_...} functions, see
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
#' @examples
#' with_(setwd)
#'
#' global_stack <- list()
#' set_global_state <- function(state, msg = "Changing global state.") {
#'   global_stack <- c(list(state), global_stack)
#'   message(msg)
#'   state
#' }
#' reset_global_state <- function(state) {
#'   old_state <- global_stack[[1]]
#'   global_stack <- global_stack[-1]
#'   stopifnot(identical(state, old_state))
#' }
#' with_(set_global_state, reset_global_state)
#' @export
with_ <- function(set, reset = set, envir = parent.frame()) {

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # called pass all extra formals on
    called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

    # rename first formal to new
    called_fmls[[1]] <- as.symbol("new")

    fun_args <- c(alist(new =, code =), fmls[-1L])
  } else {
    # no formals -- only have code
    called_fmls <- NULL

    fun_args <- alist(code =)
  }

  set_call <- as.call(c(substitute(set), called_fmls))

  fun <- eval(bquote(function(args) {
    old <- .(set_call)
    on.exit(.(reset)(old))
    force(code)
  }, as.environment(list(set_call = set_call,
          reset = if (missing(reset)) substitute(set) else substitute(reset)))))

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- fun_args

  environment(fun) <- envir

  fun
}

merge_new <- function(old, new, action, merge_fun = c) {
  action <- match.arg(action, c("replace", "prefix", "suffix"))

  if (action == "suffix") {
    new <- merge_fun(old, new)
  } else if (action == "prefix") {
    new <- merge_fun(new, old)
  }
  new
}

is.named <- function(x) {
  !is.null(names(x)) && all(names(x) != "")
}
