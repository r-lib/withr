#' @include wrap.R
NULL

# Internal *_dev functions ------------------------------------------------

cairo_pdf_dev <- wrap(grDevices::cairo_pdf, NULL, grDevices::dev.cur())

cairo_ps_dev <- wrap(grDevices::cairo_ps, NULL, grDevices::dev.cur())

pdf_dev <- wrap(grDevices::pdf, NULL, grDevices::dev.cur())

postscript_dev <- wrap(grDevices::postscript, NULL, grDevices::dev.cur())

svg_dev <- wrap(grDevices::svg, NULL, grDevices::dev.cur())

xfig_dev <- wrap(grDevices::xfig, NULL, grDevices::dev.cur())


# These functions arguments differ between unix and windows, so just use ...

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

# User-level with_* fns ---------------------------------------------------

#' Graphics devices
#'
#' Temporarily use a graphics device.
#'
#' @name devices
#' @aliases with_dev with_device
#' @template with
#' @param new \code{[named character]}\cr New graphics device
#' @param ... Additional arguments passed to the graphics device.
#' @seealso \code{\link[grDevices]{Devices}}
#' @examples
#' # dimensions are in inches
#' with_pdf(
#'   c(file = file.path(tempdir(), "test.pdf"), width = 7, height = 5), 
#'   plot(runif(5))
#' )
#' 
#' # dimensions are in pixels
#' with_png(
#'   c(file = file.path(tempdir(), "test.png"), width = 800, height = 600), 
#'   plot(runif(5))
#' )
NULL

#' @describeIn devices BMP device
#' @export
with_bmp <- with_(bmp_dev, grDevices::dev.off)

#' @describeIn devices CAIRO_PDF device
#' @inheritParams grDevices::cairo_pdf
#' @export
with_cairo_pdf <- with_(cairo_pdf_dev, grDevices::dev.off)

#' @describeIn devices CAIRO_PS device
#' @inheritParams grDevices::cairo_ps
#' @export
with_cairo_ps <- with_(cairo_ps_dev, grDevices::dev.off)

#' @describeIn devices PDF device
#' @inheritParams grDevices::pdf
#' @export
with_pdf <- with_(pdf_dev, grDevices::dev.off)

#' @describeIn devices POSTSCRIPT device
#' @inheritParams grDevices::postscript
#' @param command the command to be used for \sQuote{printing}. Defaults
#'   to \code{"default"}, the value of option \code{"printcmd"}. The
#'   length limit is \code{2*PATH_MAX}, typically 8096 bytes on unix systems and
#'   520 bytes on windows.
#' @export
with_postscript <- with_(postscript_dev, grDevices::dev.off)

#' @describeIn devices SVG device
#' @inheritParams grDevices::svg
#' @export
with_svg <- with_(svg_dev, grDevices::dev.off)

#' @describeIn devices TIFF device
#' @export
with_tiff <- with_(tiff_dev, grDevices::dev.off)

#' @describeIn devices XFIG device
#' @inheritParams grDevices::xfig
#' @export
with_xfig <- with_(xfig_dev, grDevices::dev.off)

#' @describeIn devices PNG device
#' @export
with_png <- with_(png_dev, grDevices::dev.off)

#' @describeIn devices JPEG device
#' @export
with_jpeg <- with_(jpeg_dev, grDevices::dev.off)
