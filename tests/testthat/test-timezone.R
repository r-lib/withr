describe("with_timezone", {
  it("changes the time zone", {
    expect_equal(with_timezone("CET", Sys.timezone()), "CET")
    expect_equal(with_timezone("GMT", Sys.timezone()), "GMT")
    expect_true(
      with_timezone("CET", format(Sys.time(), "%Z")) %in% c("CET", "CEST"))
    expect_true(
      with_timezone("America/Los_Angeles", format(Sys.time(), "%Z")) %in% c("PDT", "PST"))

  })

  it("restores the time zone", {
    cur <- Sys.timezone()
    expect_equal(with_timezone("CET", Sys.timezone()), "CET")
    expect_identical(cur, Sys.timezone())

    cur <- Sys.timezone()
    expect_equal(with_timezone("America/Los_Angeles", Sys.timezone()), "America/Los_Angeles")
    expect_identical(cur, Sys.timezone())
  })
})

describe("local_timezone", {
  it("changes the time zone", {
    fun <- function(tzone) {
      local_timezone(tzone)
      Sys.timezone()
    }
    expect_identical(
      with_timezone("CET", Sys.timezone()),
      fun("CET"))
    expect_identical(
      with_timezone("America/Los_Angeles", Sys.timezone()),
      fun("America/Los_Angeles"))
  })

  it("restores the time zone", {
    cur <- Sys.timezone()
    fun <- function(tzone) {
      local_timezone(tzone)
      "foobar"
    }
    fun("CET")
    expect_identical(cur, Sys.timezone())
    fun("America/Los_Angeles")
    expect_identical(cur, Sys.timezone())
  })
})
