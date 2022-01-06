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
  local_options(rlang_interactive = TRUE)
  Sys.setenv(abcdefg = "abcdefg")

  expect_snapshot(defer(print("howdy"), envir = globalenv()))
  expect_message(
    local_envvar(c(abcdefg = "tuvwxyz"), .local_envir = globalenv()),
    NA
  )

  h <- get_handlers(globalenv())
  expect_length(h, 2)
  expect_equal(Sys.getenv("abcdefg"), "tuvwxyz")

  expect_output(deferred_run(globalenv()), "howdy")
  expect_equal(Sys.getenv("abcdefg"), "abcdefg")

  expect_message(defer(print("never going to happen"), envir = globalenv()))
  deferred_clear(globalenv())

  h <- get_handlers(globalenv())
  expect_null(h)
})

test_that("defered actions in global env are run on exit", {
  path <- local_tempfile()
  callr::r(
    function(path) {
      withr::defer(writeLines("a", path), env = globalenv())
    },
    list(path = path)
  )
  expect_equal(readLines(path), "a")
})

test_that("defered actions in Rmd are run on exit", {
  rmd <- local_tempfile(fileext = ".Rmd")
  path <- local_tempfile()
  writeLines(rmd, text = c(
    "---",
    "title: test",
    "---",
    "```{r}",
    paste0("withr::defer(writeLines('a', ", encodeString(path, quote = "'"), "))"),
    "```"
  ))
  callr::r(function(path) rmarkdown::render(path), list(path = rmd))
  expect_equal(readLines(path), "a")

  # And check when run from globalenv
  unlink(path)
  callr::r(function(path) rmarkdown::render(path, envir = globalenv()), list(path = rmd))
  expect_equal(readLines(path), "a")

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
