#' Execute code with a modifed search path
#'
#' `with_package()` attaches a package to the search path, executes the code, then
#' removes the package from the search path. The package namespace is _not_
#' unloaded however. `with_namespace()` does the same thing, but attaches the
#' package namespace to the search path, so all objects (even unexported ones) are also
#' available on the search path.
#' @param package \code{[character(1)]}\cr package name to load.
#' @param env \code{[environment()]}\cr Environment to attach.
#' @inheritParams defer
#' @template with
#' @examples
#' \dontrun{
#' with_package("ggplot2", {
#'   ggplot(mtcars) + geom_point(aes(wt, hp))
#' })
#' }
#' @export
with_package <- function(package, code) {
  suppressPackageStartupMessages(library(package, character.only = TRUE, quietly = TRUE))
  on.exit(detach(paste0("package:", package), character.only = TRUE))
  force(code)
}

#' @rdname with_package
#' @export
local_package <- function(package, envir = parent.frame()) {
  suppressPackageStartupMessages(library(package, character.only = TRUE, quietly = TRUE))
  defer(detach(paste0("package:", package), character.only = TRUE), envir = envir)
}

#' @rdname with_package
#' @export
with_namespace <- function(package, code) {
  ns <- asNamespace(package)
  name <- format(ns)
  (get("attach"))(ns, name = name)
  on.exit(detach(name, character.only = TRUE))
  force(code)
}

#' @rdname with_package
#' @export
local_namespace <- function(package, envir = parent.frame()) {
  ns <- asNamespace(package)
  name <- format(ns)
  (get("attach"))(ns, name = name)
  defer(detach(name, character.only = TRUE), envir = envir)
}

#' @rdname with_package
#' @export
with_environment <- function(env, code) {
  name <- format(env)
  (get("attach"))(env, name = name)
  on.exit(detach(name, character.only = TRUE))
  force(code)
}

#' @rdname with_package
#' @export
local_environment <- function(env, envir = parent.frame()) {
  name <- format(env)
  (get("attach"))(env, name = name)
  defer(detach(name, character.only = TRUE), envir = envir)
}
