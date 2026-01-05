# Create a new "with" or "local" function

These are constructors for `with_...` or `local_...` functions. They are
only needed if you want to alter some global state which is not covered
by the existing `with_...` functions, see
[withr](https://withr.r-lib.org/dev/reference/withr.md) for an overview.

## Usage

``` r
local_(
  set,
  reset = set,
  get = NULL,
  ...,
  envir = parent.frame(),
  new = TRUE,
  dots = FALSE
)

with_(set, reset = set, get = NULL, ..., envir = parent.frame(), new = TRUE)
```

## Arguments

- set:

  `[function(...)]`  
  Function used to set the state. The return value from this function
  should be the old state, which will then be passed back into the
  `reset()` function to clean up the state. The function can have
  arbitrarily many arguments, they will be replicated in the formals of
  the returned function.

- reset:

  `[function(x)]`  
  Function used to reset the state. The first argument can be named
  arbitrarily, further arguments with default values, or a "dots"
  argument, are supported but not used: The function will be called as
  `reset(old)`.

- get:

  `[function(...)]`  
  Optionally, a getter function. If supplied, the
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html) restoration is set
  up *before* calling `set`. This is more robust in edge cases.

  For technical reasons, this getter function must have the same
  interface as `set`, which means it is passed the new values as well.
  These can be safely ignored.

- ...:

  These dots are for future extensions and must be empty.

- envir:

  `[environment]`  
  Environment of the returned function.

- new:

  `[logical(1)]`  
  Replace the first argument of the `set` function by `new`? Set to
  `FALSE` if the `set` function only has optional arguments.

## Value

`[function(new, code, ...)]` A function with at least two arguments,

- `new`: New state to use

- `code`: Code to run in that state.

If there are more arguments to the function passed in `set` they are
added to the returned function. If `set` does not have arguments, or
`new` is `FALSE`, the returned function does not have a `code` argument.

## Details

The `with_...` functions reset the state immediately after the `code`
argument has been evaluated. The `local_...` functions reset their
arguments after they go out of scope, usually at the end of the function
body.

## Examples

``` r
with_(setwd)
#> function (new, code) 
#> {
#>     old <- setwd(dir = new)
#>     on.exit(setwd(old))
#>     force(code)
#> }
#> <environment: 0x5624834d9c70>

global_stack <- list()
set_global_state <- function(state, msg = "Changing global state.") {
  global_stack <- c(list(state), global_stack)
  message(msg)
  state
}
reset_global_state <- function(state) {
  old_state <- global_stack[[1]]
  global_stack <- global_stack[-1]
  stopifnot(identical(state, old_state))
}
with_(set_global_state, reset_global_state)
#> function (new, code, msg = "Changing global state.") 
#> {
#>     old <- set_global_state(state = new, msg = msg)
#>     on.exit(reset_global_state(old))
#>     force(code)
#> }
#> <environment: 0x5624834d9c70>
```
