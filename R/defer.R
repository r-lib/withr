# Include standalone defer to overwrite it:
#' @include standalone-defer.R
NULL

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
#' # note that examples lack function scoping so deferred calls will
#' # will be executed immediately
#' defer(print("one"))
#' defer(print("two"))
defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) {
  if (is_top_level_global_env(envir)) {
    global_defer(expr, priority = priority)
    return(invisible(NULL))
  }

  priority <- match.arg(priority, choices = c("first", "last"))
  after <- priority == "last"

  thunk <- as.call(list(function() expr))

  # Don't handle `source()` and `knit()` specially by default
  # to avoid a performance hit
  hook_source <- getOption("withr.hook_source")
  hook_knitr <- getOption("knitr.in.progress")
  if (!is.null(hook_source) || !is.null(hook_knitr)) {
    envir <- exit_frame(envir)
  }

  do.call(
    base::on.exit,
    list(thunk, TRUE, after),
    envir = envir
  )
}

# Inline formals for performance
formals(defer)[["priority"]] <- eval(formals(defer)[["priority"]])


#' @rdname defer
#' @export
defer_parent <- function(expr, priority = c("first", "last")) {
  defer(expr, parent.frame(2), priority = priority)
}

#' @rdname defer
#' @export
deferred_run <- function(envir = parent.frame()) {
  if (knitr_in_progress()) {
    stop("Can't run `deferred_run()` in a knitted document")
  }
  if (is_top_level_global_env(envir)) {
    handlers <- the$global_exits
  } else {
    handlers <- frame_exits(envir)
  }
  deferred_clear(envir)

  n <- length(handlers)
  i <- 0L

  if (!n) {
    message("No deferred expressions to run")
    return(invisible(NULL))
  }

  defer(message(
    sprintf("Ran %s/%s deferred expressions", i, n)
  ))

  for (expr in handlers) {
    eval(expr, envir)
    i <- i + 1L
  }
}

frame_exits <- function(frame = parent.frame()) {
  exits <- do.call(sys.on.exit, list(), envir = frame)

  # The exit expressions are stored in a single object that is
  # evaluated on exit. This can be NULL, an expression, or multiple
  # expressions wrapped in {. We convert this data structure to a list
  # of expressions.
  if (is.null(exits)) {
    list()
  } else if (identical(exits[[1]], quote(`{`))) {
    as.list(exits[-1])
  } else {
    list(exits)
  }
}
frame_clear_exits <- function(frame = parent.frame()) {
  do.call(on.exit, list(), envir = frame)
}

#' @rdname defer
#' @export
deferred_clear <- function(envir = parent.frame()) {
  if (is_top_level_global_env(envir)) {
    the$global_exits <- list()
  } else {
    frame_clear_exits(envir)
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

# Evaluate `frames` lazily to avoid expensive `sys.frames()`
# call for the default case of a local environment
is_top_level_global_env <- function(envir, frames = sys.frames()) {
  if (!identical(envir, globalenv())) {
    return(FALSE)
  }

  # Check if another global environment is on the stack
  !any(vapply(frames, identical, NA, globalenv()))
}


# Augment rlang with withr features such as knitr support
on_load({
  on_package_load("rlang", local({
    if (is.null(getOption("withr:::inject_defer_override"))) {
      ns <- asNamespace("rlang")

      do.call("unlockBinding", list("defer", ns))
      defer(lockBinding("defer", ns))

      ns$defer <- defer
    }
  }))
})
