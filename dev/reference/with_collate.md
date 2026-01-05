# Collation Order

Temporarily change collation order by changing the value of the
`LC_COLLATE` locale.

## Usage

``` r
with_collate(new, code)

local_collate(new = list(), .local_envir = parent.frame())
```

## Arguments

- new:

  `[character(1)]`  
  New collation order

- code:

  `[any]`  
  Code to execute in the temporary environment

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Examples

    # Modify collation order:
    x <- c("bernard", "bérénice", "béatrice", "boris")

    with_collate("fr_FR", sort(x))
    #> [1] "béatrice" "bérénice" "bernard"  "boris"

    with_collate("C", sort(x))
    #> [1] "bernard"  "boris"    "béatrice" "bérénice"

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples
