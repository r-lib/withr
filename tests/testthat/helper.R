expect_no_output <- function(...) {
  testthat::expect_output(..., regexp = NA)
}

expect_safe_and_unsafe_unwinding <- function(state,
                                             with_unsafe,
                                             with_safe) {
  early_exit <- function(expr) {
    tryCatch(expr, my_cnd = identity)
  }

  with_unsafe(list("var" = "foo"), NULL)
  expect_null(state[["var"]])

  with_safe(list("var" = "foo"), NULL)
  expect_null(state[["var"]])

  early_exit(with_safe(list("var" = "foo"), NULL))
  expect_null(state[["var"]])

  # Problematic behaviour with unsafe variant
  early_exit(with_unsafe(list("var" = "foo"), NULL))
  expect_equal(state[["var"]], "foo")
}
