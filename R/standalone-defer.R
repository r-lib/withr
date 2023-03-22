# ---
# repo: r-lib/withr
# file: standalone-defer.R
# last-updated: 2023-03-21
# license: https://unlicense.org
# ---
#
# Implementation of `withr::defer()`.
#
# ## Changelog
#
# 2023-03-22:
# * Now uses standalone format for compatibility with
#   `usethis::use_standalone()`.
# * `source()` support is disabled by default for performance.
#   Use `options(withr.hook_source = TRUE)` to enable it.
# * `defer()` is now implemented on top of `on.exit()` for performance
#   and forward compatibility.
#
# 2023-03-08:
# * Explicitly specified `choices` in `match.arg()`, for performance.
#
# 2022-03-03:
# * Support for `source()` and `knitr::knit()`
# * Handlers are now stored in environments instead of lists to avoid
#   infinite recursion issues.
# * The handler list is now soft-namespaced.
#
# nocov start


defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) { }

local({

defer <<- defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) {
  if (is_top_level_global_env(envir)) {
    # Do nothing if withr is not installed, just like `on.exit()`
    # called in the global env
    if (requireNamespace("withr", quietly = TRUE)) {
      withr::global_defer(expr, priority = priority)
    }
    return(invisible(NULL))
  }

  priority <- match.arg(priority, choices = c("first", "last"))
  after <- priority == "last"

  thunk <- as.call(list(function() expr))
  envir <- exit_frame(envir)

  do.call(
    base::on.exit,
    list(thunk, TRUE, after),
    envir = envir
  )
}

is_top_level_global_env <- function(envir, frames = sys.frames()) {
  if (!identical(envir, globalenv())) {
    return(FALSE)
  }

  # Check if another global environment is on the stack
  !any(vapply(frames, identical, NA, globalenv()))
}

exit_frame <- function(envir,
                       frames = as.list(sys.frames()),
                       calls = as.list(sys.calls())) {
  hook_source <- getOption("withr.hook_source")
  hook_knitr <- getOption("knitr.in.progress")
  if (is.null(hook_source) && is.null(hook_knitr)) {
    return(envir)
  }

  frame_loc <- frame_loc(envir, frames)
  if (!frame_loc) {
    return(envir)
  }

  if (in_knitr(envir)) {
    out <- knitr_frame(envir, frames, calls, frame_loc)
    if (!is.null(out)) {
      return(out)
    }
  }

  if (isTRUE(hook_source)) {
    out <- source_frame(envir, frames, calls, frame_loc)
    if (!is.null(out)) {
      return(out)
    }
  }

  envir
}

knitr_frame <- function(envir, frames, calls, frame_loc) {
  knitr_ns <- asNamespace("knitr")

  # This doesn't handle correctly the recursive case (knitr called
  # within a chunk). Handling this would be a little fiddly for an
  # uncommon edge case.
  for (i in seq(1, frame_loc)) {
    if (identical(topenv(frames[[i]]), knitr_ns)) {
      return(frames[[i]])
    }
  }

  NULL
}

source_frame <- function(envir, frames, calls, frame_loc) {
  i <- frame_loc

  if (i < 4) {
    return(NULL)
  }

  is_call <- function(x, fn) {
    is.call(x) && identical(x[[1]], fn)
  }
  calls <- as.list(calls)

  if (!is_call(calls[[i - 3]], quote(source))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 2]], quote(withVisible))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 1]], quote(eval))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 0]], quote(eval))) {
    return(NULL)
  }

  frames[[i - 3]]
}

frame_loc <- function(envir, frames) {
  n <- length(frames)
  if (!n) {
    return(0)
  }

  for (i in seq_along(frames)) {
    if (identical(frames[[n - i + 1]], envir)) {
      return(n - i + 1)
    }
  }

  0
}

in_knitr <- function(envir) {
  knitr_in_progress() && identical(knitr::knit_global(), envir)
}
knitr_in_progress <- function() {
  isTRUE(getOption("knitr.in.progress"))
}

}) # defer() namespace

# nocov end
