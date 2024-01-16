test_that("`frame_exits()` and `frame_clear_exits()`", {
  on.exit("foo")
  expect_equal(frame_exits(), list("foo"))

  on.exit("bar", add = TRUE)
  expect_equal(frame_exits(), list("foo", "bar"))

  on.exit("baz", add = TRUE, after = FALSE)
  expect_equal(frame_exits(), list("baz", "foo", "bar"))

  frame_clear_exits()
  expect_equal(frame_exits(), list())
})

test_that("deferred_run() displays how many expressions were run", {
  expect_snapshot(deferred_run())

  expect_snapshot(local({
    local_tempfile()
    local_tempfile()
    deferred_run()
  }))

  expect_snapshot(expect_error(local({
    local_tempfile()
    defer(stop("foo"))
    local_tempfile()
    deferred_run()
  })))
})

test_that("can't run `deferred_run()` in knitr", {
    skip_if_cannot_knit()

    rmd <- local_tempfile(fileext = ".Rmd")
    out <- local_tempfile(fileext = ".md")
    writeLines(rmd, text = "
```{r}
withr::deferred_run()
```
```{r}
defer(writeLines('1'))
writeLines('2')
defer(writeLines('3'))
```
```{r}
writeLines('4')
withr::deferred_run()
```
")

    knitr::knit(rmd, out, quiet = TRUE)

    expect_snapshot({
      writeLines(readLines(out))
    })
})
