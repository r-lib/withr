#' Execute code with a modifed search path
#'
#' This attaches a namespace to the search path, executes the code, then
#' removes the package from the search path. The package namespace is _not_
#' unloaded however.
#' @param namespace \code{[character(1)]}\cr Namespace / package name to load.
#' @template with
#' @examples
#' \dontrun{
#' with_namespace("ggplot2", {
#'   ggplot(mtcars) + geom_point(aes(wt, hp))
#' })
#' }
with_namespace <- function(namespace, code) {
  library(namespace, character.only = TRUE)
  on.exit(detach(paste0("package:", namespace), character.only = TRUE))
  force(code)
}
