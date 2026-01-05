# Working directory

Temporarily change the current working directory.

## Usage

``` r
with_dir(new, code)

local_dir(new = list(), .local_envir = parent.frame())
```

## Arguments

- new:

  `[character(1)]`  
  New working directory

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

[`setwd()`](https://rdrr.io/r/base/getwd.html)

## Examples

``` r
getwd()
#> [1] "/home/runner/work/withr/withr/docs/dev/reference"

with_dir(tempdir(), getwd())
#> [1] "/tmp/RtmpvIFsFU"
```
