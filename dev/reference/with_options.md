# Options

Temporarily change global options.

## Usage

``` r
with_options(new, code)

local_options(.new = list(), ..., .local_envir = parent.frame())
```

## Arguments

- new, .new:

  `[named list]`  
  New options and their values

- code:

  `[any]`  
  Code to execute in the temporary environment

- ...:

  Additional options and their values

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`options()`](https://rdrr.io/r/base/options.html)

## Examples

``` r
# number of significant digits to print
getOption("digits")
#> [1] 7
# modify temporarily the number of significant digits to print
with_options(list(digits = 3), getOption("digits"))
#> [1] 3
with_options(list(digits = 3), print(pi))
#> [1] 3.14

# modify temporarily the character to be used as the decimal point
getOption("digits")
#> [1] 7
with_options(list(OutDec = ","), print(pi))
#> [1] 3,141593

# modify temporarily multiple options
with_options(list(OutDec = ",", digits = 3), print(pi))
#> [1] 3,14

# modify, within the scope of the function, the number of
# significant digits to print
print_3_digits <- function(x) {
  # assign 3 to the option "digits" for the rest of this function
  # after the function exits, the option will return to its previous
  # value
  local_options(list(digits = 3))
  print(x)
}

print_3_digits(pi)  # returns 3.14
#> [1] 3.14
print(pi)           # returns 3.141593
#> [1] 3.141593
```
