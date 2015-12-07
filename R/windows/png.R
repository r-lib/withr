png_dev <- wrap(grDevices::png, NULL, grDevices::dev.cur())
jpeg_dev <- wrap(grDevices::jpeg, NULL, grDevices::dev.cur())

#' @describeIn devices PNG device
#' @inheritParams grDevices::png
#' @export
with_png <- with_(png_dev, grDevices::dev.off)

#' @describeIn devices JPEG device
#' @inheritParams grDevices::jpeg
#' @export
with_jpeg <- with_(jpeg_dev, grDevices::dev.off)
