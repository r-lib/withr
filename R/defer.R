#' Defer Evaluation of an Expression
#'
#' Similar to [on.exit()], but allows one to attach
#' an expression to be evaluated when exiting any frame currently
#' on the stack. This provides a nice mechanism for scoping side
#' effects for the duration of a function's execution.
#'
#' @param expr `[expression]`\cr An expression to be evaluated.
#' @param envir `[environment]`\cr Attach exit handlers to this environment.
#'   Typically, this should be either the current environment or
#'   a parent frame (accessed through [parent.frame()]).
#' @param priority `[character(1)]`\cr Specify whether this handler should
#' be executed `"first"` or `"last"`, relative to any other
#' registered handlers on this environment.
#'
#' @details
#'
#' `defer` works by attaching handlers to the requested environment (as an
#' attribute called `"handlers"`), and registering an exit handler that
#' executes the registered handler when the function associated with the
#' requested environment finishes execution.
#'
#' Deferred events can be set on the global environment, primarily to facilitate
#' the interactive development of code that is intended to be executed inside a
#' function or test. A message alerts the user to the fact that an explicit
#' `run_global_deferred()` is the only way to trigger these deferred events. Use
#' `clear_global_deferred()` to clear them without evaluation.
#'
#' @family local-related functions
#' @export
#' @examples
#' # define a 'local' function that creates a file, and
#' # removes it when the parent function has finished executing
#' local_file <- function(path) {
#'   file.create(path)
#'   defer_parent(unlink(path))
#' }
#'
#' # create tempfile path
#' path <- tempfile()
#'
#' # use 'local_file' in a function
#' local({
#'   local_file(path)
#'   stopifnot(file.exists(path))
#' })
#'
#' # file is deleted as we leave 'local' local
#' stopifnot(!file.exists(path))
#'
#' # investigate how 'defer' modifies the
#' # executing function's environment
#' local({
#'   local_file(path)
#'   print(attributes(environment()))
#' })
#'
#' # defer and trigger events on the global environment
#' defer(print("one"))
#' defer(print("two"))
#' run_global_deferred()
#'
#' defer(print("three"))
#' clear_global_deferred()
#' run_global_deferred()
defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) {
  priority <- match.arg(priority)
  if (identical(envir, .GlobalEnv) && is.null(get_handlers(envir))) {
    message(
      "Setting deferred event(s) on global environment.\n",
      "  * Execute (and clear) with `run_global_deferred()`.\n",
      "  * Clear (without executing) with `clear_global_deferred()`."
    )
  }
  setting_on_self <- identical(envir, parent.frame())
  invisible(
    add_handler(
      envir,
      handler = list(
        expr = substitute(expr),
        # add one level of indirection when capturing an environment in its
        # own handlers
        envir = if (setting_on_self) new.env(parent = envir) else parent.frame()
      ),
      front = priority == "first"
    )
  )
}

#' @rdname defer
#' @export
defer_parent <- function(expr, priority = c("first", "last")) {
  eval(substitute(
    defer(expr, envir, priority),
    list(expr = substitute(expr), envir = parent.frame(2), priority = priority, defer = defer)
  ), envir = parent.frame())
}

#' @rdname defer
#' @export
run_global_deferred <- function() {
  execute_handlers(.GlobalEnv)
  clear_global_deferred()
}

#' @rdname defer
#' @export
clear_global_deferred <- function() {
  attr(.GlobalEnv, "handlers") <- NULL
  invisible()
}

## Handlers used for 'defer' calls. Attached as a list of expressions for the
## 'handlers' attribute on the environment, with 'on.exit' called to ensure
## those handlers get executed on exit.

get_handlers <- function(envir) {
  attr(envir, "handlers")
}

set_handlers <- function(envir, handlers) {
  has_handlers <- "handlers" %in% names(attributes(envir))
  attr(envir, "handlers") <- handlers
  if (!has_handlers) {
    call <- make_call(execute_handlers, envir)

    # We have to use do.call here instead of eval because of the way on.exit
    # determines its evaluation context
    # (https://stat.ethz.ch/pipermail/r-devel/2013-November/067867.html)
    do.call(base::on.exit, list(substitute(call), TRUE), envir = envir)
  }
}

execute_handlers <- function(envir) {
  handlers <- get_handlers(envir)
  for (handler in handlers) {
    tryCatch(eval(handler$expr, handler$envir), error = identity)
  }
}

add_handler <- function(envir, handler, front) {
  if (front) {
    handlers <- c(list(handler), get_handlers(envir))
  } else {
    handlers <- c(get_handlers(envir), list(handler))
  }

  set_handlers(envir, handlers)
  handler
}
