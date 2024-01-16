#' Find frame for exit handlers
#' @noRd
#'
#' @description
#' - If knitr is running and `defer()` is run at top-level in a chunk,
#'   `exit_frame()` returns the first frame on the stack that inherits
#'   from the knitr namespace. This way handlers are run when knitr
#'   returns.
#'
#' - If `getOption("withr.hook_source")` is `TRUE`, and `defer()` is
#'   run at top-level in a script being evaluated by [base::source()],
#'   `exit_frame()` returns the frame of `source()`. This way handlers
#'   are run when the script has finished running.
#'
exit_frame <- function(envir,
                       frames = as.list(sys.frames()),
                       calls = as.list(sys.calls())) {
  frame_loc <- frame_loc(envir, frames)
  if (!frame_loc) {
    return(envir)
  }

  if (in_knitr(envir)) {
    out <- knitr_frame(envir, frames, calls, frame_loc)
    if (!is.null(out)) {
      return(out)
    }
  }

  if (isTRUE(getOption("withr.hook_source"))) {
    out <- source_frame(envir, frames, calls, frame_loc)
    if (!is.null(out)) {
      return(out)
    }
  }

  envir
}

knitr_frame <- function(envir, frames, calls, frame_loc) {
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

source_frame <- function(envir, frames, calls, frame_loc) {
  i <- frame_loc

  if (i < 4) {
    return(NULL)
  }

  is_call <- function(x, fn) {
    is.call(x) && identical(x[[1]], fn)
  }
  calls <- as.list(calls)

  if (!is_call(calls[[i - 3]], quote(source))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 2]], quote(withVisible))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 1]], quote(eval))) {
    return(NULL)
  }
  if (!is_call(calls[[i - 0]], quote(eval))) {
    return(NULL)
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
