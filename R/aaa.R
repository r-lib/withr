the <- new.env()


# From https://github.com/r-lib/rlang/blob/main/R/aaa.R

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
