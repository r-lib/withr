context("scope")

test_that("scope_envvar sets and unsets variables", {

  # Make sure the "set_env_testvar" environment var is not set.
  Sys.unsetenv("set_env_testvar")
  expect_false("set_env_testvar" %in% names(Sys.getenv()))

  # Use scope_envvar (which calls set_envvar) to temporarily set it to 1
  local({
    scope_envvar(c("set_env_testvar" = 1))
    expect_identical("1", Sys.getenv("set_env_testvar"))
  })

  # set_env_testvar shouldn't stay in the list of environment vars
  expect_false("set_env_testvar" %in% names(Sys.getenv()))
})

test_that("scope_envar respects suffix and prefix", {
  nested <- function(op1, op2) {
    local({
      scope_envvar(c(A = 1), action = op1)
      local({
        scope_envvar(c(A = 2), action = op2)
        Sys.getenv("A")[[1]]
      })
    })
  }

  expect_equal(nested("replace", "suffix"), c("1 2"))
  expect_equal(nested("replace", "prefix"), c("2 1"))
  expect_equal(nested("prefix", "suffix"), c("1 2"))
  expect_equal(nested("prefix", "prefix"), c("2 1"))
  expect_equal(nested("suffix", "suffix"), c("1 2"))
  expect_equal(nested("suffix", "prefix"), c("2 1"))
})

test_that("scope_options works", {
  expect_false(getOption("scipen") == 999)
  local({
    scope_options(c(scipen=999))
    expect_equal(getOption("scipen"), 999)
  })
  expect_false(getOption("scipen") == 999)

  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
  local({
    scope_options(c(zyxxyzyx="qwrbbl"))
    expect_equal(getOption("zyxxyzyx"), "qwrbbl")
  })
  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
})

test_that("scope_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  local({
    scope_libpaths(new_lib)
    expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
  })
  expect_equal(lib, .libPaths())
})

test_that("scope_temp_libpaths works and resets library", {
  lib <- .libPaths()
  local({
    scope_temp_libpaths()
    expect_equal(.libPaths()[-1], lib)
  })
  expect_equal(lib, .libPaths())
})

test_that("scope_ works", {
  res <- NULL
  set <- function(new) {
    res <<- c(res, 1L)
  }
  reset <- function(old) {
    res <<- c(res, 3L)
  }
  scope_res <- scope_(set, reset)
  local({
    scope_res(NULL)
    res <<- c(res, 2L)
  })
  expect_equal(res, 1L:3L)
})

test_that("scope_ works on functions without arguments", {
  res <- NULL
  set <- function() {
    res <<- c(res, 1L)
  }
  reset <- function(x) {
    res <<- c(res, 3L)
  }
  scope_res <- scope_(set, reset)
  local({
    scope_res()
    res <<- c(res, 2L)
  })
  expect_equal(res, 1L:3L)
})

test_that("scope_path works and resets path", {
  current <- normalizePath(get_path())
  new_path <- normalizePath(".")
  local({
    scope_path(new_path)
    expect_equal(normalizePath(new_path), head(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("scope_path scope suffix action works and resets path", {
  current <- normalizePath(get_path())
  new_path <- normalizePath(".")
  local({
    scope_path(new_path, action = "suffix")
    expect_equal(normalizePath(new_path), tail(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("scope_path scope replace action works and resets path", {
  current <- normalizePath(get_path())
  new_path <- normalizePath(".")
  local({
    scope_path(new_path, action = "replace")
    expect_equal(normalizePath(new_path), get_path())
    expect_equal(length(get_path()), 1L)
  })
  expect_equal(current, get_path())
})

test_that("scope_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  local({
    scope_libpaths(new_lib)
    expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
  })
  expect_equal(lib, .libPaths())
})

test_that("scope_locale works and resets locales", {
  current <- Sys.getlocale("LC_CTYPE")
  new <- "C"
  local({
    scope_locale(c(LC_CTYPE = new))
    expect_equal(new, Sys.getlocale("LC_CTYPE"))
  })
  expect_equal(current, Sys.getlocale("LC_CTYPE"))
})

test_that("scope_locale fails scope LC_ALL", {
  local({
    expect_error(scope_locale(c(LC_ALL = "C")), "LC_ALL")
  })
})

test_that("scope_collate works and resets collate", {
  current <- Sys.getlocale("LC_COLLATE")
  new <- "C"
  local({
    scope_collate(new)
    expect_equal(new, Sys.getlocale("LC_COLLATE"))
  })
  expect_equal(current, Sys.getlocale("LC_COLLATE"))
})

test_that("scope_makevars works and resets the Makevars file", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-03"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    scope_makevars(new, path = current)
    expect_equal("CFLAGS=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal("CFLAGS=-03", readLines(current))
})

test_that("scope_makevars changes only the defined variables", {
  current_name <- tempfile()
  current <- c("CFLAGS=-03", "LDFLAGS=-lz")
  writeLines(con = current_name, current, sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    scope_makevars(new, path = current_name)
    expect_equal(c("CFLAGS=-O0", "LDFLAGS=-lz"), readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal(current, readLines(current_name))
})

test_that("scope_makevars works scope alternative assignments", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-03"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    scope_makevars(new, path = current, assignment = "+=")
    expect_equal("CFLAGS+=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal("CFLAGS=-03", readLines(current))
})

test_that("scope_dir works as expected", {
  old <- normalizePath(getwd())
  local({
    scope_dir("..")
    expect_equal(normalizePath(getwd()), normalizePath(file.path(old, "..")))
  })
  expect_equal(normalizePath(getwd()), normalizePath(old))
})

test_that("scope_par works as expected", {
  tmp <- tempfile()

  pdf(tmp)
  on.exit(unlink(tmp), add = TRUE)

  old <- par("pty")
  local({
    scope_par(list(pty = "s"))
    expect_equal(par("pty"), "s")
  })
  expect_equal(par("pty"), old)
  dev.off()
})
