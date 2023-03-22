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
# * `defer()` now calls `withr::global_defer()` and `withr::exit_frame()`
#   if needed. This moves the more complex parts of `defer()` out of
#   the standalone file.
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


# Memoise package requirement via a promise
defer <- (function(has_withr = requireNamespace("withr", quietly = TRUE),
                   has_withr_3 = has_withr && utils::packageVersion("withr") >= "2.5.0.9000") {

defer <- function(expr, envir = parent.frame(), priority = c("first", "last")) {
  if (is_top_level_global_env(envir)) {
    # Do nothing if withr is not installed, just like `on.exit()`
    # called in the global env
    if (has_withr_3) {
      withr::global_defer(expr, priority = priority)
    }
    return(invisible(NULL))
  }

  priority <- match.arg(priority, choices = c("first", "last"))
  after <- priority == "last"

  thunk <- as.call(list(function() expr))

  hook_source <- getOption("withr.hook_source")
  hook_knitr <- getOption("knitr.in.progress")
  if ((!is.null(hook_source) || !is.null(hook_knitr)) && has_withr_3) {
    envir <- withr::exit_frame(envir)
  }

  do.call(
    base::on.exit,
    list(thunk, TRUE, after),
    envir = envir
  )
}

# Inline formals
formals(defer)[["priority"]] <- eval(formals(defer)[["priority"]])

is_top_level_global_env <- function(envir, frames = sys.frames()) {
  if (!identical(envir, globalenv())) {
    return(FALSE)
  }

  # Check if another global environment is on the stack
  !any(vapply(frames, identical, NA, globalenv()))
}

})() # defer() namespace

# nocov end
