# deferred_run() displays how many expressions were run

    Code
      deferred_run()
    Message
      No deferred expressions to run

---

    Code
      local({
        local_tempfile()
        local_tempfile()
        deferred_run()
      })
    Message
      Ran 2/2 deferred expressions

---

    Code
      expect_error(local({
        local_tempfile()
        defer(stop("foo"))
        local_tempfile()
        deferred_run()
      }))
    Message
      Ran 1/3 deferred expressions

