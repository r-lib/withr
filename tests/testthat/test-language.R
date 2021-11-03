test_that("can temporary change language", {
  expect_snapshot(error = TRUE, {
    with_language("en", mean[[1]])
    with_language("fr", mean[[1]])
    with_language("es", mean[[1]])
  })
})
