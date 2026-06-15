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

[`withr`](https://withr.r-lib.org/reference/withr.md) for examples

## Examples

``` r
# Same random values:
with_preserve_seed(runif(5))
#> [1] 0.10169262 0.76999328 0.08906143 0.53659237 0.26213892
with_preserve_seed(runif(5))
#> [1] 0.10169262 0.76999328 0.08906143 0.53659237 0.26213892

# Use a pseudorandom value as seed to advance the RNG and pick a different
# value for the next call:
with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#> [1] 0.5885083 0.3289879 0.4357050 0.2184870 0.3697503
with_seed(seed, runif(5))
#> [1] 0.5885083 0.3289879 0.4357050 0.2184870 0.3697503
with_seed(seed <- sample.int(.Machine$integer.max, 1L), runif(5))
#> [1] 0.6099326 0.6076366 0.4936592 0.6276273 0.5535448
```
