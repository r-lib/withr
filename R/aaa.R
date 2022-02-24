# From https://github.com/r-lib/rlang/blob/main/R/aaa.R

on_load <- function(expr, env = parent.frame(), ns = topenv(env)) {
  expr <- substitute(expr)
  force(env)

  callback <- function() {
    # Evaluate with promise semantics rather than `base::eval()`
    do <- NULL
    do.call(delayedAssign, list("do", expr, env))
    do
  }
  ns$.__rlang_hook__. <- c(ns$.__rlang_hook__., list(callback))
}

run_on_load <- function(ns = topenv(parent.frame())) {
  hook <- ns$.__rlang_hook__.
  rm(envir = ns, list = ".__rlang_hook__.")

  # FIXME: Transform to `while` loop to allow hooking into on-load
  # from an on-load hook?
  for (callback in hook) {
    callback()
  }
}

.onLoad <- function(...) {
  run_on_load()
}
