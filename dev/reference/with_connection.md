# Connections which close themselves

R file connections which are automatically closed.

## Usage

``` r
with_connection(con, code)

local_connection(con, .local_envir = parent.frame())
```

## Arguments

- con:

  For `with_connection()` a named list with the connection(s) to create.
  For `local_connection()` the code to create a single connection, which
  is then returned.

- code:

  `[any]`  
  Code to execute in the temporary environment

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

## Examples

``` r
with_connection(list(con = file("foo", "w")), {
  writeLines(c("foo", "bar"), con)
})

read_foo <- function() {
  readLines(local_connection(file("foo", "r")))
}
read_foo()
#> [1] "foo" "bar"

unlink("foo")
```
