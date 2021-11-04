test_that("can temporarily change language", {
  skip_if_not(has_nls())

  expect_error(with_language("en", mean[[1]]), "not subsettable")
  expect_error(with_language("fr", mean[[1]]), "non indi\u00e7able")
  expect_error(with_language("es", mean[[1]]), "no es subconjunto")

  # can use either _ or -
  expect_error(with_language("pt_BR", mean[[1]]), "não possível dividir")
  expect_error(with_language("pt-BR", mean[[1]]), "não possível dividir")
})

test_that("warns if LANG=C", {
  skip_if_not(has_nls())

  local_envvar(LANG = "C")
  expect_warning(with_language("en", "x"), "has no effect")
})

test_that("checks input", {
  expect_snapshot_error(with_language(1, "x"))
})
