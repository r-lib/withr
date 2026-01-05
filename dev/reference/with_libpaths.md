# Library paths

Temporarily change library paths.

## Usage

``` r
with_libpaths(new, code, action = "replace")

local_libpaths(new = list(), action = "replace", .local_envir = parent.frame())
```

## Arguments

- new:

  `[character]`  
  New library paths

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
[`with_temp_libpaths()`](https://withr.r-lib.org/dev/reference/with_temp_libpaths.md)

## Examples

``` r
.libPaths()
#> [1] "/home/runner/work/_temp/Library" "/opt/R/4.5.2/lib/R/site-library"
#> [3] "/opt/R/4.5.2/lib/R/library"     
new_lib <- tempfile()
dir.create(new_lib)
with_libpaths(new_lib, print(.libPaths()))
#> [1] "/tmp/RtmpvIFsFU/file1c674b244f7d"
#> [2] "/opt/R/4.5.2/lib/R/site-library" 
#> [3] "/opt/R/4.5.2/lib/R/library"      
unlink(new_lib, recursive = TRUE)
```
