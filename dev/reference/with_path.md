# PATH environment variable

Temporarily change the system search path.

## Usage

``` r
with_path(new, code, action = c("prefix", "suffix", "replace"))

local_path(
  new = list(),
  action = c("prefix", "suffix", "replace"),
  .local_envir = parent.frame()
)
```

## Arguments

- new:

  `[character]`  
  New `PATH` entries

- code:

  `[any]`  
  Code to execute in the temporary environment

- action:

  `[character(1)]`  
  Should new values `"replace"`, `"prefix"` (the default) or `"suffix"`
  existing paths

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`Sys.setenv()`](https://rdrr.io/r/base/Sys.setenv.html)

## Examples

``` r
# temporarily modify the system PATH, *prefixing* the current path
with_path(getwd(), Sys.getenv("PATH"))
#> [1] "/home/runner/work/withr/withr/docs/dev/reference:/opt/hostedtoolcache/pandoc/3.1.11/x64:/snap/bin:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# temporarily modify the system PATH, *appending* to the current path
with_path(getwd(), Sys.getenv("PATH"), "suffix")
#> [1] "/opt/hostedtoolcache/pandoc/3.1.11/x64:/snap/bin:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/games:/snap/bin:/home/runner/work/withr/withr/docs/dev/reference"
```
