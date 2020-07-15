test_that("with_seed works as expected", {
  expect_identical(
    with_preserve_seed(runif(10)),
    runif(10))
  expect_identical(
    with_preserve_seed(runif(10)),
    with_preserve_seed(runif(10)))
  expect_identical(
    with_seed(1, runif(10)),
    with_seed(1, runif(10)))
  expect_false(with_seed(1, runif(1)) == runif(1))
  expect_false(
    with_seed(sample.int(.Machine$integer.max, 1), runif(1)) ==
      with_seed(sample.int(.Machine$integer.max, 1), runif(1))
  )
})

test_that("local_seed works as expected", {
  x <- numeric()
  y <- numeric()
  local({
    local_preserve_seed()
    x <<- runif(10)
  })
  expect_identical(x, runif(10))

  local({
    local_preserve_seed()
    x <<- runif(10)
  })

  local({
    local_preserve_seed()
    y <<- runif(10)
  })

  expect_identical(x, y)

  local({
    local_seed(1)
    x <<- runif(10)
  })

  local({
    local_seed(1)
    y <<- runif(10)
  })

  expect_identical(x, y)

  local({
    local_seed(1)
    x <<- runif(1)
  })
  expect_false(x == runif(1))

  x_seed <- sample.int(.Machine$integer.max, 1)
  y_seed <- sample.int(.Machine$integer.max, 1)

  local({
    local_seed(x_seed)
    x <<- runif(1)
  })

  local({
    local_seed(y_seed)
    y <<- runif(1)
  })
  expect_false(x == y)
})

test_that("with_preserve_seed preserves empty seed", {
  rm_seed()
  with_preserve_seed(runif(1))
  expect_false(has_seed())
})

test_that("local_preserve_seed preserves empty seed", {
  rm_seed()
  local({
    local_preserve_seed()
    runif(1)
  })
  expect_false(has_seed())
})
