#' RNG version
#'
#' Change the RNG version and restore it afterwards.
#'
#' `with_rng_version()` runs the code with the specified RNG version and
#' resets it afterwards.
#'
#' `local_rng_version()` changes the RNG version for the caller
#' execution environment.
#'
#' @template with
#' @param version `[character(1)]` an R version number, e.g.
#'   `"3.5.0"`, to switch to the RNG this version of R uses.
#'   See [RNGversion()].
#'
#' @seealso [RNGversion()], [RNGkind()], [with_seed()].
#' @export
#' @examples
#' RNGkind()
#' with_rng_version("3.0.0", RNGkind())
#' with_rng_version("1.6.0", RNGkind())
#'
#' with_rng_version("3.0.0",
#'   with_seed(42, sample(1:100, 3)))
#'
#' with_rng_version("1.6.0",
#'   with_seed(42, sample(1:100, 3)))
#'
#' RNGkind()
#'
with_rng_version <- function(version, code) {
  orig <- RNGkind()
  on.exit(do.call(RNGkind, as.list(orig)), add = TRUE)
  suppressWarnings(RNGversion(version))
  code
}

#' @rdname with_rng_version
#' @param .local_envir The environment to apply the change to.
#' @export
#' @examples
#' fun1 <- function() {
#'   local_rng_version("3.0.0")
#'   with_seed(42, sample(1:100, 3))
#' }
#'
#' fun2 <- function() {
#'   local_rng_version("1.6.0")
#'   with_seed(42, sample(1:100, 3))
#' }
#'
#' RNGkind()
#' fun1()
#' fun2()
#' RNGkind()
local_rng_version <- function(version, .local_envir = parent.frame()) {
  orig <- RNGkind()
  defer(do.call(RNGkind, as.list(orig)), envir = .local_envir)
  suppressWarnings(RNGversion(version))
  orig
}
