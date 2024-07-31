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
  grDevices::bmp(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::cairo_pdf(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::cairo_ps(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::pdf(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::postscript(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::svg(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::tiff(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::xfig(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::png(new, ...)
  defer_dev_close(.local_envir)
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
  grDevices::jpeg(new, ...)
  defer_dev_close(.local_envir)
}

defer_dev_close <- function(frame) {
  cur <- grDevices::dev.cur()
  defer(dev_close(cur), envir = frame)

  # Note that unlike typical `local_` functions we return the current device
  # rather than the old one
  invisible(cur)
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
