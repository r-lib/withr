context("namespace")

test_that("with_namespace works", {

  # tools namespace not attached to the search path
  expect_false("package:tools" %in% search())

  with_namespace("tools",
    expect_equal(SIGINT, 2))

  # tools namespace still not attached to the search path
  expect_false("package:tools" %in% search())
})
