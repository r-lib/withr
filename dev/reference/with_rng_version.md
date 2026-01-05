# RNG version

Change the RNG version and restore it afterwards.

## Usage

``` r
with_rng_version(version, code)

local_rng_version(version, .local_envir = parent.frame())
```

## Arguments

- version:

  `[character(1)]` an R version number, e.g. `"3.5.0"`, to switch to the
  RNG this version of R uses. See
  [`RNGversion()`](https://rdrr.io/r/base/Random.html).

- code:

  `[any]`  
  Code to execute in the temporary environment

- .local_envir:

  The environment to apply the change to.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

`with_rng_version()` runs the code with the specified RNG version and
resets it afterwards.

`local_rng_version()` changes the RNG version for the caller execution
environment.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`RNGversion()`](https://rdrr.io/r/base/Random.html),
[`RNGkind()`](https://rdrr.io/r/base/Random.html),
[`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md).

## Examples

``` r
RNGkind()
#> [1] "Mersenne-Twister" "Inversion"        "Rejection"       
with_rng_version("3.0.0", RNGkind())
#> [1] "Mersenne-Twister" "Inversion"        "Rounding"        
with_rng_version("1.6.0", RNGkind())
#> [1] "Marsaglia-Multicarry"   "Buggy Kinderman-Ramage"
#> [3] "Rounding"              

with_rng_version("3.0.0",
  with_seed(42, sample(1:100, 3)))
#> [1] 92 93 29

with_rng_version("1.6.0",
  with_seed(42, sample(1:100, 3)))
#> Warning: buggy version of Kinderman-Ramage generator used
#> Warning: RNGkind: Marsaglia-Multicarry has poor statistical properties
#> [1] 33 44 32

RNGkind()
#> [1] "Mersenne-Twister" "Inversion"        "Rejection"       

fun1 <- function() {
  local_rng_version("3.0.0")
  with_seed(42, sample(1:100, 3))
}

fun2 <- function() {
  local_rng_version("1.6.0")
  with_seed(42, sample(1:100, 3))
}

RNGkind()
#> [1] "Mersenne-Twister" "Inversion"        "Rejection"       
fun1()
#> [1] 92 93 29
fun2()
#> Warning: buggy version of Kinderman-Ramage generator used
#> Warning: RNGkind: Marsaglia-Multicarry has poor statistical properties
#> [1] 33 44 32
RNGkind()
#> [1] "Mersenne-Twister" "Inversion"        "Rejection"       
```
