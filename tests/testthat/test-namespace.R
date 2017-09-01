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

test_that("local_namespace works", {

  # tools package not attached to the search path
  expect_false("asNamespace(\"tools\")" %in% search())

  f <- function() {
    local_namespace("tools")

    # .BioC_version_associated_with_R_version is a non-exported object in tools
    expect_true(is.function(.BioC_version_associated_with_R_version))
  }

  f()

  # tools namespace still not attached to the search path
  expect_false("asNamespace(\"tools\")" %in% search())
})
