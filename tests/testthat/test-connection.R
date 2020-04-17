context("connection")

describe("with_connection", {
  it("errors if connection is not named", {
    expect_error({
      with_connection(list(TRUE), TRUE)
    }, "all(is.named(con)) is not TRUE", fixed = TRUE)
  })

  it("creates a single connection", {
    tmp <- tempfile()
    on.exit(unlink(tmp))
    expect_false(exists("con"))
    with_connection(list(con = file(tmp, "w")), {
      writeLines(c("foo", "bar"), con)
    })
    expect_false(exists("con"))
    expect_equal(readLines(tmp), c("foo", "bar"))
  })

  it("creates multiple connections", {
    tmp <- tempfile()
    tmp2 <- tempfile()
    on.exit(unlink(c(tmp, tmp2)))
    expect_false(exists("con"))
    expect_false(exists("con2"))
    with_connection(list(con = file(tmp, "w"), con2 = file(tmp2, "w")), {
      writeLines(c("foo", "bar"), con)
      writeLines(c("baz", "qux"), con2)
    })
    expect_false(exists("con"))
    expect_false(exists("con2"))
    expect_equal(readLines(tmp), c("foo", "bar"))
    expect_equal(readLines(tmp2), c("baz", "qux"))
  })

  it("works if there is an existing object with the same name", {
    tmp <- tempfile()

    con <- "foo"
    with_connection(list(con = file(tmp, "w")), {
      writeLines("foo", con)
    })
    expect_true(exists("con"))
    expect_equal(readLines(tmp), "foo")
  })

  it("works if there is an existing connection with the same name", {
    tmp <- tempfile()
    tmp2 <- tempfile()

    con <- file(tmp, "w")
    writeLines("foo", tmp)
    with_connection(list(con = file(tmp2, "w")), {
      writeLines("bar", con)
    })
    close(con)

    expect_equal(readLines(tmp), "foo")
    expect_equal(readLines(tmp2), "bar")
  })
})

describe("local_connection", {
  it("creates a single connection", {
    tmp <- tempfile()
    on.exit(unlink(tmp))
    expect_false(exists("con"))

    (function() {
      con <- local_connection(file(tmp, "w"))
      writeLines(c("foo", "bar"), con)
    })()
    expect_false(exists("con"))
    expect_equal(readLines(tmp), c("foo", "bar"))
  })
})
