context("With")

test_that("with_envvar sets and unsets variables", {

  # Make sure the "set_env_testvar" environment var is not set.
  Sys.unsetenv("set_env_testvar")
  expect_false("set_env_testvar" %in% names(Sys.getenv()))

  # Use with_envvar (which calls set_envvar) to temporarily set it to 1
  expect_identical("1", with_envvar(c("set_env_testvar" = 1),
    Sys.getenv("set_env_testvar")))

  # set_env_testvar shouldn't stay in the list of environment vars
  expect_false("set_env_testvar" %in% names(Sys.getenv()))
})

test_that("with_envar respects suffix and prefix", {
  nested <- function(op1, op2) {
    with_envvar(c(A = 1), action = op1,
      with_envvar(c(A = 2), action = op2,
        Sys.getenv("A")[[1]]
      )
    )
  }

  expect_equal(nested("replace", "suffix"), c("1 2"))
  expect_equal(nested("replace", "prefix"), c("2 1"))
  expect_equal(nested("prefix", "suffix"), c("1 2"))
  expect_equal(nested("prefix", "prefix"), c("2 1"))
  expect_equal(nested("suffix", "suffix"), c("1 2"))
  expect_equal(nested("suffix", "prefix"), c("2 1"))
})

test_that("with_options works", {
  expect_that(getOption("scipen"), not(equals(999)))
  expect_equal(with_options(c(scipen=999), getOption("scipen")), 999)
  expect_that(getOption("scipen"), not(equals(999)))

  expect_that(getOption("zyxxyzyx"), not(equals("qwrbbl")))
  expect_equal(with_options(c(zyxxyzyx="qwrbbl"), getOption("zyxxyzyx")), "qwrbbl")
  expect_that(getOption("zyxxyzyx"), not(equals("qwrbbl")))
})

test_that("with_collate works", {
  # C is really one of the few locales we can be sure will be everywhere
  if (Sys.getlocale("LC_COLLATE") != "C") {
    expect_that(Sys.getlocale("LC_COLLATE"), not(equals("C")))
    expect_equal(with_collate("C", Sys.getlocale("LC_COLLATE")), "C")
    expect_that(Sys.getlocale("LC_COLLATE"), not(equals("C")))
  }
})

#context("with_makevars")
#test_that("with_makevars correctly matches only exact variable name", {
  #f1 <- tempfile()
  #writeLines(c("FCFLAGS=1"), con = f1)

  #with_makevars(c(CFLAGS = "test"), {

    #}
  #set_makevars(c(CFLAGS="test"), f1)
  #expect_equal(c("FCFLAGS=1", "CFLAGS=test"), readLines(f1))
  #expect_true(file.exists(backup_name(f1)))

  #reset_makevars(f1)
  #expect_false(file.exists(backup_name(f1)))
  #expect_equal("FCFLAGS=1", readLines(f1))
#})

#test_that("makevars correctly ignores commented lines", {
  #f1 <- "Makevars"
  #writeLines(c("# CFLAGS=1"), con = f1)
  #set_makevars(c(CFLAGS="test"), f1)
  #expect_equal(c("# CFLAGS=1", "CFLAGS=test"), readLines(f1))
  #expect_true(file.exists(backup_name(f1)))

  #reset_makevars(f1)
  #expect_false(file.exists(backup_name(f1)))
  #expect_equal("# CFLAGS=1", readLines(f1))

  #unlink(f1)
#})

#test_that("makevars does nothing if the file will not change", {
  #f1 <- "Makevars"
  #writeLines(c("CFLAGS=1"), con = f1)
  #set_makevars(c(CFLAGS="1"), f1)

  #expect_equal(c("CFLAGS=1"), readLines(f1))
  #expect_false(file.exists(backup_name(f1)))

  #unlink(f1)
#})

#test_that("makevars errors if more than one match is found", {
  #f1 <- "Makevars"
  #writeLines(c("CFLAGS=1", "CFLAGS=2"), con = f1)
  #expect_error(set_makevars(c(CFLAGS="1"), f1), "Multiple results")

  #unlink(f1)
#})
#test_that("makevars handles the case without a Makevars file", {

  #f1 <- "Makevars"
  #set_makevars(c(CFLAGS="1"), f1)
  #expect_equal(c("CFLAGS=1"), readLines(f1))

  #reset_makevars(f1)
  #expect_false(file.exists(f1))
#})
