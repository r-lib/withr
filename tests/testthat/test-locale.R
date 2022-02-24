test_that("with_locale works and resets locales", {
  current <- Sys.getlocale("LC_CTYPE")
  new <- "C"
  with_locale(
    c(LC_CTYPE = new),
    {
      expect_equal(new, Sys.getlocale("LC_CTYPE"))
    }
  )
  expect_equal(current, Sys.getlocale("LC_CTYPE"))
})

test_that("with_locale fails with LC_ALL", {
  expect_error(with_locale(c(LC_ALL = "C"), NULL), "LC_ALL")
})
