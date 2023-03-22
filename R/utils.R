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

#' Shim for tools::makevars_user()
#' @keywords internal
#' @export
makevars_user <- function() {
  if (getRversion() >= "3.3") {
    return(tools::makevars_user())
  }
  # Below is tools::makevars_user() from R 3.6.2
  m <- character()
  if (.Platform$OS.type == "windows") {
    if (!is.na(f <- Sys.getenv("R_MAKEVARS_USER", NA_character_))) {
      if (file.exists(f))
        m <- f
    }
    else if ((Sys.getenv("R_ARCH") == "/x64") && file.exists(f <- path.expand("~/.R/Makevars.win64")))
      m <- f
    else if (file.exists(f <- path.expand("~/.R/Makevars.win")))
      m <- f
    else if (file.exists(f <- path.expand("~/.R/Makevars")))
      m <- f
  }
  else {
    if (!is.na(f <- Sys.getenv("R_MAKEVARS_USER", NA_character_))) {
      if (file.exists(f))
        m <- f
    }
    else if (file.exists(f <- path.expand(paste0("~/.R/Makevars-",
            Sys.getenv("R_PLATFORM")))))
      m <- f
    else if (file.exists(f <- path.expand("~/.R/Makevars")))
      m <- f
  }
  m
}

as_character <- function(x) {
  nms <- names(x)
  res <- as.character(x)
  names(res) <- nms
  res
}

list_combine <- function(rhs, lhs) {
  for (nme in names(lhs)) {
    rhs[nme] <- lhs[nme]
  }
  rhs
}

# Helper to implement `options()`-like splicing
auto_splice <- function(x) {
  if (length(x) == 1 && is.null(names(x)) && is.list(x[[1]])) {
    x[[1]]
  } else {
    x
  }
}

setNames <- function(x = nm, nm) {
  names(x) <- nm
  x
}

# base implementation of rlang::is_interactive()
is_interactive <- function() {
  opt <- getOption("rlang_interactive")
  if (!is.null(opt)) {
    return(opt)
  }
  if (knitr_in_progress()) {
    return(FALSE)
  }
  if (identical(Sys.getenv("TESTTHAT"), "true")) {
    return(FALSE)
  }
  interactive()
}
