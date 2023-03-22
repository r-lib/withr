#' @include standalone-defer.R
NULL

defer_ns <- environment(defer)

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
#' @section Running handlers within `source()`:
#' `r lifecycle::badge("experimental")` Set `options(withr.hook_source
#' = TRUE)` to enable top-level usage of withr tools in scripts
#' sourced with `base::source()`. The cleanup expressions are run when
#' `source()` exits (either normally or early due to an error).
#'
#' @details
#' `defer()` works by attaching handlers to the requested environment (as an
#' attribute called `"handlers"`), and registering an exit handler that
#' executes the registered handler when the function associated with the
#' requested environment finishes execution.
#'
#' Deferred events can be set on the global environment, primarily to facilitate
#' the interactive development of code that is intended to be executed inside a
#' function or test. A message alerts the user to the fact that an explicit
#' `deferred_run()` is the only way to trigger these deferred events. Use
#' `deferred_clear()` to clear them without evaluation. The global environment
#' scenario is the main motivation for these functions.
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
#' deferred_run()
#'
#' defer(print("three"))
#' deferred_clear()
#' deferred_run()
defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) NULL

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
deferred_run <- function(envir = parent.frame()) {
  if (is_top_level_global_env(envir)) {
    handlers <- the$global_exits
    the$global_exits <- list()

    for (expr in handlers) {
      eval(expr, envir)
    }
  } else {
    execute_handlers(envir)
    deferred_clear(envir)
  }
}

#' @rdname defer
#' @export
deferred_clear <- function(envir = parent.frame()) {
  if (is_top_level_global_env(envir)) {
    the$global_exits <- list()
  } else {
    attr(envir, "withr_handlers") <- NULL
  }
  invisible()
}

#' Defer expression globally
#'
#' This function is mostly internal. It is exported to be called in
#' standalone `defer()` implementations to defer expressions from the
#' global environment.
#'
#' @inheritParams defer
#' @keywords internal
#' @export
global_defer <- function(expr, priority = c("first", "last")) {
  priority <- match.arg(priority, choices = c("first", "last"))

  env <- globalenv()
  handlers <- the$global_exits

  if (!length(handlers)) {
    # For session scopes we use reg.finalizer()
    if (is_interactive()) {
      message(
        sprintf("Setting global deferred event(s).\n"),
        "i These will be run:\n",
        "  * Automatically, when the R session ends.\n",
        "  * On demand, if you call `withr::deferred_run()`.\n",
        "i Use `withr::deferred_clear()` to clear them without executing."
      )
    }
    reg.finalizer(env, function(env) deferred_run(env), onexit = TRUE)
  }

  handler <- as.call(list(function() expr))

  if (priority == "first") {
    the$global_exits <- c(list(handler), handlers)
  } else {
    the$global_exits <- c(handlers, list(handler))
  }

  invisible(NULL)
}

the$global_exits <- list()


# Splice `compat-defer.R` into the namespace
for (name in names(defer_ns)) {
  assign(name, defer_ns[[name]])
}
