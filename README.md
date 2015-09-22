<!-- README.md is generated from README.Rmd. Please edit that file -->
Withr - Run Code 'With' Modified State
======================================

[![Travis-CI Build Status](https://travis-ci.org/jimhester/withr.svg?branch=master)](https://travis-ci.org/jimhester/withr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jimhester/withr?branch=master&svg=true)](https://ci.appveyor.com/project/jimhester/withr) [![Coverage Status](https://img.shields.io/codecov/c/github/jimhester/withr/master.svg)](https://codecov.io/github/jimhester/withr?branch=master) [![CRAN Version](http://www.r-pkg.org/badges/version/withr)](http://www.r-pkg.org/pkg/withr)

A set of functions to run code 'with' safely and temporarily modified global state.

Many of these functions were originally a part of the [devtools](https://github.com/hadley/devtools) package, this provides a simple package with limited dependencies to provide access to these functions.

-   with\_collate - collation order
-   with\_dir - working directory
-   with\_envvar - environment variables
-   with\_libpaths - library paths
-   with\_locale - any locale setting
-   with\_makevars - Makevars variables
-   with\_options - options
-   with\_par - graphics parameters
-   with\_path - PATH environment variable

There is also a `with_()` function to construct new `with_*` functions if needed.

``` r
dir.create("test")
#> Warning in dir.create("test"): 'test' already exists
getwd()
#> [1] "/tmp/RtmpaPrDI5"
with_dir("test", getwd())
#> [1] "/tmp/RtmpaPrDI5/test"
getwd()
#> [1] "/tmp/RtmpaPrDI5"
unlink("test")

Sys.getenv("HADLEY")
#> [1] ""
with_envvar(c("HADLEY" = 2), Sys.getenv("HADLEY"))
#> [1] "2"
Sys.getenv("HADLEY")
#> [1] ""

with_envvar(c("A" = 1),
  with_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
)
#> [1] "1 2"
```

See Also
========

-   [Devtools](https://github.com/hadley/devtools)
