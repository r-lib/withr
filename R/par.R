#' @include with_.R
NULL

# par ------------------------------------------------------------------------

get_par <- function(...) {
  new <- auto_splice(list(...))
  out <- do.call(graphics::par, c(as.list(names(new)), list(no.readonly=TRUE)))

  # `par()` doesn't wrap in a list if input is length 1
  if (length(new) == 1) {
    out <- list(out)
    names(out) <- names(new)
  }

  out
}

# `get_par()` must have exactly the same signature as `par()` to be
# compatible with `with_()` and `local_()`
formals(get_par) <- formals(graphics::par)

#' Graphics parameters
#'
#' Temporarily change graphics parameters.
#'
#' @template with
#' @param new,.new `[named list]`\cr New graphics parameters and their values
#' @param no.readonly `[logical(1)]`\cr see [par()] documentation.
#' @param ... Additional graphics parameters and their values.
#' @inheritParams with_collate
#' @seealso [par()]
#' @export
#' @examples
#' old <- par("col" = "black")
#'
#' # This will be in red
#' with_par(list(col = "red", pch = 19),
#'   plot(mtcars$hp, mtcars$wt)
#' )
#'
#' # This will still be in black
#' plot(mtcars$hp, mtcars$wt)
#'
#' par(old)
with_par <- with_(graphics::par, get = get_par)

#' @rdname with_par
#' @export
local_par <- local_(graphics::par, get = get_par, dots = TRUE)
