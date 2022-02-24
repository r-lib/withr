test_that("`action` is checked", {
  expect_snapshot_error(with_path("foo", NULL, action = "Suffix"))
})
