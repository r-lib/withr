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

  expect_output(deferred_run(globalenv()), "howdy")
  expect_equal(Sys.getenv("abcdefg"), "abcdefg")

  defer(print("never going to happen"), envir = globalenv())
  deferred_clear(globalenv())

  h <- get_handlers(globalenv())
  expect_null(h)
})

test_that("defer executes all handlers even if there is an error in one of them", {

  old <- options("test_option" = 1)
  on.exit(options(old), add = TRUE)

  f <- function() {
    defer(stop("hi"))
    defer(options("test_option" = 2))
  }

  expect_equal(getOption("test_option"), 1)

  err <- tryCatch(f(), error = identity)

  expect_equal(conditionMessage(err), "hi")

  expect_equal(getOption("test_option"), 2)
})
