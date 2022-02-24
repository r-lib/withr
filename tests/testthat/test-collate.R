test_that("with_collate works and resets collate", {
  current <- Sys.getlocale("LC_COLLATE")
  new <- "C"
  with_collate(
    new,
    {
      expect_equal(new, Sys.getlocale("LC_COLLATE"))
    }
  )
  expect_equal(current, Sys.getlocale("LC_COLLATE"))
})

test_that("with_collate() and with_locale() set LC_COLLATE envvar (#179)", {
  output <- callr::r(
    function() withr::with_collate("en_US", sort(c("A", "a"))),
    env = c(LC_COLLATE = "C")
  )
  expect_equal(output, c("a", "A"))

  output <- callr::r(
    function() withr::with_locale(c(LC_COLLATE = "en_US"), sort(c("A", "a"))),
    env = c(LC_COLLATE = "C")
  )
  expect_equal(output, c("a", "A"))
})
