#' Torture Garbage Collector
#'
#' Temporarily change the interval for forced garbage collection.
#'
#' After evaluating `code`, the helper restores the previous collection
#' interval using the default values of `wait` and `inhibit_release`.
#'
#' @template with
#' @param new `[integer]`\cr Run GC every `new` allocations. Use `0` to
#'   disable forced collections.
#' @param wait integer; number of allocations to wait before starting GC torture.
#' @inheritParams base::gctorture
#' @inheritParams local_
#' @seealso [base::gctorture2()]
#' @export
with_gctorture2 <- with_(gctorture2)
formals(with_gctorture2)[[3]] <- quote(new)

local_gctorture2 <- local_(gctorture2)
formals(local_gctorture2)[[2]] <- quote(new)
