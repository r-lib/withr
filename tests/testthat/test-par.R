test_that("with_par works as expected", {
  local_pdf(local_tempfile())

  old <- par("pty")
  with_par(list(pty = "s"), {
    expect_equal(par("pty"), "s")
  })
  expect_equal(par("pty"), old)
  dev.off()
})

test_that("local_par works as expected", {
  local_pdf(local_tempfile())

  old <- par("pty")
  local({
    local_par(list(pty = "s"))
    expect_equal(par("pty"), "s")
  })
  expect_equal(par("pty"), old)
})

test_that("empty par doesn't give warning", {
  local_pdf(local_tempfile())

  expect_no_warning(with_par(list(), par(pty="s")))
})
