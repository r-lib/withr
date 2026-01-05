# Create a new `Makevars` file, by adding new variables

You probably want
[`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
instead of this function.

## Usage

``` r
set_makevars(
  variables,
  old_path = makevars_user(),
  new_path = tempfile(),
  assignment = c("=", ":=", "?=", "+=")
)
```

## Arguments

- variables:

  `[named character]`  
  new variables and their values

- old_path:

  `[character(1)]`  
  location of existing `Makevars` file to modify.

- new_path:

  `[character(1)]`  
  location of the new `Makevars` file

- assignment:

  `[character(1)]`  
  assignment type to use.

## Details

Unlike
[`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md),
it does not activate the new `Makevars` file, i.e. it does not set the
`R_MAKEVARS_USER` environment variable.
