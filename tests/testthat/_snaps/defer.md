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

# can't run `deferred_run()` in knitr

    Code
      writeLines(readLines(out))
    Output
      
      
      ```r
      withr::deferred_run()
      ```
      
      ```
      ## No deferred expressions to run
      ```
      
      ```r
      defer(writeLines('1'))
      writeLines('2')
      ```
      
      ```
      ## 2
      ```
      
      ```r
      defer(writeLines('3'))
      ```
      
      ```r
      writeLines('4')
      ```
      
      ```
      ## 4
      ```
      
      ```r
      withr::deferred_run()
      ```
      
      ```
      ## 3
      ## 1
      ```
      
      ```
      ## Ran 2/2 deferred expressions
      ```
      

