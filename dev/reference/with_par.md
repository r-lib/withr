# Graphics parameters

Temporarily change graphics parameters.

## Usage

``` r
with_par(new, code, no.readonly = FALSE)

local_par(
  .new = list(),
  ...,
  no.readonly = FALSE,
  .local_envir = parent.frame()
)
```

## Arguments

- new, .new:

  `[named list]`  
  New graphics parameters and their values

- code:

  `[any]`  
  Code to execute in the temporary environment

- no.readonly:

  `[logical(1)]`  
  see [`par()`](https://rdrr.io/r/graphics/par.html) documentation.

- ...:

  Additional graphics parameters and their values.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`par()`](https://rdrr.io/r/graphics/par.html)

## Examples

``` r
old <- par("col" = "black")

# This will be in red
with_par(list(col = "red", pch = 19),
  plot(mtcars$hp, mtcars$wt)
)


# This will still be in black
plot(mtcars$hp, mtcars$wt)


par(old)
```
