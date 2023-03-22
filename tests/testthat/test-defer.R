test_that("`frame_exits()` and `frame_clear_exits()`", {
  on.exit("foo")
  expect_equal(frame_exits(), list("foo"))

  on.exit("bar", add = TRUE)
  expect_equal(frame_exits(), list("foo", "bar"))

  on.exit("baz", add = TRUE, after = FALSE)
  expect_equal(frame_exits(), list("baz", "foo", "bar"))

  frame_clear_exits()
  expect_equal(frame_exits(), list())
})
