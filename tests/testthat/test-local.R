test_that("local_options works", {
  expect_false(getOption("scipen") == 999)
  local({
    local_options(c(scipen=999))
    expect_equal(getOption("scipen"), 999)
  })
  expect_false(getOption("scipen") == 999)

  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
  local({
    local_options(c(zyxxyzyx="qwrbbl"))
    expect_equal(getOption("zyxxyzyx"), "qwrbbl")
  })
  expect_false(identical(getOption("zyxxyzyx"), "qwrbbl"))
})

test_that("local_options(error = ) works", {
    f <- function(...) 1
    oopt <- options("error")
    on.exit(options(oopt))
    options(error = f)
    local({
        local_options(list(error = function(...) 2))
        expect_identical(2, eval(getOption("error")))
    })
    expect_identical(1, eval(getOption("error")))
})

test_that("local_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  local({
    local_libpaths(new_lib)
    expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]]))
  })
  expect_equal(lib, .libPaths())
})

test_that("local_temp_libpaths works and resets library", {
  lib <- .libPaths()
  local({
    local_temp_libpaths()
    expect_equal(.libPaths()[-1], lib)
  })
  expect_equal(lib, .libPaths())
})

test_that("local_ works", {
  res <- NULL
  set <- function(new) {
    res <<- c(res, 1L)
  }
  reset <- function(old) {
    res <<- c(res, 3L)
  }
  local_res <- local_(set, reset)
  local({
    local_res(NULL)
    res <<- c(res, 2L)
  })
  expect_equal(res, 1L:3L)
})

test_that("local_ works on functions without arguments", {
  res <- NULL
  set <- function() {
    res <<- c(res, 1L)
  }
  reset <- function(x) {
    res <<- c(res, 3L)
  }
  local_res <- local_(set, reset)
  local({
    local_res()
    res <<- c(res, 2L)
  })
  expect_equal(res, 1L:3L)
})

test_that("local_path works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path)
    expect_equal(normalizePath(new_path), head(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("local_path with suffix action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path, action = "suffix")
    expect_equal(normalizePath(new_path), tail(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("local_path with replace action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path, action = "replace")
    expect_equal(normalizePath(new_path), get_path())
    expect_equal(length(get_path()), 1L)
  })
  expect_equal(current, get_path())
})

test_that("local_libpaths works and resets library", {
  lib <- .libPaths()
  new_lib <- "."
  local({
    local_libpaths(new_lib)
    expect_equal(normalizePath(new_lib), normalizePath(.libPaths()[[1L]], mustWork = FALSE))
  })
  expect_equal(lib, .libPaths())
})

test_that("local_locale works and resets locales", {
  current <- Sys.getlocale("LC_CTYPE")
  new <- "C"
  local({
    local_locale(c(LC_CTYPE = new))
    expect_equal(new, Sys.getlocale("LC_CTYPE"))
  })
  expect_equal(current, Sys.getlocale("LC_CTYPE"))
})

test_that("local_locale fails with LC_ALL", {
  local({
    expect_error(local_locale(c(LC_ALL = "C")), "LC_ALL")
  })
})

test_that("local_collate works and resets collate", {
  current <- Sys.getlocale("LC_COLLATE")
  new <- "C"
  local({
    local_collate(new)
    expect_equal(new, Sys.getlocale("LC_COLLATE"))
  })
  expect_equal(current, Sys.getlocale("LC_COLLATE"))
})

test_that("local_makevars works and resets the Makevars file", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-03"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    local_makevars(new, .path = current)
    expect_equal("CFLAGS=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal("CFLAGS=-03", readLines(current))
})

test_that("local_makevars changes only the defined variables", {
  current_name <- tempfile()
  current <- c("CFLAGS=-03", "LDFLAGS=-lz")
  writeLines(con = current_name, current, sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    local_makevars(new, .path = current_name)
    expect_equal(c("CFLAGS=-O0", "LDFLAGS=-lz"), readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal(current, readLines(current_name))
})

test_that("local_makevars works with alternative assignments", {
  current <- tempfile()
  writeLines(con = current, c("CFLAGS=-03"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    local_makevars(new, .path = current, .assignment = "+=")
    expect_equal("CFLAGS+=-O0", readLines(Sys.getenv("R_MAKEVARS_USER")))
  })
  expect_equal("CFLAGS=-03", readLines(current))
})

test_that("local_makevars uses the existing R_MAKEVARS_USER by default", {
  tf <- tempfile()
  local_envvar("R_MAKEVARS_USER" = tf)
  on.exit(unlink(tf))
  writeLines(con = tf, c("CFLAGS=-O3", "CXXFLAGS=-O3"), sep = "\n")
  new <- c(CFLAGS = "-O0")
  local({
    local_makevars(new)
    expect_equal(readLines(Sys.getenv("R_MAKEVARS_USER")), c("CFLAGS=-O0", "CXXFLAGS=-O3"))
  })
  expect_equal(readLines(tf), c("CFLAGS=-O3", "CXXFLAGS=-O3"))
})

test_that("local_dir works as expected", {
  old <- normalizePath(getwd())
  local({
    local_dir("..")
    expect_equal(normalizePath(getwd()), normalizePath(file.path(old, "..")))
  })
  expect_equal(normalizePath(getwd()), normalizePath(old))
})

test_that("local_par works as expected", {
  tmp <- tempfile()

  pdf(tmp)
  on.exit(unlink(tmp), add = TRUE)

  old <- par("pty")
  local({
    local_par(list(pty = "s"))
    expect_equal(par("pty"), "s")
  })
  expect_equal(par("pty"), old)
  dev.off()
})

test_that("supplying a getter to `local_()` shields against early exits", {
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
  my_local_unsafe <- withr::local_(my_set)
  my_local_safe <- withr::local_(my_set, get = my_get)

  my_with_unsafe <- function(new, expr) {
    my_local_unsafe(new)
    expr
  }
  my_with_safe <- function(new, expr) {
    my_local_safe(new)
    expr
  }

  expect_safe_and_unsafe_unwinding(
    state,
    my_with_unsafe,
    my_with_safe
  )


  # `...` code path

  state <- new.env()
  my_local_unsafe <- withr::local_(my_set, dots = TRUE)
  my_local_safe <- withr::local_(my_set, get = my_get, dots = TRUE)

  my_with_unsafe <- function(new, expr) {
    my_local_unsafe(new)
    expr
  }
  my_with_safe <- function(new, expr) {
    my_local_safe(new)
    expr
  }

  expect_safe_and_unsafe_unwinding(
    state,
    my_with_unsafe,
    my_with_safe
  )
})
