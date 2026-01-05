# Defer Evaluation of an Expression

Similar to [`on.exit()`](https://rdrr.io/r/base/on.exit.html), but
allows one to attach an expression to be evaluated when exiting any
frame currently on the stack. This provides a nice mechanism for scoping
side effects for the duration of a function's execution.

## Usage

``` r
defer(expr, envir = parent.frame(), priority = c("first", "last"))

defer_parent(expr, priority = c("first", "last"))

deferred_run(envir = parent.frame())

deferred_clear(envir = parent.frame())
```

## Arguments

- expr:

  `[expression]`  
  An expression to be evaluated.

- envir:

  `[environment]`  
  Attach exit handlers to this environment. Typically, this should be
  either the current environment or a parent frame (accessed through
  [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)).

- priority:

  `[character(1)]`  
  Specify whether this handler should be executed `"first"` or `"last"`,
  relative to any other registered handlers on this environment.

## Details

`defer()` works by attaching handlers to the requested environment (as
an attribute called `"handlers"`), and registering an exit handler that
executes the registered handler when the function associated with the
requested environment finishes execution.

Deferred events can be set on the global environment, primarily to
facilitate the interactive development of code that is intended to be
executed inside a function or test. A message alerts the user to the
fact that an explicit `deferred_run()` is the only way to trigger these
deferred events. Use `deferred_clear()` to clear them without
evaluation. The global environment scenario is the main motivation for
these functions.

## Running handlers within [`source()`](https://rdrr.io/r/base/source.html)

withr handlers run within
[`source()`](https://rdrr.io/r/base/source.html) are run when
[`source()`](https://rdrr.io/r/base/source.html) exits rather than line
by line.

This is only the case when the script is sourced in
[`globalenv()`](https://rdrr.io/r/base/environment.html). For a local
environment, the caller needs to set
`options(withr.hook_source = TRUE)`. This is to avoid paying the penalty
of detecting [`source()`](https://rdrr.io/r/base/source.html) in the
normal usage of `defer()`.

## Examples

``` r
# define a 'local' function that creates a file, and
# removes it when the parent function has finished executing
local_file <- function(path) {
  file.create(path)
  defer_parent(unlink(path))
}

# create tempfile path
path <- tempfile()

# use 'local_file' in a function
local({
  local_file(path)
  stopifnot(file.exists(path))
})

# file is deleted as we leave 'local' local
stopifnot(!file.exists(path))

# investigate how 'defer' modifies the
# executing function's environment
local({
  local_file(path)
  print(attributes(environment()))
})
#> NULL

# Note that examples lack function scoping so deferred calls are
# generally executed immediately
defer(print("one"))
#> [1] "one"
defer(print("two"))
#> [1] "two"
```
