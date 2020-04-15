context("tempdir")

test_that("clean needs to be a single logical", {
  expect_error(with_tempdir(clean = "sparkling"), "TRUE or FALSE")
  expect_error(with_tempdir(clean = c(TRUE, FALSE)), "TRUE or FALSE")
})

test_that("tempdir cleans up after itself", {
  tmp <- with_tempdir(getwd())
  expect_false(file.exists(tmp))
})

test_that("tempdir will leave the directory alone if clean = FALSE", {
  tmp <- with_tempdir({
    cat("x\n", file = "hello.txt")
    getwd()
  }, clean = FALSE)

  expect_equal(readLines(file.path(tmp, "hello.txt")), "x")
})
