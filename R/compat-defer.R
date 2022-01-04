# nocov start --- compat-defer --- 2020-06-16

# This drop-in file implements withr::defer(). Please find the most
# recent version in withr's repository.


defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) { }

local({

defer <<- defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) {
  priority <- match.arg(priority)
  if (identical(envir, .GlobalEnv) && is.null(get_handlers(envir))) {
    if (interactive()) {
      message(
        "Setting deferred event(s) on global environment.\n",
        "  * Will be run automatically when session ends\n",
        "  * Execute (and clear) with `withr::deferred_run()`.\n",
        "  * Clear (without executing) with `withr::deferred_clear()`."
      )
    }
    reg.finalizer(envir, function(env) deferred_run(env), onexit = TRUE)
  }
  invisible(
    add_handler(
      envir,
      handler = list(expr = substitute(expr), envir = parent.frame()),
      front = priority == "first"
    )
  )
}

get_handlers <- function(envir) {
  attr(envir, "handlers")
}

set_handlers <- function(envir, handlers) {
  has_handlers <- "handlers" %in% names(attributes(envir))
  attr(envir, "handlers") <- handlers
  if (!has_handlers && !is_knitting()) {
    call <- make_call(execute_handlers, envir)

    # We have to use do.call here instead of eval because of the way on.exit
    # determines its evaluation context
    # (https://stat.ethz.ch/pipermail/r-devel/2013-November/067867.html)
    do.call(base::on.exit, list(call, TRUE), envir = envir)
  }
}

execute_handlers <- function(envir) {
  handlers <- get_handlers(envir)
  errors <- list()
  for (handler in handlers) {
    tryCatch(eval(handler$expr, handler$envir),
      error = function(e) {
        errors[[length(errors) + 1]] <<- e
      }
    )
  }

  for (error in errors) {
    stop(error)
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

make_call <- function(...) {
  as.call(list(...))
}

is_knitting <- function() {
  identical(getOption("knitr.in.progress"), TRUE)
}

}) # defer() namespace

# nocov end
