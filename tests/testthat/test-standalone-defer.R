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

  expect_snapshot(
    defer(print("howdy"), envir = globalenv()),
    cran = TRUE
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

  expect_message(defer(print("never going to happen"), envir = globalenv()))
  deferred_clear(globalenv())

  h <- get_handlers(globalenv())
  expect_null(h)
})

test_that("non-top-level global env is unwound like a normal env", {
  expect_silent(
    evalq(local_options(list(opt = "foo")), globalenv())
  )

  # Check that handlers have been called
  expect_null(getOption("opt"))

  # Check that handlers were cleaned up
  expect_null(get_handlers(globalenv()))
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
  skip_if_cannot_knit()

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

test_that("defer works within source()", {
  local_options(withr.hook_source = TRUE)

  file <- local_tempfile()
  out <- NULL

  local_defer <- function(frame = parent.frame()) {
    defer(out <<- c(out, "local_defer"), envir = frame)
  }

  cat(file = file, "
    out <<- c(out, '1')
    defer(out <<- c(out, 'defer'))
    out <<- c(out, '2')
    identity(defer(out <<- c(out, 'identity(defer)')))
    out <<- c(out, '3')
    local_defer()
    out <<- c(out, '4')
    evalq(defer(out <<- c(out, 'evalq(defer)')))
    out <<- c(out, '5')
  ")
  local(
    source(file, local = TRUE)
  )

  expect_equal(out, c(
    "1",
    "2",
    "3",
    "4",
    "evalq(defer)",
    "5",
    "local_defer",
    "identity(defer)",
    "defer"
  ))
})

test_that("defer works within source()", {
  local_options(withr.hook_source = TRUE)

  out <- NULL

  file1 <- local_tempfile()
  file2 <- local_tempfile()

  cat(file = file1, "
    out <<- c(out, 'outer-1')
    defer(out <<- c(out, 'outer-before'))
    out <<- c(out, 'outer-2')
    local(source(file2, local = TRUE))
    defer(out <<- c(out, 'outer-after'))
    out <<- c(out, 'outer-3')
  ")
  cat(file = file2, "
    out <<- c(out, '1')
    defer(out <<- c(out, 'defer'))
    out <<- c(out, '2')
  ")

  local(
    source(file1, local = TRUE)
  )

  expect_equal(out, c(
    "outer-1",
    "outer-2",
    "1",
    "2",
    "defer",
    "outer-3",
    "outer-after",
    "outer-before"
  ))
})

test_that("defer works within knitr::knit()", {
  skip_if_not_installed("knitr")
  out <- NULL
  evalq({
    defer(out <- c(out, "first"))
    rmd <- "
      ```{r}
      defer(out <- c(out, 'defer 1'))
      out <- c(out, '1')
      local({
        withr::defer(out <<- c(out, 'local 1'))
      })
      ```
      ```{r}
      defer(out <- c(out, 'defer 2'))
      out <- c(out, '2')
      local({
        withr::defer(out <<- c(out, 'local 2'))
      })
      ```
    "
    knitr::knit(text = rmd, quiet = TRUE)
    defer(out <- c(out, "last"))
  })
  expect_equal(out, c(
    "1",
    "local 1",
    "2",
    "local 2",
    "defer 2",
    "defer 1",
    "last",
    "first"
  ))
})
