# Defer expression globally

This function is mostly internal. It is exported to be called in
standalone [`defer()`](https://withr.r-lib.org/dev/reference/defer.md)
implementations to defer expressions from the global environment.

## Usage

``` r
global_defer(expr, priority = c("first", "last"))
```

## Arguments

- expr:

  `[expression]`  
  An expression to be evaluated.

- priority:

  `[character(1)]`  
  Specify whether this handler should be executed `"first"` or `"last"`,
  relative to any other registered handlers on this environment.
