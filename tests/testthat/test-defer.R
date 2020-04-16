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
  expect_null(get_handlers(globalenv()))
  Sys.setenv(abcdefg = "abcdefg")

  expect_message(
    defer(print("howdy"), envir = globalenv()),
    "Setting deferred event"
  )
  expect_message(
    local_envvar(c(abcdefg = "tuvwxyz"), .local_envir = globalenv()),
    NA
  )

  h <- get_handlers(globalenv())
  expect_length(h, 2)
  expect_equal(Sys.getenv("abcdefg"), "tuvwxyz")

  expect_output(run_global_deferred(), "howdy")
  expect_equal(Sys.getenv("abcdefg"), "abcdefg")

  defer(print("never going to happen"), envir = globalenv())
  clear_global_deferred()

  h <- get_handlers(globalenv())
  expect_null(h)
})
