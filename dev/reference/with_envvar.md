# Environment variables

Temporarily change system environment variables.

## Usage

``` r
with_envvar(new, code, action = "replace")

local_envvar(
  .new = list(),
  ...,
  action = "replace",
  .local_envir = parent.frame()
)
```

## Arguments

- new, .new:

  `[named character]`  
  New environment variables

- code:

  `[any]`  
  Code to execute in the temporary environment

- action:

  should new values `"replace"`, `"prefix"` or `"suffix"` existing
  variables with the same name.

- ...:

  Named arguments with new environment variables.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

if `NA` is used those environment variables will be unset. If there are
any duplicated variable names only the last one is used.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`Sys.setenv()`](https://rdrr.io/r/base/Sys.setenv.html)

## Examples

``` r
with_envvar(new = c("GITHUB_PAT" = "abcdef"), Sys.getenv("GITHUB_PAT"))
#> [1] "abcdef"

# with_envvar unsets variables after usage
Sys.getenv("TEMP_SECRET")
#> [1] ""
with_envvar(new = c("TEMP_SECRET" = "secret"), Sys.getenv("TEMP_SECRET"))
#> [1] "secret"
Sys.getenv("TEMP_SECRET")
#> [1] ""
```
