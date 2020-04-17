#' @rdname with_
#' @export
local_ <- function(set, reset = set, envir = parent.frame(), new = TRUE) {

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # called pass all extra formals on
    called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

    if (new) {
      # rename first formal to new
      called_fmls[[1]] <- as.symbol("new")

      fun_args <- c(alist(new =), fmls[-1L])
    } else {
      fun_args <- fmls
    }
  } else {
    # no formals
    called_fmls <- NULL

    fun_args <- alist()
  }

  set_call <- as.call(c(substitute(set), called_fmls))

  fun <- eval(bquote(function(args) {
    old <- .(set_call)
    defer(.(reset)(old), envir = .local_envir)
    invisible(old)
  }, as.environment(list(set_call = set_call,
                         reset = if (missing(reset)) substitute(set) else substitute(reset)))))

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- c(fun_args, alist(.local_envir = parent.frame()))

  environment(fun) <- envir

  fun
}
