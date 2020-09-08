#' @include with_.R
NULL

# par ------------------------------------------------------------------------

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
with_par <- with_(graphics::par)

#' @rdname with_par
#' @export
local_par <- local_(graphics::par, dots = TRUE)
