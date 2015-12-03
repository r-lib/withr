context("With sink")

test_that("with_output_sink works as expected", {
  tmp <- tempfile()
  on.exit(unlink(tmp), add = TRUE)
  tmp2 <- tempfile()
  on.exit(unlink(tmp2), add = TRUE)
  tmp3 <- tempfile()
  on.exit(unlink(tmp3), add = TRUE)

  expect_equal(sink.number(), 0L)

  with_output_sink(tmp, {
    expect_equal(sink.number(), 1L)
    cat("output\n")
  })
  expect_equal(readLines(tmp), "output")

  expect_equal(sink.number(), 0L)

  with_output_sink(tmp, append = TRUE, {
    expect_equal(sink.number(), 1L)
    cat("output 2\n")
  })
  expect_equal(readLines(tmp), c("output", "output 2"))

  expect_equal(sink.number(), 0L)

  expect_warning(
    with_output_sink(tmp, {
      sink()
    }),
    "already removed"
  )

  expect_equal(sink.number(), 0L)

  expect_error(
    with_output_sink(NULL, {
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

  with_message_sink(tmp, {
    expect_gt(sink.number(type = "message"), 2L)
    message("message")
  })
  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(readLines(tmp), "message")

  with_message_sink(tmp, append = TRUE, {
    expect_gt(sink.number(type = "message"), 2L)
    message("message 2")
  })
  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(readLines(tmp), c("message", "message 2"))

  # Message and output sinks don't interfere
  with_message_sink(tmp, {
    sink(tmp2)
  })

  expect_equal(sink.number(type = "message"), 2L)
  expect_equal(sink.number(), 1L)
  sink()

  con <- file(tmp2, "w")
  on.exit(close(con), add = TRUE)
  expect_warning(
    with_message_sink(tmp, {
      sink(con, type = "message")
    }),
    "Not removing a different"
  )
  expect_gt(sink.number(type = "message"), 2L)
  sink(type = "message")


  expect_warning(
    with_message_sink(tmp, {
      sink(type = "message")
    }),
    "No message sink to remove"
  )

  expect_equal(sink.number(type = "message"), 2L)

  expect_warning(
    with_message_sink(tmp, {
      expect_error(
        with_message_sink(tmp2, NULL),
        "Cannot establish message sink when another sink is active."
      )
    }),
    NA
  )

  expect_equal(sink.number(type = "message"), 2L)

  expect_error(
    with_message_sink(NULL, {
      NULL
    }),
    "cannot be NULL"
  )

  expect_equal(sink.number(type = "message"), 2L)

  # Enable to check that test actually reaches this point
  #expect_true(FALSE)

})
