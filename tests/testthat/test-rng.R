context("rng")

describe("with_rng_version", {
  it("changes the RNG", {
    cur <- RNGkind()
    old <-with_rng_version("1.6.0", RNGkind())
    expect_equal(old[1], "Marsaglia-Multicarry")
    expect_true(old[1] != cur[1])
  })

  it("restores the RNG", {
    cur <- RNGkind()
    with_rng_version("1.6.0", RNGkind())
    expect_identical(cur, RNGkind())
  })
})

describe("local_rng_version", {
  it("changes the RNG", {
    fun <- function() {
      local_rng_version("1.6.0")
      RNGkind()
    }
    expect_identical(
      with_rng_version("1.6.0", RNGkind()),
      fun()
    )
  })

  it("restores the RNG", {
    cur <- RNGkind()
    fun <- function() {
      local_rng_version("1.6.0")
      "foobar"
    }
    expect_identical(
      cur,
      RNGkind()
    )
  })
})
