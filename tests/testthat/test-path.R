test_that("`action` is checked", {
  expect_snapshot_error(with_path("foo", NULL, action = "Suffix"))
})

test_that("with_path works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  with_path(
    new_path,
    {
      expect_equal(normalizePath(new_path), head(get_path(), n = 1))
      expect_equal(length(get_path()), length(current) + 1L)
    }
  )
  expect_equal(current, get_path())
})

test_that("with_path with suffix action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  with_path(
    new_path,
    action = "suffix",
    {
      expect_equal(normalizePath(new_path), tail(get_path(), n = 1))
      expect_equal(length(get_path()), length(current) + 1L)
    }
  )
  expect_equal(current, get_path())
})

test_that("with_path with replace action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  with_path(
    new_path,
    action = "replace",
    {
      expect_equal(normalizePath(new_path), get_path())
      expect_equal(length(get_path()), 1L)
    }
  )
  expect_equal(current, get_path())
})

test_that("local_path works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path)
    expect_equal(normalizePath(new_path), head(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("local_path with suffix action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path, action = "suffix")
    expect_equal(normalizePath(new_path), tail(get_path(), n = 1))
    expect_equal(length(get_path()), length(current) + 1L)
  })
  expect_equal(current, get_path())
})

test_that("local_path with replace action works and resets path", {
  current <- normalizePath(get_path(), mustWork = FALSE)
  new_path <- normalizePath(".")
  local({
    local_path(new_path, action = "replace")
    expect_equal(normalizePath(new_path), get_path())
    expect_equal(length(get_path()), 1L)
  })
  expect_equal(current, get_path())
})
