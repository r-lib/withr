test_that("can temporarily change language", {
  skip_if_not(has_nls())

  # `with_language()` doesn't work when locale is set to C. At the
  # same time it's perilous to try and set the locale in a
  # cross-platform way, so just skip these tests in that case.
  # See https://github.com/r-lib/withr/issues/236
  skip_if_c_locale()

  expect_error(with_language("en", mean[[1]]), "not subsettable")
  expect_error(with_language("fr", mean[[1]]), "non indi\u00e7able")
  expect_error(with_language("es", mean[[1]]), "no es subconjunto")

  # can use either _ or -
  expect_error(with_language("pt_BR", mean[[1]]), "não possível dividir")
  expect_error(with_language("pt-BR", mean[[1]]), "não possível dividir")

  # Is correctly reset (#213)
  expect_error(mean[[1]], "not subsettable")
})

test_that("warns if LC_ALL=C", {
  skip_if_not(has_nls())

  local_envvar(LC_ALL = "C")
  expect_warning(with_language("en", "x"), "has no effect")
})

test_that("checks input", {
  expect_snapshot_error(with_language(1, "x"))
})
