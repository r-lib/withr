# defer()'s global env facilities work

    Code
      defer(print("howdy"), envir = globalenv())
    Message
      Setting global deferred event(s).
      i These will be run:
        * Automatically, when the R session ends.
        * On demand, if you call `withr::deferred_run()`.
      i Use `withr::deferred_clear()` to clear them without executing.

# don't need to enable source for the global env

    Code
      source(file, local = globalenv())
    Output
      1
      2
      deferred

