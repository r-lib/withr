# Internal *_dev functions ------------------------------------------------

#' @importFrom grDevices dev.cur
#' @include wrap.R
NULL

#' @importFrom grDevices bmp
bmp_dev <- wrap(bmp, NULL, dev.cur())

#' @importFrom grDevices cairo_pdf
cairo_pdf_dev <- wrap(cairo_pdf, NULL, dev.cur())

#' @importFrom grDevices cairo_ps
cairo_ps_dev <- wrap(cairo_ps, NULL, dev.cur())

#' @importFrom grDevices jpeg
jpeg_dev <- wrap(jpeg, NULL, dev.cur())

#' @importFrom grDevices pdf
pdf_dev <- wrap(pdf, NULL, dev.cur())

#' @importFrom grDevices png
png_dev <- wrap(png, NULL, dev.cur())

#' @importFrom grDevices postscript
postscript_dev <- wrap(postscript, NULL, dev.cur())

#' @importFrom grDevices svg
svg_dev <- wrap(svg, NULL, dev.cur())

#' @importFrom grDevices tiff
tiff_dev <- wrap(tiff, NULL, dev.cur())

#' @importFrom grDevices xfig
xfig_dev <- wrap(xfig, NULL, dev.cur())


# User-level with_* fns ---------------------------------------------------

#' Graphics devices
#'
#' Temporarily use a graphics device.
#'
#' @template with
#' @param new \code{[named character]}\cr New graphics device
#' @seealso \code{\link[grDevices]{Devices}}
#' @examples
#' with_pdf(c(file = "test.pdf", width = 7, height = 5), plot(runif(5)))
#' @aliases with_dev with_device
#' @importFrom grDevices dev.off
#' @export
with_bmp <- with_(bmp_dev, dev.off)

#' @rdname with_bmp
#' @export
with_cairo_pdf <- with_(cairo_pdf_dev, dev.off)

#' @rdname with_bmp
#' @export
with_cairo_ps <- with_(cairo_ps_dev, dev.off)

#' @rdname with_bmp
#' @export
with_jpeg <- with_(jpeg_dev, dev.off)

#' @rdname with_bmp
#' @export
with_pdf <- with_(pdf_dev, dev.off)

#' @rdname with_bmp
#' @export
with_png <- with_(png_dev, dev.off)

#' @rdname with_bmp
#' @export
with_postscript <- with_(postscript_dev, dev.off)

#' @rdname with_bmp
#' @export
with_svg <- with_(svg_dev, dev.off)

#' @rdname with_bmp
#' @export
with_tiff <- with_(tiff_dev, dev.off)

#' @rdname with_bmp
#' @export
with_xfig <- with_(xfig_dev, dev.off)
