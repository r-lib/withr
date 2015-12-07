# Internal *_dev functions ------------------------------------------------

#' @importFrom grDevices dev.cur
#' @include wrap.R
NULL

bmp_dev <- wrap(grDevices::bmp, NULL, grDevices::dev.cur())

cairo_pdf_dev <- wrap(grDevices::cairo_pdf, NULL, grDevices::dev.cur())

cairo_ps_dev <- wrap(grDevices::cairo_ps, NULL, grDevices::dev.cur())

jpeg_dev <- wrap(grDevices::jpeg, antialias <- match.arg(antialias), grDevices::dev.cur())

pdf_dev <- wrap(grDevices::pdf, NULL, grDevices::dev.cur())

png_dev <- wrap(grDevices::png, antialias <- match.arg(antialias), grDevices::dev.cur()) 

postscript_dev <- wrap(grDevices::postscript, NULL, grDevices::dev.cur())

svg_dev <- wrap(grDevices::svg, NULL, grDevices::dev.cur())

tiff_dev <- wrap(grDevices::tiff, NULL, grDevices::dev.cur())

xfig_dev <- wrap(grDevices::xfig, NULL, grDevices::dev.cur())


# User-level with_* fns ---------------------------------------------------

#' Graphics devices
#'
#' Temporarily use a graphics device.
#'
#' @name devices
#' @aliases with_dev with_device
#' @template with
#' @param new \code{[named character]}\cr New graphics device
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
#' @inheritParams grDevices::bmp
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

#' @describeIn devices JPEG device
#' @inheritParams grDevices::jpeg
#' @export
with_jpeg <- with_(jpeg_dev, grDevices::dev.off)

#' @describeIn devices PDF device
#' @inheritParams grDevices::pdf
#' @export
with_pdf <- with_(pdf_dev, grDevices::dev.off)

#' @describeIn devices PNG device
#' @inheritParams grDevices::png
#' @export
with_png <- with_(png_dev, grDevices::dev.off)

#' @describeIn devices POSTSCRIPT device
#' @inheritParams grDevices::postscript
#' @export
with_postscript <- with_(postscript_dev, grDevices::dev.off)

#' @describeIn devices SVG device
#' @inheritParams grDevices::svg
#' @export
with_svg <- with_(svg_dev, grDevices::dev.off)

#' @describeIn devices TIFF device
#' @inheritParams grDevices::tiff
#' @export
with_tiff <- with_(tiff_dev, grDevices::dev.off)

#' @describeIn devices XFIG device
#' @inheritParams grDevices::xfig
#' @export
with_xfig <- with_(xfig_dev, grDevices::dev.off)
