make_call <- function(...) {
  as.call(list(...))
}

vlapply <- function(X, FUN, ..., FUN.VALUE = logical(1)) {
  vapply(X, FUN, ..., FUN.VALUE = FUN.VALUE)
}

names2 <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep("", length(x))
  } else {
    nms[is.na(nms)] <- ""
    nms
  }
}
