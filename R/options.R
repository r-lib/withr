#' @include with_.R

# options --------------------------------------------------------------------

set_options <- function(new_options) {
  do.call(options, as.list(new_options))
}

#' Options
#'
#' Temporarily change global options.
#'
#' @template with
#' @param new `[named list]`\cr New options and their values
#' @inheritParams with_collate
#' @seealso [options()]
#' @export
with_options <- with_(set_options)

#' @rdname with_options
#' @export
local_options <- local_(set_options)
