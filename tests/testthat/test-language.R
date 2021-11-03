test_that("can temporary change language", {
  expect_snapshot(error = TRUE, {
    with_language("en", mean[[1]])
    with_language("fr", mean[[1]])
    with_language("es", mean[[1]])
  })
})

test_that("warns if LANG=C", {
  local_envvar(LANG = "C")
  expect_warning(with_language("en", "x"), "Can't change language")
})
