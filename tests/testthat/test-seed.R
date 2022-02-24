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

test_that("RNGkind is also respected", {
  old <- RNGkind()
  on.exit(do.call("RNGkind", as.list(old)))


  # Uniform RNG

  my_seed <- sample.int(.Machine$integer.max, 1)
  rng_kind <- "Mersenne-Twister"
  alt_rng_kind <- "L'Ecuyer-CMRG"

  RNGkind(rng_kind)
  set.seed(my_seed)
  reference <- runif(10)

  RNGkind(alt_rng_kind)
  set.seed(my_seed)
  alt_reference <- runif(10)

  RNGkind(rng_kind)
  expect_equal(
    with_seed(my_seed, {
      expect_equal(RNGkind()[[1]], rng_kind)
      runif(10)
    }),
    reference
  )
  expect_equal(RNGkind()[[1]], rng_kind)

  RNGkind(alt_rng_kind)
  expect_equal(
    with_seed(my_seed, {
      expect_equal(RNGkind()[[1]], alt_rng_kind)
      runif(10)
    }),
    alt_reference
  )
  expect_equal(RNGkind()[[1]], alt_rng_kind)

  RNGkind(rng_kind)
  expect_equal(
    with_seed(
      my_seed,
      {
        expect_equal(RNGkind()[[1]], alt_rng_kind)
        runif(10)
      },
      .rng_kind = alt_rng_kind
    ),
    alt_reference
  )
  expect_equal(RNGkind()[[1]], rng_kind)


  # Normal RNG

  rng_norm_kind <- "Box-Muller"
  alt_rng_norm_kind <- "Kinderman-Ramage"

  RNGkind(normal.kind = rng_norm_kind)
  set.seed(my_seed)
  norm_reference <- rnorm(10)

  RNGkind(normal.kind = alt_rng_norm_kind)
  set.seed(my_seed)
  alt_norm_reference <- rnorm(10)

  expect_equal(
    with_seed(my_seed, rnorm(10)),
    alt_norm_reference
  )

  expect_equal(
    with_seed(
      my_seed,
      .rng_normal_kind = alt_rng_norm_kind,
      rnorm(10)
    ),
    alt_norm_reference
  )

  expect_equal(
    with_seed(
      my_seed,
      .rng_normal_kind = rng_norm_kind,
      rnorm(10)
    ),
    norm_reference
  )

  expect_equal(
    with_preserve_seed(rnorm(10)),
    with_preserve_seed(rnorm(10))
  )

  # Beware: Box-Muller generates pairs, that state is lost across set.seed()!
  RNGkind(normal.kind = rng_norm_kind)
  rnorm(1)
  expect_failure(expect_equal(
    with_preserve_seed(rnorm(10)),
    with_preserve_seed(rnorm(10))
  ))
})
