test_that("local_options lets you unset an option (#156)", {
  expect_true(is.null(getOption("x")))
  local({
    local_options(foo = "bar")
    expect_equal(getOption("foo"), "bar")
  })

  expect_true(is.null(getOption("x")))

  local({
    local_options(foo = "bar")
    expect_equal(getOption("foo"), "bar")
    local_options(foo = NULL)
    expect_true(is.null(getOption("x")))
  })
  expect_true(is.null(getOption("x")))
})
