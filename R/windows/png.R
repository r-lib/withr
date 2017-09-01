png_dev <- wrap(grDevices::png, antialias <- match.arg(antialias), grDevices::dev.cur())
jpeg_dev <- wrap(grDevices::jpeg, antialias <- match.arg(antialias), grDevices::dev.cur())
bmp_dev <- wrap(grDevices::bmp, antialias <- match.arg(antialias), grDevices::dev.cur())
