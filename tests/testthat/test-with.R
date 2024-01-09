test_that("with_options works", {
  expect_false(identical(getOption("scipen"), 999))
  expect_equal(with_options(c(scipen=999), getOption("scipen")), 999)
  expect_false(identical(getOption("scipen"), 999))

  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
  expect_equal(with_options(c(zyxxyzyx="qwrbbl"), getOption("zyxxyzyx")), "qwrbbl")
  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
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

test_that("with_temp_libpaths works and resets library", {
  lib <- .libPaths()
  with_temp_libpaths(
    expect_equal(.libPaths()[-1], lib)
  )
  expect_equal(lib, .libPaths())
})

test_that("with_temp_libpaths has an action argument", {
  lib <- .libPaths()
  with_temp_libpaths(
    action = "suffix",
    expect_equal(.libPaths()[-length(.libPaths())], lib)
  )
  expect_equal(lib, .libPaths())
})

test_that("with_ works", {
  res <- NULL
  set <- function(new) {
    res <<- c(res, 1L)
  }
  reset <- function(old) {
    res <<- c(res, 3L)
  }
  with_res <- with_(set, reset)
  with_res(NULL, res <- c(res, 2L))
  expect_equal(res, 1L:3L)
})

test_that("with_ works on functions without arguments", {
  res <- NULL
  set <- function() {
    res <<- c(res, 1L)
  }
  reset <- function(x) {
    res <<- c(res, 3L)
  }
  with_res <- with_(set, reset)
  with_res(res <- c(res, 2L))
  expect_equal(res, 1L:3L)
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

test_that("with_makevars works and resets the Makevars file", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-O3"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  with_makevars(
    new, path = current,
    {
      expect_equal("CFLAGS=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
    }
  )
  expect_equal("CFLAGS=-O3", readLines(current))
})

test_that("with_makevars changes only the defined variables", {
  current_name <- tempfile()
  current <- c("CFLAGS=-O3", "LDFLAGS=-lz")
  writeLines(con = current_name, current, sep = "\n")
  new <- c(CFLAGS = "-O0")
  with_makevars(
    new, path = current_name,
    {
      expect_equal(c("CFLAGS=-O0", "LDFLAGS=-lz"), readLines(Sys.getenv("R_MAKEVARS_USER")))
    }
  )
  expect_equal(current, readLines(current_name))
})

test_that("with_makevars works with alternative assignments", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-O3"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  with_makevars(
    new, path = current, assignment = "+=",
    {
      expect_equal("CFLAGS+=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
    }
  )
  expect_equal("CFLAGS=-O3", readLines(current))
})

test_that("with_makevars uses the existing R_MAKEVARS_USER by default", {
  tf <- tempfile()
  local_envvar("R_MAKEVARS_USER" = tf)
  on.exit(unlink(tf))
  writeLines(con = tf, c("CFLAGS=-O3", "CXXFLAGS=-O3"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  with_makevars(
    new,
    {
      expect_equal(readLines(Sys.getenv("R_MAKEVARS_USER")), c("CFLAGS=-O0", "CXXFLAGS=-O3"))
    }
  )
  expect_equal(readLines(tf), c("CFLAGS=-O3", "CXXFLAGS=-O3"))
})

test_that("set_makevars works as expected", {
  expect_equal(set_makevars(character(0)), NULL)

  tmp_old <- tempfile()
  tmp_new <- tempfile()

  # empty old file
  set_makevars(c(CFLAGS = "-O3"), tmp_old, tmp_new)
  expect_equal(readLines(tmp_new), c("CFLAGS=-O3"))

  # non-empty old file without new field
  writeLines(con=tmp_old, c("LDFLAGS=-lz"))
  set_makevars(c(CFLAGS = "-O3"), tmp_old, tmp_new)
  expect_equal(readLines(tmp_new), c("LDFLAGS=-lz", "CFLAGS=-O3"))

  # non-empty old file without multiple field definitions (error)
  writeLines(con=tmp_old, c("CFLAGS=-O0", "CFLAGS=-O1"))
  expect_error(set_makevars(c(CFLAGS = "-O3"), tmp_old, tmp_new))

  unlink(tmp_old)
  unlink(tmp_new)
})

test_that("with_dir works as expected", {
  old <- normalizePath(getwd())
  with_dir("..", {
    expect_equal(normalizePath(getwd()), normalizePath(file.path(old, "..")))
  })
  expect_equal(normalizePath(getwd()), normalizePath(old))
})

test_that("supplying a getter to `with_()` shields against early exits", {
  my_get <- function(x) {
    out <- as.list(state)[names(x)]
    names(out) <- names(x)
    out
  }
  my_set <- function(x) {
    old <- my_get(x)

    mapply(function(nm, val) state[[nm]] <- val, names(x), x)
    rlang::signal("", "my_cnd")

    invisible(old)
  }

  state <- new.env()
  my_with_unsafe <- withr::with_(my_set)
  my_with_safe <- withr::with_(my_set, get = my_get)

  expect_safe_and_unsafe_unwinding(
    state,
    my_with_unsafe,
    my_with_safe
  )
})
