# Execute code in temporarily altered environment

All functions prefixed by `with_` work as follows. First, a particular
aspect of the global environment is modified (see below for a list).
Then, custom code (passed via the `code` argument) is executed. Upon
completion or error, the global environment is restored to the previous
state. Each `with_` function has a `local_` variant, which instead
resets the state when the current evaluation context ends (such as the
end of a function).

## Arguments pattern

|        |             |                                              |
|--------|-------------|----------------------------------------------|
| `new`  | `[various]` | Values for setting                           |
| `code` | `[any]`     | Code to execute in the temporary environment |
| `...`  |             | Further arguments                            |

## Usage pattern

`with_...(new, code, ...)`

## withr functions

- [`with_collate()`](https://withr.r-lib.org/dev/reference/with_collate.md):
  collation order

- [`with_dir()`](https://withr.r-lib.org/dev/reference/with_dir.md):
  working directory

- [`with_envvar()`](https://withr.r-lib.org/dev/reference/with_envvar.md):
  environment variables

- [`with_libpaths()`](https://withr.r-lib.org/dev/reference/with_libpaths.md):
  library paths, replacing current libpaths

- [`with_locale()`](https://withr.r-lib.org/dev/reference/with_locale.md):
  any locale setting

- [`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md):
  Makevars variables

- [`with_options()`](https://withr.r-lib.org/dev/reference/with_options.md):
  options

- [`with_par()`](https://withr.r-lib.org/dev/reference/with_par.md):
  graphics parameters

- [`with_path()`](https://withr.r-lib.org/dev/reference/with_path.md):
  `PATH` environment variable

- [`with_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md):
  output redirection

## Creating new "with" functions

All `with_` functions are created by a helper function,
[`with_()`](https://withr.r-lib.org/dev/reference/with_.md). This
functions accepts two arguments: a setter function and an optional
resetter function. The setter function is expected to change the global
state and return an "undo instruction". This undo instruction is then
passed to the resetter function, which changes back the global state. In
many cases, the setter function can be used naturally as resetter.

## See also

Useful links:

- <https://withr.r-lib.org>

- <https://github.com/r-lib/withr#readme>

- Report bugs at <https://github.com/r-lib/withr/issues>

## Author

**Maintainer**: Lionel Henry <lionel@posit.co>

Authors:

- Jim Hester

- Kirill Müller <krlmlr+r@mailbox.org>

- Kevin Ushey <kevinushey@gmail.com>

- Hadley Wickham <hadley@posit.co>

- Winston Chang

Other contributors:

- Jennifer Bryan \[contributor\]

- Richard Cotton \[contributor\]

- Posit Software, PBC \[copyright holder, funder\]

## Examples

``` r
getwd()
#> [1] "/home/runner/work/withr/withr/docs/dev/reference"
with_dir(tempdir(), getwd())
#> [1] "/tmp/RtmpvIFsFU"
getwd()
#> [1] "/home/runner/work/withr/withr/docs/dev/reference"

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

# local variants are best used within other functions
f <- function(x) {
  local_envvar(c("WITHR" = 2))
  Sys.getenv("WITHR")
}
Sys.getenv("WITHR")
#> [1] ""
```
