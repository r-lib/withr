expect_no_output <- function(...) {
  testthat::expect_output(..., regexp = NA)
}

expect_safe_and_unsafe_unwinding <- function(state,
                                             with_unsafe,
                                             with_safe) {
  early_exit <- function(expr) {
    tryCatch(expr, my_cnd = identity)
  }

  with_unsafe(list("var" = "foo"), NULL)
  expect_null(state[["var"]])

  with_safe(list("var" = "foo"), NULL)
  expect_null(state[["var"]])

  early_exit(with_safe(list("var" = "foo"), NULL))
  expect_null(state[["var"]])

  # Problematic behaviour with unsafe variant
  early_exit(with_unsafe(list("var" = "foo"), NULL))
  expect_equal(state[["var"]], "foo")
}

en_locale_or_skip <- function() {
  tryCatch(
    error = function(...) skip("Can't set locale"),
    warning = function(...) skip("Can't set locale"),
    with_collate("en_US.UTF-8", NULL)
  )
  "en_US.UTF-8"
}

skip_if_cannot_knit <- function() {
  skip_if_not_installed("knitr")
  skip_if_not_installed("rmarkdown")
  skip_if(!rmarkdown::pandoc_available())
}

# Need to also specify `LC_ALL` because `LANGUAGE` is ignored when
# `LANG` is set (here via `LC_ALL`) to `C` or `C.UTF-8`
with_lang <- function(lc, language, expr) {
  withr::local_envvar(c(LC_ALL = lc))
  withr::local_language(language)
  expr
}
