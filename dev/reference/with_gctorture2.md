# Torture Garbage Collector

Temporarily turn gctorture2 on.

## Usage

``` r
with_gctorture2(new, code, wait = new, inhibit_release = FALSE)
```

## Arguments

- new:

  `[integer]`  
  run GC every 'step' allocations.

- code:

  `[any]`  
  Code to execute in the temporary environment

- wait:

  integer; number of allocations to wait before starting GC torture.

- inhibit_release:

  logical; do not release free objects for re-use: use with caution.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples
