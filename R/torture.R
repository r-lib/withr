#' Torture Garbage Collector
#'
#' Temporarily turn gctorture2 on.
#'
#' @template with
#' @param new `[integer]`\cr run GC every 'step' allocations.
#' @param wait integer; number of allocations to wait before starting GC torture.
#' @inheritParams base::gctorture
#' @inheritParams local_
with_gctorture2 <- with_(gctorture2)
formals(with_gctorture2)[[3]] <- quote(new)

local_gctorture2 <- local_(gctorture2)
formals(local_gctorture2)[[2]] <- quote(new)
