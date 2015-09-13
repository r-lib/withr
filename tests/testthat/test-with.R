context("With")

test_that("with_envvar sets and unsets variables", {

  # Make sure the "set_env_testvar" environment var is not set.
  Sys.unsetenv("set_env_testvar")
  expect_false("set_env_testvar" %in% names(Sys.getenv()))

  # Use with_envvar (which calls set_envvar) to temporarily set it to 1
  expect_identical("1", with_envvar(c("set_env_testvar" = 1),
    Sys.getenv("set_env_testvar")))

  # set_env_testvar shouldn't stay in the list of environment vars
  expect_false("set_env_testvar" %in% names(Sys.getenv()))
})

test_that("with_envar respects suffix and prefix", {
  nested <- function(op1, op2) {
    with_envvar(c(A = 1), action = op1,
      with_envvar(c(A = 2), action = op2,
        Sys.getenv("A")[[1]]
      )
    )
  }

  expect_equal(nested("replace", "suffix"), c("1 2"))
  expect_equal(nested("replace", "prefix"), c("2 1"))
  expect_equal(nested("prefix", "suffix"), c("1 2"))
  expect_equal(nested("prefix", "prefix"), c("2 1"))
  expect_equal(nested("suffix", "suffix"), c("1 2"))
  expect_equal(nested("suffix", "prefix"), c("2 1"))
})

test_that("with_options works", {
  expect_that(getOption("scipen"), not(equals(999)))
  expect_equal(with_options(c(scipen=999), getOption("scipen")), 999)
  expect_that(getOption("scipen"), not(equals(999)))

  expect_that(getOption("zyxxyzyx"), not(equals("qwrbbl")))
  expect_equal(with_options(c(zyxxyzyx="qwrbbl"), getOption("zyxxyzyx")), "qwrbbl")
  expect_that(getOption("zyxxyzyx"), not(equals("qwrbbl")))
})

test_that("with_lib works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  with_lib(
    new_lib,
    {
      expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
      expect_equal(length(.libPaths()), length(lib) + 1L)
    }
  )
  expect_equal(lib, .libPaths())
})

test_that("with_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  with_libpaths(
    new_lib,
    {
      expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
    }
  )
  expect_equal(lib, .libPaths())
})

test_that("with_something works", {
  res <- NULL
  set <- function(new) {
    res <<- c(res, 1L)
  }
  reset <- function(old) {
    res <<- c(res, 3L)
  }
  with_res <- with_something(set, reset)
  with_res(NULL, res <- c(res, 2L))
  expect_equal(res, 1L:3L)
})

test_that("with_path works and resets path", {
  current <- normalizePath(get_path())
  new_path <- normalizePath(".")
  with_path(
    new_path,
    {
      expect_equal(normalizePath(new_path), tail(get_path(), n = 1))
      expect_equal(length(get_path()), length(current) + 1L)
    }
  )
  expect_equal(current, get_path())
})

test_that("with_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  with_libpaths(
    new_lib,
    {
      expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
    }
  )
  expect_equal(lib, .libPaths())
})
test_that("with_locale works and resets locales", {
  current <- Sys.getlocale("LC_CTYPE")
  new <- "C"
  with_locale(
    c(LC_CTYPE = new),
    {
      expect_equal(new, Sys.getlocale("LC_CTYPE"))
    }
  )
  expect_equal(current, Sys.getlocale("LC_CTYPE"))
})
test_that("with_collate works and resets collate", {
  current <- Sys.getlocale("LC_COLLATE")
  new <- "C"
  with_collate(
    new,
    {
      expect_equal(new, Sys.getlocale("LC_COLLATE"))
    }
  )
  expect_equal(current, Sys.getlocale("LC_COLLATE"))
})
test_that("in_dir works and resets the working directory", {
  current <- normalizePath(getwd())
  new <- normalizePath("..")
  in_dir(
    new,
    {
      expect_equal(new, getwd())
    }
  )
  expect_equal(current, getwd())
})
test_that("with_makevars works and resets the Makevars file", {
  current <- tempfile()
  cat(file = current, c("CFLAGS=-03"))
  new <- c(CFLAGS = "-O0")
  with_makevars(
    new, path = current,
    {
      expect_equal("CFLAGS=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
    }
  )
  expect_equal("CFLAGS=-03", readLines(current))
})
