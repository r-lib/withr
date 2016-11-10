#' @rdname with_
#' @export
scope_ <- function(set, reset = set, envir = parent.frame()) {

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # called pass all extra formals on
    called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

    # rename first formal to new
    called_fmls[[1]] <- as.symbol("new")

    fun_args <- c(alist(new =, code =), fmls[-1L])
  } else {
    # no formals -- only have code
    called_fmls <- NULL

    fun_args <- alist(code =)
  }

  set_call <- as.call(c(substitute(set), called_fmls))

  fun <- eval(bquote(function(args) {
    old <- .(set_call)
    later::defer(.(reset)(old), envir = .scoped_envir)
    old
  }, as.environment(list(set_call = set_call,
                         reset = if (missing(reset)) substitute(set) else substitute(reset)))))

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- c(fun_args, alist(.scoped_envir = parent.frame()))

  environment(fun) <- envir

  fun
}
