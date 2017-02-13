#' Random seed
#'
#' `with_seed()` runs code with a specific random seed and resets it afterwards.
#'
#' @template with
#' @param seed `[integer(1)]`\cr The random seed to use to evaluate the code.
#' @examples
#' # Same random values:
#' with_preserve_seed(runif(5))
#' with_preserve_seed(runif(5))
#'
#' # Use a pseudorandom value as seed to advance the RNG and pick a different
#' # value for the next call:
#' with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#' with_seed(seed, runif(5))
#' with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#' @export
with_seed <- function(seed, code) {
  force(seed)
  with_preserve_seed({
    set.seed(seed)
    code
  })
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
