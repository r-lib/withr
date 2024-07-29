needs_cairo <- function(fn) fn %in% c("with_cairo_pdf", "with_cairo_ps", "with_svg", "local_cairo_pdf", "local_cairo_ps", "local_svg")
skip_if_needs_cairo <- function(fn) {
  if (!capabilities("cairo") && needs_cairo(fn)) {
    skip("cairo not available")
  }
}

test_that("with_*device* functions create a plot file", {
  skip_if_not_installed("lattice")
  # A plot
  p <- lattice::xyplot(y ~ x, data.frame(x = -2:2, y = dnorm(-2:2)))

  # A directory to store the plots
  plot_dir <- tempfile("withr-test-plots-")
  dir.create(plot_dir)

  fn_names <- c("with_bmp", "with_jpeg", "with_pdf", "with_png",
    "with_tiff", "with_svg", "with_cairo_pdf", "with_cairo_ps")

  fns <- mget(fn_names, envir = asNamespace("withr"))
  extensions <- c("bmp", "pdf", "ps", "jpg", "pdf", "png", "tiff", "svg", "pdf", "ps")
  for (i in seq_along(fns)) {
    skip_if_needs_cairo(fn_names[[i]])

    filename <- file.path(plot_dir, paste0("test-", fn_names[i], ".", extensions[i]))
    info <- paste0("function = ", fn_names[i], "; filename = ", filename)
    expect_silent(fns[[i]](filename, print(p)))
    expect_true(file.exists(filename), info = info)
    expect_gt(file.info(filename)$size, 0, label = info)
  }

  unlink(plot_dir)
})

test_that("local_device functions create a plot file", {
  skip_if_not_installed("lattice")
  # A plot
  p <- lattice::xyplot(y ~ x, data.frame(x = -2:2, y = dnorm(-2:2)))

  # A directory to store the plots
  plot_dir <- tempfile("withr-test-plots-local-")
  dir.create(plot_dir)

  fn_names <- c("local_bmp", "local_jpeg", "local_pdf", "local_png",
    "local_tiff", "local_svg", "local_cairo_pdf", "local_cairo_ps")

  fns <- mget(fn_names, envir = asNamespace("withr"))
  extensions <- c("bmp", "pdf", "ps", "jpg", "pdf", "png", "tiff", "svg", "pdf", "ps")

  for (i in seq_along(fns)) {
    skip_if_needs_cairo(fn_names[[i]])

    filename <- file.path(plot_dir, paste0("test-", fn_names[i], ".", extensions[i]))
    info <- paste0("function = ", fn_names[i], "; filename = ", filename)
    (function(i) {
      expect_silent(fns[[i]](filename))
      print(p)
    })(i)
    expect_true(file.exists(filename), info = info)
    expect_gt(file.info(filename)$size, 0, label = info)
  }

  unlink(plot_dir)
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
