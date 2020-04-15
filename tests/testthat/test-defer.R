context("defer")

test_that("defer_parent works", {
  local_file <- function(path) {
    file.create(path)
    defer_parent(unlink(path))
  }

  # create tempfile path
  path <- tempfile()

  # use 'local_file' in a function
  local({
    local_file(path)
    stopifnot(file.exists(path))
  })

  # file is deleted as we leave 'local' scope
  expect_false(file.exists(path))
})

test_that("defer()'s global env facilities work", {
  defer(print("one"), envir = globalenv())
  defer(print("two"), envir = globalenv())

  h <- attr(globalenv(), "handlers")
  expect_length(h, 2)

  expect_output(run_global_deferred(), "(one|two)")

  defer(print("three"), envir = globalenv())
  clear_global_deferred()

  h <- attr(globalenv(), "handlers")
  expect_null(h)
})
