test_that("works without withr attached", {

  expect_no_error(callr::r(
    function() {
      get_options <- function(...) {
        do.call(options, as.list(names(list(...))))
      }
      set_options <- function(...) {
        options(...)
      }

      withr::local_(set_options, new = FALSE)(x = 1)
      withr::local_(set_options, get = get_options, new = FALSE)(y = 2)
    }
  ))

})
