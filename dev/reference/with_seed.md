# Random seed

`with_seed()` runs code with a specific random seed and resets it
afterwards.

`with_preserve_seed()` runs code with the current random seed and resets
it afterwards.

## Usage

``` r
with_seed(
  seed,
  code,
  .rng_kind = NULL,
  .rng_normal_kind = NULL,
  .rng_sample_kind = NULL
)

local_seed(
  seed,
  .local_envir = parent.frame(),
  .rng_kind = NULL,
  .rng_normal_kind = NULL,
  .rng_sample_kind = NULL
)

with_preserve_seed(code)

local_preserve_seed(.local_envir = parent.frame())
```

## Arguments

- seed:

  `[integer(1)]`  
  The random seed to use to evaluate the code.

- code:

  `[any]`  
  Code to execute in the temporary environment

- .rng_kind, .rng_normal_kind, .rng_sample_kind:

  `[character(1)]`  
  Kind of RNG to use. Passed as the `kind`, `normal.kind`, and
  `sample.kind` arguments of
  [`RNGkind()`](https://rdrr.io/r/base/Random.html).

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

## Examples

``` r
# Same random values:
with_preserve_seed(runif(5))
#> [1] 0.4048736 0.6039472 0.3271063 0.4576199 0.3756114
with_preserve_seed(runif(5))
#> [1] 0.4048736 0.6039472 0.3271063 0.4576199 0.3756114

# Use a pseudorandom value as seed to advance the RNG and pick a different
# value for the next call:
with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#> [1] 0.20927225 0.09925052 0.26999674 0.64445334 0.38068915
with_seed(seed, runif(5))
#> [1] 0.20927225 0.09925052 0.26999674 0.64445334 0.38068915
with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#> [1] 0.7856574 0.4951076 0.1233589 0.8756561 0.6825961
```
