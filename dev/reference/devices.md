# Graphics devices

Temporarily use a graphics device.

## Usage

``` r
with_bmp(new, code, ...)

local_bmp(new, ..., .local_envir = parent.frame())

with_cairo_pdf(new, code, ...)

local_cairo_pdf(new, ..., .local_envir = parent.frame())

with_cairo_ps(new, code, ...)

local_cairo_ps(new, ..., .local_envir = parent.frame())

with_pdf(new, code, ...)

local_pdf(new, ..., .local_envir = parent.frame())

with_postscript(new, code, ...)

local_postscript(new, ..., .local_envir = parent.frame())

with_svg(new, code, ...)

local_svg(new, ..., .local_envir = parent.frame())

with_tiff(new, code, ...)

local_tiff(new, ..., .local_envir = parent.frame())

with_xfig(new, code, ...)

local_xfig(new, ..., .local_envir = parent.frame())

with_png(new, code, ...)

local_png(new, ..., .local_envir = parent.frame())

with_jpeg(new, code, ...)

local_jpeg(new, ..., .local_envir = parent.frame())
```

## Arguments

- new:

  `[named character]`  
  New graphics device

- code:

  `[any]`  
  Code to execute in the temporary environment

- ...:

  Additional arguments passed to the graphics device.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

- `with_bmp()` and `local_bmp()` wrap around
  [`grDevices::bmp()`](https://rdrr.io/r/grDevices/png.html).

- `with_cairo_pdf()` and `local_cairo_pdf()` wrap around
  [`grDevices::cairo_pdf()`](https://rdrr.io/r/grDevices/cairo.html).

- `with_cairo_ps()` and `local_cairo_ps()` wrap around
  [`grDevices::cairo_ps()`](https://rdrr.io/r/grDevices/cairo.html).

- `with_pdf()` and `local_pdf()` wrap around
  [`grDevices::pdf()`](https://rdrr.io/r/grDevices/pdf.html).

- `with_postscript()` and `local_postscript()` wrap around
  [`grDevices::postscript()`](https://rdrr.io/r/grDevices/postscript.html).

- `with_svg()` and `local_svg()` wrap around
  [`grDevices::svg()`](https://rdrr.io/r/grDevices/cairo.html).

- `with_tiff()` and `local_tiff()` wrap around
  [`grDevices::tiff()`](https://rdrr.io/r/grDevices/png.html).

- `with_xfig()` and `local_xfig()` wrap around
  [`grDevices::xfig()`](https://rdrr.io/r/grDevices/grDevices-defunct.html).

- `with_png()` and `local_png()` wrap around
  [`grDevices::png()`](https://rdrr.io/r/grDevices/png.html).

- `with_jpeg()` and `local_jpeg()` wrap around
  [`grDevices::jpeg()`](https://rdrr.io/r/grDevices/png.html).

## Functions

- `with_bmp()`: BMP device

- `with_cairo_pdf()`: CAIRO_PDF device

- `with_cairo_ps()`: CAIRO_PS device

- `with_pdf()`: PDF device

- `with_postscript()`: POSTSCRIPT device

- `with_svg()`: SVG device

- `with_tiff()`: TIFF device

- `with_xfig()`: XFIG device

- `with_png()`: PNG device

- `with_jpeg()`: JPEG device

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`Devices`](https://rdrr.io/r/grDevices/Devices.html)

## Examples

``` r
# dimensions are in inches
with_pdf(file.path(tempdir(), "test.pdf"), width = 7, height = 5,
  plot(runif(5))
)

# dimensions are in pixels
with_png(file.path(tempdir(), "test.png"), width = 800, height = 600,
  plot(runif(5))
)
```
