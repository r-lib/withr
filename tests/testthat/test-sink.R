context("With sink")

test_that("with_sink knows only message and output", {
  expect_equal(eval(formals(with_sink)$type), c("output", "message"))
})

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
    "Removing a different"
  )

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, type = "message", {
      sink(tmp2)
    }),
    NA
  )

  expect_equal(sink.number(type = "message"), 0L)
  expect_equal(sink.number(), 1L)
  sink()

  expect_warning(
    with_sink(tmp, type = "message", {
      sink(tmp2, type = "message")
    }),
    "Removing a different"
  )

  expect_equal(sink.number(type = "message"), 0L)

  expect_warning(
    with_sink(tmp, {
      sink()
    }),
    "already removed"
  )

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, type = "message", {
      sink(type = "message")
    }),
    "already closed"
  )

  expect_equal(sink.number(type = "message"), 0L)

  expect_warning(
    with_sink(tmp, type = "message", {
      expect_warning(
        with_sink(tmp2, type = "message", {
          sink(type = "message")
        }),
        "No more sinks to remove"
      )
    }),
    "No more sinks to remove"
  )

  expect_equal(sink.number(type = "message"), 0L)

  expect_error(
    with_sink(NULL, {
      NULL
    }),
    "cannot be NULL"
  )

  expect_equal(sink.number(), 0L)

})
