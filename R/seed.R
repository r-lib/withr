#' Random seed
#'
#' `with_seed()` runs code with a specific random seed and resets it afterwards.
#'
#' @template with
#' @param seed `[integer(1)]`\cr The random seed to use to evaluate the code.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @param .rng_kind `[character(1)]`\cr Kind of (uniform) RNG to use.
#' @param .rng_normal_kind `[character(1)]`\cr Kind of normal RNG to use.
#' @param .rng_sample_kind `[character(1)]`\cr Kind of RNG to use for sampling.
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
with_seed <- function(seed, code, .rng_kind = "default", .rng_normal_kind = "default", .rng_sample_kind = "default") {
  force(seed)
  force(.rng_kind)
  force(.rng_normal_kind)
  force(.rng_sample_kind)
  with_preserve_seed({
    set_seed(list(seed = seed, rng_kind = c(.rng_kind, .rng_normal_kind, .rng_sample_kind)))
    code
  })
}

#' @rdname with_seed
#' @export
local_seed <- function(seed, .local_envir = parent.frame(), .rng_kind = "default", .rng_normal_kind = "default",
                       .rng_sample_kind = "default") {
  old_seed <- get_seed()
  set_seed(list(seed = seed, rng_kind = c(.rng_kind, .rng_normal_kind, .rng_sample_kind)))

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
  list(
    random_seed = get(".Random.seed", globalenv(), mode = "integer", inherits = FALSE),
    rng_kind = RNGkind()
  )
}

set_seed <- function(seed) {
  # Ensure RNGkind() and Normal RNG state is properly reset (cf. #162)
  if (getRversion() < "3.6") {
    seed$rng_kind <- seed$rng_kind[1L:2L]
  }
  if (is.null(seed$seed)) {
    do.call(RNGkind, args = as.list(seed$rng_kind))
    assign(".Random.seed", seed$random_seed, globalenv())
  } else {
    do.call(RNGkind, args = as.list(seed$rng_kind))
    set.seed(seed$seed)
  }
}

rm_seed <- function() {
  if (!has_seed()) {
    return(NULL)
  }
  set.seed(seed = NULL) # also reset Normal RNG state (cf. #162)
  rm(".Random.seed", envir = globalenv())
}
