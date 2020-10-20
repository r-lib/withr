#' Random seed
#'
#' `with_seed()` runs code with a specific random seed and resets it afterwards.
#'
#' @template with
#' @param seed `[integer(1)]`\cr The random seed to use to evaluate the code.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
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
#' @export
local_seed <- function(seed, .local_envir = parent.frame()) {
  old_seed <- get_seed()
  set.seed(seed)

  defer({
    if (is.null(old_seed)) {
      on.exit(rm_seed(), add = TRUE)
    } else {
      on.exit(set_seed(old_seed), add = TRUE)
    }
  }, envir = .local_envir)

  invisible(seed)
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
    on.exit(rm_seed(), add = TRUE)
  } else {
    on.exit(set_seed(old_seed), add = TRUE)
  }

  code
}

#' @rdname with_seed
#' @export
local_preserve_seed <- function(.local_envir = parent.frame()) {
  old_seed <- get_seed()

  defer({
    if (is.null(old_seed)) {
      on.exit(rm_seed(), add = TRUE)
    } else {
      on.exit(set_seed(old_seed), add = TRUE)
    }
  }, envir = .local_envir)

  invisible(old_seed)
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

set_seed <- function(seed) {
  assign(".Random.seed", seed, globalenv())
}

rm_seed <- function() {
  if (!has_seed()) {
    return(NULL)
  }
  rm(".Random.seed", envir = globalenv())
}
