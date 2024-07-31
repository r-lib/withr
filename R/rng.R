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
  old <- RNGkind()
  on.exit(restore_rng_kind(old), add = TRUE)
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
  old <- RNGkind()
  defer(restore_rng_kind(old), envir = .local_envir)
  suppressWarnings(RNGversion(version))
  old
}

restore_rng_kind <- function(kind) {
  # Silence static analysis linting about `RNGkind()` signature on old
  # R versions
  RNGkind <- get("RNGkind")

  RNGkind(kind[[1]], normal.kind = kind[[2]])

  # Within a `local_rng_version("3.5.0")`, we restore to `"Rounding"`,
  # which causes a warning. See https://github.com/r-lib/withr/issues/167
  sample_kind <- kind[[3]]
  if (identical(sample_kind, "Rounding")) {
    suppressWarnings(
      RNGkind(sample.kind = sample_kind)
    )
  } else {
    RNGkind(sample.kind = sample_kind)
  }

  NULL
}
