#' Collation Order
#'
#' Temporarily change collation order by changing the value of the
#' `LC_COLLATE` locale.
#'
#' @template with
#' @param new `[character(1)]`\cr New collation order
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' 
#' @section Examples:
#'
#' ```
#' # Modify collation order:
#' x <- c("bernard", "bérénice", "béatrice", "boris")
#'
#' with_collate("fr_FR", sort(x))
#' #> [1] "béatrice" "bérénice" "bernard"  "boris"   
#'
#' with_collate("C", sort(x))
#' #> [1] "bernard"  "boris"    "béatrice" "bérénice"
#' ```
#' @export
with_collate <- function(new, code) {
  with_locale(c(LC_COLLATE = new), code)
}

#' @rdname with_collate
#' @export
local_collate <- function(new = list(), .local_envir = parent.frame()) {
  local_locale(c(LC_COLLATE = new), .local_envir = .local_envir)
}
