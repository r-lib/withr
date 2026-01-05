# Time zone

Change the time zone, and restore it afterwards.

## Usage

``` r
with_timezone(tz, code)

local_timezone(tz, .local_envir = parent.frame())
```

## Arguments

- tz:

  `[character(1)]` a valid time zone specification, note that time zone
  names might be platform dependent.

- code:

  `[any]`  
  Code to execute in the temporary environment

- .local_envir:

  The environment to apply the change to.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

`with_timezone()` runs the code with the specified time zone and resets
it afterwards.

`local_timezone()` changes the time zone for the caller execution
environment.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`Sys.timezone()`](https://rdrr.io/r/base/timezones.html).

## Examples

``` r
Sys.time()
#> [1] "2026-01-05 10:16:14 UTC"
with_timezone("Europe/Paris", print(Sys.time()))
#> [1] "2026-01-05 11:16:14 CET"
with_timezone("America/Los_Angeles", print(Sys.time()))
#> [1] "2026-01-05 02:16:14 PST"

fun1 <- function() {
  local_timezone("CET")
  print(Sys.time())
}

fun2 <- function() {
  local_timezone("America/Los_Angeles")
  print(Sys.time())
}
Sys.time()
#> [1] "2026-01-05 10:16:14 UTC"
fun1()
#> [1] "2026-01-05 11:16:14 CET"
fun2()
#> [1] "2026-01-05 02:16:14 PST"
Sys.time()
#> [1] "2026-01-05 10:16:14 UTC"
```
