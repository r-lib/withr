test_that("can temporary change language", {
  expect_error(with_language("en", mean[[1]]), "not subsettable")
  expect_error(with_language("fr", mean[[1]]), "non indi\u00e7able")
  expect_error(with_language("es", mean[[1]]), "no es subconjunto")
})

test_that("warns if LANG=C", {
  local_envvar(LANG = "C")
  expect_warning(with_language("en", "x"), "Can't change language")
})
