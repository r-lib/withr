needs_cairo <- function(fn) fn %in% c("with_cairo_pdf", "with_cairo_ps", "with_svg", "local_cairo_pdf", "local_cairo_ps", "local_svg")
skip_if_needs_cairo <- function(fn) {
  if (!capabilities("cairo") && needs_cairo(fn)) {
    skip("cairo not available")
  }
}

test_that("with_*device* functions create a plot file", {
  fn_names <- c("with_bmp", "with_jpeg", "with_pdf", "with_png",
    "with_tiff", "with_svg", "with_cairo_pdf", "with_cairo_ps")

  fns <- mget(fn_names, envir = asNamespace("withr"))
  for (i in seq_along(fns)) {
    skip_if_needs_cairo(fn_names[[i]])

    filename <- withr::local_tempfile()
    expect_no_error(fns[[i]](filename, plot(1)))
    expect_true(file.exists(filename), info = fn_names[[i]])
    expect_gt(file.info(filename)$size, 0, label = fn_names[[i]])
  }
})

test_that("local_device functions create a plot file", {
  fn_names <- c("local_bmp", "local_jpeg", "local_pdf", "local_png",
    "local_tiff", "local_svg", "local_cairo_pdf", "local_cairo_ps")

  fns <- mget(fn_names, envir = asNamespace("withr"))
  for (i in seq_along(fns)) {
    skip_if_needs_cairo(fn_names[[i]])

    filename <- withr::local_tempfile()
    local({
      expect_no_error(fns[[i]](filename))
      plot(1)
    })
    expect_true(file.exists(filename), info = fn_names[[i]])
    expect_gt(file.info(filename)$size, 0, label = fn_names[[i]])
  }
})

test_that("multiple devices closed in correct order", {
  dev1 <- local_pdf(tempfile())

  local({
    dev2 <- local_pdf(tempfile())

    local(withr::local_pdf(tempfile()))
    expect_equal(dev.cur(), dev2)
  })

  expect_equal(dev.cur(), dev1)
})

test_that("local devices restore the previously active device (#295)", {
  previous <- local_pdf(NULL)
  local_pdf(NULL)
  dev.set(previous)
  devices <- dev.list()

  local({
    temporary <- local_pdf(NULL)
    expect_identical(dev.cur(), temporary)
  })

  expect_identical(dev.cur(), previous)
  expect_identical(dev.list(), devices)
})

test_that("device cleanup tolerates devices closed within the scope", {
  previous <- local_pdf(NULL)
  other <- local_pdf(NULL)
  dev.set(previous)

  local({
    temporary <- local_pdf(NULL)
    dev.off(temporary)
    dev.set(other)
  })
  expect_identical(dev.cur(), previous)

  local({
    local_pdf(NULL)
    dev.off(previous)
  })
  expect_identical(dev.cur(), other)
})

test_that("device cleanup leaves a different device in a reused slot open", {
  path <- local_tempfile(fileext = ".ps")
  previous <- local_pdf(NULL)

  replacement <- local({
    temporary <- local_pdf(NULL)
    dev.off(temporary)
    grDevices::postscript(path)
    expect_identical(unname(dev.cur()), unname(temporary))
    dev.cur()
  })
  defer(if (replacement %in% dev.list()) dev.off(replacement))

  expect_true(replacement %in% dev.list())
  expect_identical(dev.cur(), previous)
})

test_that("opening a local device preserves argument matching", {
  device <- suppressWarnings(local_pdf(NULL, o = FALSE))
  expect_identical(dev.cur(), device)
})
