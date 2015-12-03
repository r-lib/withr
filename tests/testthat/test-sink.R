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
    expect_equal(sink.number(), 1L)
    cat("output\n")
  })
  expect_equal(readLines(tmp), "output")

  expect_equal(sink.number(), 0L)

  with_sink(tmp, append = TRUE, {
    expect_equal(sink.number(), 1L)
    cat("output 2\n")
  })
  expect_equal(readLines(tmp), c("output", "output 2"))

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_sink(tmp, {
      sink()
    }),
    "already removed"
  )

  expect_equal(sink.number(), 0L)

  expect_error(
    with_sink(NULL, {
      NULL
    }),
    "cannot be NULL"
  )

  expect_equal(sink.number(), 0L)

})

# don't use test_that() here to avoid any message redirection
local({
  tmp <- tempfile()
  on.exit(unlink(tmp), add = TRUE)
  tmp2 <- tempfile()
  on.exit(unlink(tmp2), add = TRUE)
  tmp3 <- tempfile()
  on.exit(unlink(tmp3), add = TRUE)


  expect_equal(sink.number(type = "message"), 2L)

  with_sink(tmp, type = "message", {
    #expect_gt(sink.number(type = "message"), 2L)
    message("message")
  })
  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(readLines(tmp), "message")

  with_sink(tmp, type = "message", append = TRUE, {
    expect_gt(sink.number(type = "message"), 2L)
    message("message 2")
  })
  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(readLines(tmp), c("message", "message 2"))

  # Message and output sinks don't interfere
  with_sink(tmp, type = "message", {
    sink(tmp2)
  })

  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(sink.number(), 1L)
  sink()

  con <- file(tmp2, "w")
  expect_warning(
    with_sink(tmp, type = "message", {
      on.exit(close(con))
      sink(con, type = "message")
    }),
    "Removing a different"
  )

  expect_equal(sink.number(type = "message"), 2L)

  expect_warning(
    with_sink(tmp, type = "message", {
      sink(type = "message")
    }),
    "No more sinks to remove"
  )

  expect_equal(sink.number(type = "message"), 2L)

  expect_warning(
    with_sink(tmp, type = "message", {
      expect_error(
        with_sink(tmp2, type = "message", NULL),
        "Cannot establish message sink when another sink is active."
      )
    }),
    NA
  )

  expect_equal(sink.number(type = "message"), 2L)

  expect_error(
    with_sink(NULL, type = "message", {
      NULL
    }),
    "cannot be NULL"
  )

  expect_equal(sink.number(type = "message"), 2L)

  # Enable to check that test actually reaches this point
  #expect_true(FALSE)

})
