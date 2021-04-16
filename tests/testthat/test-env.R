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

test_that("with_envvar respects suffix and prefix", {
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

test_that("local_envvar sets and unsets variables", {

  # Make sure the "set_env_testvar" environment var is not set.
  Sys.unsetenv("set_env_testvar")
  expect_false("set_env_testvar" %in% names(Sys.getenv()))

  # Use local_envvar (which calls set_envvar) to temporarily set it to 1
  local({
    local_envvar(c("set_env_testvar" = 1))
    expect_identical("1", Sys.getenv("set_env_testvar"))
  })

  # set_env_testvar shouldn't stay in the list of environment vars
  expect_false("set_env_testvar" %in% names(Sys.getenv()))
})

test_that("local_envar respects suffix and prefix", {
  nested <- function(op1, op2) {
    local({
      local_envvar(c(A = 1), action = op1)
      local({
        local_envvar(c(A = 2), action = op2)
        Sys.getenv("A")[[1]]
      })
    })
  }

  expect_equal(nested("replace", "suffix"), c("1 2"))
  expect_equal(nested("replace", "prefix"), c("2 1"))
  expect_equal(nested("prefix", "suffix"), c("1 2"))
  expect_equal(nested("prefix", "prefix"), c("2 1"))
  expect_equal(nested("suffix", "suffix"), c("1 2"))
  expect_equal(nested("suffix", "prefix"), c("2 1"))
})

test_that("local_envvar works with null values", {
  Sys.setenv("FOOBAR" = 1)
  local({
    local_envvar("FOOBAR" = NULL)
    expect_false("FOOBAR" %in% names(Sys.getenv()))
  })
})
