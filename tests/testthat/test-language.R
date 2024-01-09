test_that("can temporarily change language", {
  skip_if_not(has_nls())

  expect_error(with_lang("en_GB", "en", mean[[1]]), "not subsettable")
  expect_error(with_lang("fr_FR", "fr", mean[[1]]), "non indi\u00e7able")
  expect_error(with_lang("es_ES", "es", mean[[1]]), "no es subconjunto")

  # can use either _ or -
  expect_error(with_lang("pt_BR", "pt_BR", mean[[1]]), "não possível dividir")
  expect_error(with_lang("pt_BR", "pt-BR", mean[[1]]), "não possível dividir")

  # Is correctly reset (#213)
  expect_error(mean[[1]], "not subsettable")
})

test_that("warns if LANG=C", {
  skip_if_not(has_nls())

  local_envvar(LANG = "C")
  expect_warning(with_language("en", "x"), "has no effect")
})

test_that("checks input", {
  expect_snapshot_error(with_language(1, "x"))
})
