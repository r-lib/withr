#' @include with_.R

# options --------------------------------------------------------------------

set_options <- function(new_options) {
  do.call(options, as.list(new_options))
}

reset_options <- function(old_options) {
    options(old_options)
}

#' Options
#'
#' Temporarily change global options.
#'
#' @template with
#' @param new `[named list]`\cr New options and their values
#' @inheritParams with_collate
#' @seealso [options()]
#' @examples
#' # number of significant digits to print
#' getOption("digits")
#' # modify temporarily the number of significant digits to print
#' with_options(list(digits = 3), getOption("digits"))
#' with_options(list(digits = 3), print(pi))
#'
#' # modify temporarily the character to be used as the decimal point
#' getOption("digits")
#' with_options(list(OutDec = ","), print(pi))
#'
#' # modify temporarily multiple options
#' with_options(list(OutDec = ",", digits = 3), print(pi))
#' @export
with_options <- with_(set_options, reset_options)

#' @rdname with_options
#' @export
local_options <- local_(set_options, reset_options)
