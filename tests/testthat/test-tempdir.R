context("tempdir")

test_that("clean needs to be a single logical", {
  
  contents <- dir(tempdir())

  expect_error(with_tempdir(clean = "sparkling"), 
               "'clean' must be a single TRUE or FALSE")
  # Check to make sure that the tempdir wasn't touched
  expect_identical(contents, dir(tempdir()))
  
  expect_error(with_tempdir(clean = c(TRUE, FALSE)), 
               "'clean' must be a single TRUE or FALSE")
  # Check to make sure that the tempdir wasn't touched
  expect_identical(contents, dir(tempdir()))

})

test_that("tempdir cleans up after itself", {
  contents <- dir(tempdir())
  tmp <- with_tempdir(getwd())
  expect_false(file.exists(tmp))
  # Check to make sure that the tempdir wasn't touched
  expect_identical(contents, dir(tempdir()))
})

test_that("tempdir will leave the directory alone if clean = FALSE", {
  tmp <- with_tempdir({
    writeLines("Is it me you were looking for?", con = "hello.txt")
    getwd()
  }, clean = TRUE)
  expect_true(file.exists(tmp))
  expect_identical(dir(tmp), "hello.txt")
  expect_identical(readLines(file.path(tmp, "hello.txt")), 
                   "Is it me you were looking for?")

})
