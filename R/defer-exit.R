# Find first knitr frame on the stack
knitr_exit_frame <- function(envir) {
  frames <- as.list(sys.frames())

  frame_loc <- frame_loc(envir, frames)
  if (!frame_loc) {
    return(envir)
  }

  knitr_ns <- asNamespace("knitr")

  # This doesn't handle correctly the recursive case (knitr called
  # within a chunk). Handling this would be a little fiddly for an
  # uncommon edge case.
  for (i in seq(1, frame_loc)) {
    if (identical(topenv(frames[[i]]), knitr_ns)) {
      return(frames[[i]])
    }
  }

  NULL
}

source_exit_frame <- function(envir) {
  frames <- as.list(sys.frames())
  calls <- as.list(sys.calls())

  i <- frame_loc(envir, frames)
  if (!i) {
    return(envir)
  }

  if (i < 4) {
    return(envir)
  }

  is_call <- function(x, fn) {
    is.call(x) && identical(x[[1]], fn)
  }
  calls <- as.list(calls)

  if (!is_call(calls[[i - 3]], quote(source))) {
    return(envir)
  }
  if (!is_call(calls[[i - 2]], quote(withVisible))) {
    return(envir)
  }
  if (!is_call(calls[[i - 1]], quote(eval))) {
    return(envir)
  }
  if (!is_call(calls[[i - 0]], quote(eval))) {
    return(envir)
  }

  frames[[i - 3]]
}

frame_loc <- function(envir, frames) {
  n <- length(frames)
  if (!n) {
    return(0)
  }

  for (i in seq_along(frames)) {
    if (identical(frames[[n - i + 1]], envir)) {
      return(n - i + 1)
    }
  }

  0
}

in_knitr <- function(envir) {
  knitr_in_progress() && identical(knitr::knit_global(), envir)
}
knitr_in_progress <- function() {
  isTRUE(getOption("knitr.in.progress"))
}
