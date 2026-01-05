# Library paths

Temporarily prepend a new temporary directory to the library paths.

## Usage

``` r
with_temp_libpaths(code, action = "prefix")

local_temp_libpaths(action = "prefix", .local_envir = parent.frame())
```

## Arguments

- code:

  `[any]`  
  Code to execute in the temporary environment

- action:

  `[character(1)]`  
  should new values `"replace"`, `"prefix"` or `"suffix"` existing
  paths.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`.libPaths()`](https://rdrr.io/r/base/libPaths.html)

Other libpaths:
[`with_libpaths()`](https://withr.r-lib.org/dev/reference/with_libpaths.md)
