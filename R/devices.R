# Internal *_dev functions ------------------------------------------------

#' @include wrap.R
NULL

bmp_dev <- wrap(grDevices::bmp, antialias <- match.arg(antialias), grDevices::dev.cur())

cairo_pdf_dev <- wrap(grDevices::cairo_pdf, NULL, grDevices::dev.cur())

cairo_ps_dev <- wrap(grDevices::cairo_ps, antialias <- match.arg(antialias), grDevices::dev.cur())

jpeg_dev <- wrap(grDevices::jpeg, antialias <- match.arg(antialias), grDevices::dev.cur())

pdf_dev <- wrap(grDevices::pdf, NULL, grDevices::dev.cur())

png_dev <- wrap(grDevices::png, antialias <- match.arg(antialias), grDevices::dev.cur()) 

postscript_dev <- wrap(grDevices::postscript, NULL, grDevices::dev.cur())

svg_dev <- wrap(grDevices::svg, NULL, grDevices::dev.cur())

tiff_dev <- wrap(grDevices::tiff, antialias <- match.arg(antialias), grDevices::dev.cur())

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

# Cannot @inheritParams grDevices::pdf due to differing docs across OSes
#' @describeIn devices PDF device
#' @param title title string to embed as the \code{/Title} field in the file. 
#' Defaults to \code{"R Graphics Output"}.
#' @param fonts a character vector specifying R graphics font family names for 
#' additional fonts which will be included in the PDF file. Defaults to 
#' \code{NULL}.
#' @param version a string describing the PDF version that will be required to 
#' view the output. This is a minimum, and will be increased (with a warning) if 
#' necessary. Defaults to "1.4", but see 'Details' section of 
#' \code{\link[grDevices]{pdf}}.
#' @param colormodel a character string describing the color model: currently 
#' allowed values are "srgb", "gray" (or "grey") and "cmyk". Defaults to "srgb". 
#' See section 'Color models' of \code{\link[grDevices]{pdf}}.
#' @param useDingbats logical. Should small circles be rendered via the Dingbats
#' font? Defaults to \code{TRUE}, which produces smaller and better output. 
#' Setting this to \code{FALSE} can work around font display problems in broken 
#' PDF viewers: although this font is one of the 14 guaranteed to be available 
#' in all PDF viewers, that guarantee is not always honoured.
#' @param useKerning logical. Should kerning corrections be included in setting 
#' text and calculating string widths? Defaults to \code{TRUE}.
#' @param fillOddEven logical controlling the polygon fill mode: see polygon for 
#' details. Defaults to \code{FALSE}.
#' @param compress logical. Should PDF streams be generated with Flate 
#' compression? Defaults to \code{TRUE}.
#' @export
with_pdf <- with_(pdf_dev, grDevices::dev.off)

#' @describeIn devices PNG device
#' @inheritParams grDevices::png
#' @export
with_png <- with_(png_dev, grDevices::dev.off)

# Cannot @inheritParams grDevices::postscript due to differing docs across OSes
#' @describeIn devices POSTSCRIPT device
#' @param print.it logical: should the file be printed when the device is 
#' closed? (This only applies if \code{file} is a real file name.) Defaults to 
#' \code{FALSE}.
#' @param command the command to be used for ‘printing’. Defaults to 
#' \code{"default"}, the value of option \code{"printcmd"}. The length limit is 
#' \code{2*PATH_MAX}, 520 bytes on Windows and 8096 bytes on Unix-alikes.
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
