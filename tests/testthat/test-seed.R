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

test_that("with_preserve_seed preserves empty seed", {
  rm_seed()
  with_preserve_seed(runif(1))
  expect_false(has_seed())
})
