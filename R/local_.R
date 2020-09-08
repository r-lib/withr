#' @rdname with_
#' @export
local_ <- function(set, reset = set, envir = parent.frame(), new = TRUE, dots = FALSE) {

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # called pass all extra formals on
    called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

    if (new) {
      if (dots) {
        called_fmls[[1]] <- as.symbol(".new")
        fun_args <- c(alist(.new = list(), ... = ), fmls[-1L])
      } else {
        called_fmls[[1]] <- as.symbol("new")
        fun_args <- c(alist(new = list()), fmls[-1L])
      }
    } else {
      fun_args <- fmls
    }
  } else {
    # no formals
    called_fmls <- NULL

    fun_args <- alist()
  }

  set_call <- as.call(c(substitute(set), called_fmls))

  reset <- if (missing(reset)) substitute(set) else substitute(reset)

  if (dots) {
    modify_call <- quote(.new <- utils::modifyList(as.list(.new), list(...)))

    fun <- eval(bquote(function(args) {
        .(modify_call)
        old <- .(set_call)
        defer(.(reset)(old), envir = .local_envir)
        invisible(old)
      }
    ))
  } else {
    fun <- eval(bquote(function(args) {
        old <- .(set_call)
        defer(.(reset)(old), envir = .local_envir)
        invisible(old)
      }
    ))
  }

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- c(fun_args, alist(.local_envir = parent.frame()))

  environment(fun) <- envir

  fun
}
