#' @include with_.R
NULL

# par ------------------------------------------------------------------------

#' Graphics parameters
#'
#' Temporarily change graphics parameters.
#'
#' @template with
#' @param new `[named list]`\cr New graphics parameters and their values
#' @param no.readonly `[logical(1)]`\cr see [par()] documentation.
#' @inheritParams with_collate
#' @seealso [par()]
#' @export
with_par <- with_(graphics::par)

#' @rdname with_par
#' @export
local_par <- local_(graphics::par)
