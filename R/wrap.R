wrap <- function(f, pre, post, envir = parent.frame()) {
  fmls <- formals(f)

  # called pass all extra formals on
  called_fmls <- stats::setNames(lapply(names(fmls), as.symbol), names(fmls))

  f_call <- as.call(c(substitute(f), called_fmls))
  pre <- substitute(pre)
  post <- substitute(post)

  fun <- eval(bquote(function(args) {
    .(pre)
    .retval <- .(f_call)
    .(post)
  }, as.environment(list(f_call = f_call, pre = pre, post = post))))

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- fmls

  environment(fun) <- envir

  fun

}
