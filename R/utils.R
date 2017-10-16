make_call <- function(...) {
  as.call(list(...))
}

vlapply <- function(X, FUN, ..., FUN.VALUE = logical(1)) {
  vapply(X, FUN, ..., FUN.VALUE = FUN.VALUE)
}
