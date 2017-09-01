context("namespace")

test_that("with_package works", {

  # tools package not attached to the search path
  expect_false("package:tools" %in% search())

  with_package("tools",

    # SIGINT is an exported object in tools
    expect_equal(SIGINT, 2))

  # tools package still not attached to the search path
  expect_false("package:tools" %in% search())
})

test_that("local_package works", {

  # tools package not attached to the search path
  expect_false("package:tools" %in% search())

  f <- function() {
    local_package("tools")

    # SIGINT is an exported object in tools
    expect_equal(SIGINT, 2)
  }

  f()

  # tools package still not attached to the search path
  expect_false("package:tools" %in% search())
})

test_that("with_namespace works", {

  # tools package not attached to the search path
  expect_false("<environment: namespace:tools>" %in% search())

  with_namespace("tools", {

    expect_true("<environment: namespace:tools>" %in% search())

    # .BioC_version_associated_with_R_version is a non-exported object in tools
    expect_true(is.function(.BioC_version_associated_with_R_version))
  })

  # tools namespace still not attached to the search path
  expect_false("<environment: namespace:tools>" %in% search())
})

test_that("local_namespace works", {

  # tools package not attached to the search path
  expect_false("<environment: namespace:tools>" %in% search())

  f <- function() {
    local_namespace("tools")

    expect_true("<environment: namespace:tools>" %in% search())

    # .BioC_version_associated_with_R_version is a non-exported object in tools
    expect_true(is.function(.BioC_version_associated_with_R_version))
  }

  f()

  # tools namespace still not attached to the search path
  expect_false("<environment: namespace:tools>" %in% search())
})

test_that("with_environment works", {

  e <- new.env()
  e$a <- 1

  # environment not attached to the search path
  expect_false(format(e) %in% search())

  with_environment(e, {

  # environment attached to the search path
    expect_true(format(e) %in% search())
    expect_equal(a, 1)
  })

  # environment not attached to the search path
  expect_false(format(e) %in% search())
})

test_that("local_environment works", {

  e <- new.env()
  e$a <- 1

  # environment not attached to the search path
  expect_false(format(e) %in% search())

  f <- function() {
    local_environment(e)

  # environment attached to the search path
    expect_true(format(e) %in% search())
    expect_equal(a, 1)
  }

  f()

  # environment not attached to the search path
  expect_false(format(e) %in% search())
})
