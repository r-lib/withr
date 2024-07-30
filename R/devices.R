#' Graphics devices
#'
#' Temporarily use a graphics device.
#'
#' @name devices
#' @aliases with_dev with_device
#' @template with
#' @param new \code{[named character]}\cr New graphics device
#' @param ... Additional arguments passed to the graphics device.
#' @param .local_envir `[environment]`\cr The environment to use for scoping.
#' @details
#' * `with_bmp()` and `local_bmp()` wrap around [grDevices::bmp()].
#' * `with_cairo_pdf()` and `local_cairo_pdf()` wrap around [grDevices::cairo_pdf()].
#' * `with_cairo_ps()` and `local_cairo_ps()` wrap around [grDevices::cairo_ps()].
#' * `with_pdf()` and `local_pdf()` wrap around [grDevices::pdf()].
#' * `with_postscript()` and `local_postscript()` wrap around [grDevices::postscript()].
#' * `with_svg()` and `local_svg()` wrap around [grDevices::svg()].
#' * `with_tiff()` and `local_tiff()` wrap around [grDevices::tiff()].
#' * `with_xfig()` and `local_xfig()` wrap around [grDevices::xfig()].
#' * `with_png()` and `local_png()` wrap around [grDevices::png()].
#' * `with_jpeg()` and `local_jpeg()` wrap around [grDevices::jpeg()].
#' 
#' @seealso \code{\link[grDevices]{Devices}}
#' @examples
#' # dimensions are in inches
#' with_pdf(file.path(tempdir(), "test.pdf"), width = 7, height = 5,
#'   plot(runif(5))
#' )
#'
#' # dimensions are in pixels
#' with_png(file.path(tempdir(), "test.png"), width = 800, height = 600,
#'   plot(runif(5))
#' )
NULL

#' @describeIn devices BMP device
#' @export
with_bmp <- function(new, code, ...) {
  local_bmp(new, ...)
  code
}

#' @rdname devices
#' @export
local_bmp <- function(new, ..., .local_envir = parent.frame()) {
  old <- bmp_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices CAIRO_PDF device
#' @export
with_cairo_pdf <- function(new, code, ...) {
  local_cairo_pdf(new, ...)
  code
}

#' @rdname devices
#' @export
local_cairo_pdf <- function(new, ..., .local_envir = parent.frame()) {
  old <- cairo_pdf_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices CAIRO_PS device
#' @export
with_cairo_ps <- function(new, code, ...) {
  local_cairo_ps(new, ...)
  code
}

#' @rdname devices
#' @export
local_cairo_ps <- function(new, ..., .local_envir = parent.frame()) {
  old <- cairo_ps_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices PDF device
#' @export
with_pdf <- function(new, code, ...) {
  local_pdf(new, ...)
  code
}

#' @rdname devices
#' @export
local_pdf <- function(new, ..., .local_envir = parent.frame()) {
  old <- pdf_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices POSTSCRIPT device
#' @export
with_postscript <- function(new, code, ...) {
  local_postscript(new, ...)
  code
}

#' @rdname devices
#' @export
local_postscript <- function(new, ..., .local_envir = parent.frame()) {
  old <- postscript_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices SVG device
#' @export
with_svg <- function(new, code, ...) {
  local_svg(new, ...)
  code
}

#' @rdname devices
#' @export
local_svg <- function(new, ..., .local_envir = parent.frame()) {
  old <- svg_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices TIFF device
#' @export
with_tiff <- function(new, code, ...) {
  local_tiff(new, ...)
  code
}

#' @rdname devices
#' @export
local_tiff <- function(new, ..., .local_envir = parent.frame()) {
  old <- tiff_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices XFIG device
#' @export
with_xfig <- function(new, code, ...) {
  local_xfig(new, ...)
  code
}

#' @rdname devices
#' @export
local_xfig <- function(new, ..., .local_envir = parent.frame()) {
  old <- xfig_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices PNG device
#' @export
with_png <- function(new, code, ...) {
  local_png(new, ...)
  code
}

#' @rdname devices
#' @export
local_png <- function(new, ..., .local_envir = parent.frame()) {
  old <- png_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}

#' @describeIn devices JPEG device
#' @export
with_jpeg <- function(new, code, ...) {
  local_jpeg(new, ...)
  code
}

#' @rdname devices
#' @export
local_jpeg <- function(new, ..., .local_envir = parent.frame()) {
  old <- jpeg_dev(new, ...)
  defer(dev_close(old), envir = .local_envir)
  invisible(old)
}


# Internal *_dev functions ------------------------------------------------

pdf_dev <- function(filename, ...) {
  grDevices::pdf(file = filename, ...)
  grDevices::dev.cur()
}

postscript_dev <- function(filename, ...) {
  grDevices::postscript(file = filename, ...)
  grDevices::dev.cur()
}

svg_dev <- function(filename, ...) {
  grDevices::svg(filename = filename, ...)
  grDevices::dev.cur()
}

xfig_dev <- function(filename, ...) {
  grDevices::xfig(file = filename, ...)
  grDevices::dev.cur()
}

cairo_pdf_dev <- function(filename, ...) {
  grDevices::cairo_pdf(filename = filename, ...)
  grDevices::dev.cur()
}

cairo_ps_dev <- function(filename, ...) {
  grDevices::cairo_ps(filename = filename, ...)
  grDevices::dev.cur()
}

bmp_dev <- function(filename, ...) {
  grDevices::bmp(filename = filename, ...)
  grDevices::dev.cur()
}

tiff_dev <- function(filename, ...) {
  grDevices::tiff(filename = filename, ...)
  grDevices::dev.cur()
}

png_dev <- function(filename, ...) {
  grDevices::png(filename = filename, ...)
  grDevices::dev.cur()
}

jpeg_dev <- function(filename, ...) {
  grDevices::jpeg(filename = filename, ...)
  grDevices::dev.cur()
}

dev_close <- function(which) {
  prev <- grDevices::dev.prev(which)
  grDevices::dev.off(which)

  # No devices active
  if (prev != which) {
    grDevices::dev.set(prev)
  }

  prev
}
