#' @include aaa.R
NULL

#' @rdname with_
#' @export
local_ <- function(set,
                   reset = set,
                   get = NULL,
                   ...,
                   envir = parent.frame(),
                   new = TRUE,
                   dots = FALSE) {
  if (!missing(...)) {
    stop("`...` must be empty.")
  }

  fmls <- formals(set)

  if (length(fmls) > 0L) {
    # Called pass all extra formals on
    called_fmls <- setNames(lapply(names(fmls), as.symbol), names(fmls))

    # Special case for dots. If `set()` and/or `get()` take dots, it
    # is assumed they implement `options()`-like semantic: a list
    # passed as first argument is automatically spliced in the dots.
    names(called_fmls)[names(called_fmls) == "..."] <- ""

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
    modify_call <- quote(.new <- list_combine(as.list(.new), list(...)))
  } else {
    modify_call <- NULL
  }

  if (is.null(get)) {
    fun <- eval(bquote(function(args) {
      .(modify_call)
      old <- .(set_call)
      defer(.(reset)(old), envir = .local_envir)
      invisible(old)
    }))
  } else {
    get_call <- as.call(c(substitute(get), called_fmls))
    fun <- eval(bquote(function(args) {
      .(modify_call)
      old <- .(get_call)
      defer(.(reset)(old), envir = .local_envir)
      .(set_call)
      invisible(old)
    }))
  }

  # substitute does not work on arguments, so we need to fix them manually
  formals(fun) <- c(fun_args, alist(.local_envir = parent.frame()))
  environment(fun) <- envir

  fun
}
