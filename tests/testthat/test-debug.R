test_that("with_trace sets and unsets tracing", {
  skip_if(exists("foo", envir = .GlobalEnv))
  .GlobalEnv$foo <- function(x) x + 1
  on.exit(rm("foo", envir = .GlobalEnv))

  with_trace(
    foo,
    tracer = quote(message("hi")),
    expect_message(
      expect_output(
        expect_identical(foo(1), 2),
        "Tracing foo(1) on entry",
        fixed = TRUE
      ),
      "hi",
      fixed = TRUE
    )
  )

  # untraced
  expect_silent(expect_identical(foo(1), 2))
})
