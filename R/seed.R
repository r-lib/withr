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
  old_seed <- get_seed()
  if (is.null(old_seed)) {
    on.exit(if (has_seed()) rm(".Random.seed", envir = globalenv()), add = TRUE)
  } else {
    on.exit(assign(".Random.seed", old_seed, globalenv()), add = TRUE)
  }

  code
}

has_seed <- function() {
  exists(".Random.seed", globalenv(), mode = "integer", inherits = FALSE)
}

get_seed <- function() {
  if (!has_seed()) {
    return(NULL)
  }
  get(".Random.seed", globalenv(), mode = "integer", inherits = FALSE)
}
