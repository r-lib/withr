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

the <- new.env()

on_package_load <- function(pkg, expr, env = parent.frame()) {
  expr <- substitute(expr)
  force(env)

  run <- function(...) {
    # Evaluate with promise semantics rather than `base::eval()`
    do <- NULL
    do.call(delayedAssign, list("do", expr, env))
    do
  }

  # Always register hook in case package is later unloaded & reloaded
  setHook(packageEvent(pkg, "onLoad"), run)

  # For compatibility with R < 4.0 where base isn't locked
  is_sealed <- function(pkg) {
    identical(pkg, "base") || environmentIsLocked(asNamespace(pkg))
  }

  # Run right away if package is already loaded but only if its
  # namespace is locked. The registering package might be a dependency
  # of `package`. In that case, `package` might not be fully populated
  # yet (#1225).
  if (isNamespaceLoaded(pkg) && is_sealed(pkg)) {
    run()
  }
}
