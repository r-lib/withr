#' @include with_.R
NULL

# working directory ----------------------------------------------------------

#' Working directory
#'
#' Temporarily change the current working directory.
#'
#' @template with
#' @param new `[character(1)]`\cr New working directory
#' @inheritParams with_collate
#' @seealso [setwd()]
#' @export
#' @examples
#' getwd() # current working directory
#' 
#' # change the current working directory to a temporary one and run getwd()
#' with_dir(tempdir(), getwd())
#' 
#' # once the function execution is completed the working directory is restored
#' getwd()
with_dir <- with_(setwd)

#' @rdname with_dir
#' @export
local_dir <- local_(setwd)
