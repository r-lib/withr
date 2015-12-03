context("With sink")

test_that("with_sink works as expected", {
  tmp <- tempfile()
  on.exit(unlink(tmp), add = TRUE)
  tmp2 <- tempfile()
  on.exit(unlink(tmp2), add = TRUE)
  tmp3 <- tempfile()
  on.exit(unlink(tmp3), add = TRUE)

  expect_equal(sink.number(), 0L)

  with_sink(tmp, {
    stopifnot(sink.number() == 1L)
    cat("output\n")
  })
  expect_equal(readLines(tmp), "output")

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, {
      sink(tmp2)
    }),
    "Closing 1 "
  )

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, {
      sink(tmp2)
      sink(tmp3)
    }),
    "Closing 2 "
  )

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, {
      sink()
    }),
    "already closed"
  )

  expect_equal(sink.number(), 0L)

  expect_error(
    with_sink(NULL, {
      NULL
    }),
    "cannot be NULL"
  )
})
