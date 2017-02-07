#' Random seed
#'
#' `with_seed()` runs code with a specific random seed and resets it afterwards.
#'
#' @template with
#' @param seed `[integer(1)]`\cr The random seed to use to evaluate the code.
#'   Pass `NA` to use the RNG to draw the random seed, pass `NULL` to not change
#'   the random seed at all (and also to avoid resetting it).
#' @export
with_seed <- function(seed, code) {
  if (is.null(seed)) {
    code
  } else if (is.na(seed)) {
    set.seed(sample.int(2147483647L, 1L))
    with_preserve_seed(code)
  } else {
    with_preserve_seed({
      set.seed(seed)
      code
    })
  }
}

#' @rdname with_seed
#' @description
#' `with_preserve_seed()` runs code with the current random seed and resets it
#'   afterwards.
#'
#' @export
with_preserve_seed <- function(code) {
  old_seed <- get_valid_seed()
  on.exit(assign(".Random.seed", old_seed, globalenv()), add = TRUE)
  code
}

get_valid_seed <- function() {
  seed <- get_seed()
  if (is.null(seed)) {
    # Trigger initialisation of RNG
    runif(1L)
    seed <- get_seed()
  }
  seed
}

get_seed <- function() {
  get0(".Random.seed", globalenv(), mode = "integer")
}
