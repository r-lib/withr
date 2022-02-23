#' @include local_.R
NULL

#' Create a new "with" or "local" function
#'
#' These are constructors for `with_...` or `local_...` functions.
#' They are only needed if you want to alter some global state which is not
#' covered by the existing `with_...` functions, see \link{withr}
#' for an overview.
#'
#' The `with_...` functions reset the state immediately after the
#' `code` argument has been evaluated. The `local_...` functions
#' reset their arguments after they go out of scope, usually at the end of the
#' function body.
#'
#' @inheritParams rlang::args_dots_empty
#'
#' @param set `[function(...)]`\cr Function used to set the state.
#'   The function can have arbitrarily many arguments, they will be replicated
#'   in the formals of the returned function.
#' @param reset `[function(x)]`\cr Function used to reset the state.
#'   The first argument can be named arbitrarily, further arguments with default
#'   values, or a "dots" argument, are supported but not used: The function will
#'   be called as `reset(old)`.
#' @param get `[function(...)]`\cr Optionally, a getter function. If
#'   supplied, the `on.exit()` restoration is set up _before_ calling
#'   `set`. This is more robust in edge cases.
#'
#'   For technical reasons, this getter function must have the same
#'   interface as `set`, which means it is passed the new values as
#'   well. These can be safely ignored.
#' @param envir `[environment]`\cr Environment of the returned function.
#' @param new `[logical(1)]`\cr Replace the first argument of the `set` function
#'  by `new`? Set to `FALSE` if the `set` function only has optional arguments.
#' @return `[function(new, code, ...)]` A function with at least two arguments,
#' \itemize{
#' \item `new`: New state to use
#' \item `code`: Code to run in that state.
#' }
#' If there are more arguments to the function passed in `set` they are
#' added to the returned function.  If `set` does not have arguments,
#' or `new` is `FALSE`, the returned function does not have a `code` argument.
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
with_ <- function(set,
                  reset = set,
                  get = NULL,
                  ...,
                  envir = parent.frame(),
                  new = TRUE) {
  if (!missing(...)) {
    stop("`...` must be empty.")
  }

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # called pass all extra formals on
    called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

    if (new) {
      # rename first formal to new
      called_fmls[[1]] <- as.symbol("new")

      fun_args <- c(alist(new =, code =), fmls[-1L])
    } else {
      fun_args <- c(alist(code =), fmls)
    }
  } else {
    # no formals -- only have code
    called_fmls <- NULL

    fun_args <- alist(code =)
  }

  set_call <- as.call(c(substitute(set), called_fmls))
  reset <-  if (missing(reset)) substitute(set) else substitute(reset)

  if (is.null(get)) {
    fun <- eval(bquote(function(args) {
      old <- .(set_call)
      on.exit(.(reset)(old))
      force(code)
    }))
  } else {
    get_call <- as.call(c(substitute(get), called_fmls))
    fun <- eval(bquote(function(args) {
      old <- .(get_call)
      on.exit(.(reset)(old))
      .(set_call)
      force(code)
    }))
  }

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
