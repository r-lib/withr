# withr - run code ‘with’ modified state

## Overview

A set of functions to run code with safely and temporarily modified
global state, withr makes working with the global state, i.e. side
effects, less error-prone.

Pure functions, such as the [`sum()`](https://rdrr.io/r/base/sum.html)
function, are easy to understand and reason about: they always map the
same input to the same output and have no other impact on the workspace.
In other words, pure functions have no *side effects*: they are not
affected by, nor do they affect, the global state in any way apart from
the value they return.

The behavior of some functions *is* affected by the global state.
Consider the [`read.csv()`](https://rdrr.io/r/utils/read.table.html)
function: it takes a filename as an input and returns the contents as an
output. In this case, the output depends on the contents of the file;
i.e. the output is affected by the global state. Functions like this
deal with side effects.

The purpose of the withr package is to help you manage side effects in
your code. You may want to run code with secret information, such as an
API key, that you store as an environment variable. You may also want to
run code with certain options, with a given random-seed, or with a
particular working-directory.

The withr package helps you manage these situations, and more, by
providing functions to modify the global state temporarily, and safely.
These functions modify one of the global settings for duration of a
block of code, then automatically reset it after the block is completed.

## Installation

``` r
#Install the latest version with:
install.packages("withr")
```

Many of these functions were originally a part of the
[devtools](https://github.com/r-lib/devtools) package, this provides a
simple package with limited dependencies to provide access to these
functions.

- [`with_collate()`](https://withr.r-lib.org/dev/reference/with_collate.md)
  /
  [`local_collate()`](https://withr.r-lib.org/dev/reference/with_collate.md) -
  collation order
- [`with_dir()`](https://withr.r-lib.org/dev/reference/with_dir.md) /
  [`local_dir()`](https://withr.r-lib.org/dev/reference/with_dir.md) -
  working directory
- [`with_envvar()`](https://withr.r-lib.org/dev/reference/with_envvar.md)
  /
  [`local_envvar()`](https://withr.r-lib.org/dev/reference/with_envvar.md) -
  environment variables
- [`with_libpaths()`](https://withr.r-lib.org/dev/reference/with_libpaths.md)
  /
  [`local_libpaths()`](https://withr.r-lib.org/dev/reference/with_libpaths.md) -
  library paths
- [`with_locale()`](https://withr.r-lib.org/dev/reference/with_locale.md)
  /
  [`local_locale()`](https://withr.r-lib.org/dev/reference/with_locale.md) -
  any locale setting
- [`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  /
  [`local_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  /
  [`set_makevars()`](https://withr.r-lib.org/dev/reference/set_makevars.md) -
  makevars variables
- [`with_options()`](https://withr.r-lib.org/dev/reference/with_options.md)
  /
  [`local_options()`](https://withr.r-lib.org/dev/reference/with_options.md) -
  options
- [`with_par()`](https://withr.r-lib.org/dev/reference/with_par.md) /
  [`local_par()`](https://withr.r-lib.org/dev/reference/with_par.md) -
  graphics parameters
- [`with_path()`](https://withr.r-lib.org/dev/reference/with_path.md) /
  [`local_path()`](https://withr.r-lib.org/dev/reference/with_path.md) -
  PATH environment variable
- `with_*()` and `local_*()` functions for the built in R devices,
  `bmp`, `cairo_pdf`, `cairo_ps`, `pdf`, `postscript`, `svg`, `tiff`,
  `xfig`, `png`, `jpeg`.
- [`with_connection()`](https://withr.r-lib.org/dev/reference/with_connection.md)
  /
  [`local_connection()`](https://withr.r-lib.org/dev/reference/with_connection.md) -
  R file connections
- [`with_db_connection()`](https://withr.r-lib.org/dev/reference/with_db_connection.md)
  /
  [`local_db_connection()`](https://withr.r-lib.org/dev/reference/with_db_connection.md) -
  DB connections
- [`with_package()`](https://withr.r-lib.org/dev/reference/with_package.md)
  /
  [`local_package()`](https://withr.r-lib.org/dev/reference/with_package.md),
  [`with_namespace()`](https://withr.r-lib.org/dev/reference/with_package.md)
  /
  [`local_namespace()`](https://withr.r-lib.org/dev/reference/with_package.md)
  and
  [`with_environment()`](https://withr.r-lib.org/dev/reference/with_package.md)
  /
  [`local_environment()`](https://withr.r-lib.org/dev/reference/with_package.md) -
  to run code with modified object search paths.
- [`with_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  /
  [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md) -
  create and clean up a temp file.
- [`with_file()`](https://withr.r-lib.org/dev/reference/with_file.md) /
  [`local_file()`](https://withr.r-lib.org/dev/reference/with_file.md) -
  create and clean up a normal file.
- [`with_message_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md)
  /
  [`local_message_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md) -
  divert message
- [`with_output_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md)
  /
  [`local_output_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md) -
  divert output
- [`with_preserve_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  / [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)-
  specify seeds
- [`with_temp_libpaths()`](https://withr.r-lib.org/dev/reference/with_temp_libpaths.md)
  /
  [`local_temp_libpaths()`](https://withr.r-lib.org/dev/reference/with_temp_libpaths.md) -
  library paths
- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) /
  [`defer_parent()`](https://withr.r-lib.org/dev/reference/defer.md) -
  defer
- [`with_timezone()`](https://withr.r-lib.org/dev/reference/with_timezone.md)
  /
  [`local_timezone()`](https://withr.r-lib.org/dev/reference/with_timezone.md) -
  timezones
- [`with_rng_version()`](https://withr.r-lib.org/dev/reference/with_rng_version.md)
  /
  [`local_rng_version()`](https://withr.r-lib.org/dev/reference/with_rng_version.md) -
  random number generation version

## Usage

There are two sets of functions, those prefixed with `with_` and those
with `local_`. The former reset their state as soon as the `code`
argument has been evaluated. The latter reset when they reach the end of
their scope, usually at the end of a function body.

``` r
par("col" = "black")
my_plot <- function(new) {
  with_par(list(col = "red", pch = 19),
    plot(mtcars$hp, mtcars$wt)
  )
  par("col")
}
my_plot()
```

![](reference/figures/README-unnamed-chunk-3-1.png)

``` R
#> [1] "black"
par("col")
#> [1] "black"

f <- function(x) {
  local_envvar(c("WITHR" = 2))
  Sys.getenv("WITHR")
}

f()
#> [1] "2"
Sys.getenv("WITHR")
#> [1] ""
```

There are also
[`with_()`](https://withr.r-lib.org/dev/reference/with_.md) and
[`local_()`](https://withr.r-lib.org/dev/reference/with_.md) functions
to construct new `with_*` and `local_*` functions if needed.

``` r
Sys.getenv("WITHR")
#> [1] ""
with_envvar(c("WITHR" = 2), Sys.getenv("WITHR"))
#> [1] "2"
Sys.getenv("WITHR")
#> [1] ""

with_envvar(c("A" = 1),
  with_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
)
#> [1] "1 2"
```

# See Also

- [Devtools](https://github.com/r-lib/devtools)
