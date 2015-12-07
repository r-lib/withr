context("Setup")

# A plot
p <- lattice::xyplot(y ~ x, data.frame(x = -2:2, y = dnorm(-2:2)))

# A directory to store the plots
plot_dir <- tempfile("withr-test-plots-")
dir.create(plot_dir)

context("Test with_*device* fns")

test_that("with_*device* fns create a plot file", {
  fn_names <- c(
    "with_bmp", "with_cairo_pdf", "with_cairo_ps", "with_jpeg", 
    "with_pdf", "with_png", "with_svg", "with_tiff", "with_xfig"
  )
  fns <- mget(fn_names, envir = as.environment("package:withr"))
  extensions <- c("bmp", "pdf", "ps", "jpg", "pdf", "png", "svg", "tiff", "xfig")
  for(i in seq_along(fns))
  {
    filename <- file.path(plot_dir, paste0("test-", fn_names[i], ".", extensions[i]))
    info <- paste0("function = ", fn_names[i], "; filename = ", filename)
    if(fn_names[i] == "with_xfig")
    {
      # grDevices::xfig weirdly gives a warning with the default inputs
      expect_warning(
        fns[[i]](filename, print(p)),
        "will only return the last plot"
      )
    } else
    {
      expect_silent(fns[[i]](filename, print(p)))
    }
    expect_true(file.exists(filename), info = info)
    expect_more_than(file.size(filename), 0, info = info)
  }
})


context("Teardown")

rm(p)

unlink(file.path(plot_dir, dir(plot_dir)))
