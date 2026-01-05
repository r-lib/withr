# Makevars variables

Temporarily change contents of an existing `Makevars` file.

## Usage

``` r
with_makevars(
  new,
  code,
  path = makevars_user(),
  assignment = c("=", ":=", "?=", "+=")
)

local_makevars(
  .new = list(),
  ...,
  .path = makevars_user(),
  .assignment = c("=", ":=", "?=", "+="),
  .local_envir = parent.frame()
)
```

## Arguments

- new, .new:

  `[named character]`  
  New variables and their values

- code:

  `[any]`  
  Code to execute in the temporary environment

- path, .path:

  `[character(1)]`  
  location of existing `Makevars` file to modify.

- assignment, .assignment:

  `[character(1)]`  
  assignment type to use.

- ...:

  Additional new variables and their values.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## Details

If no `Makevars` file exists or the fields in `new` do not exist in the
existing `Makevars` file then the fields are added to the new file.
Existing fields which are not included in `new` are appended unchanged.
Fields which exist in `Makevars` and in `new` are modified to use the
value in `new`.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

## Examples

``` r
writeLines("void foo(int* bar) { *bar = 1; }\n", "foo.c")
system("R CMD SHLIB --preclean -c foo.c")
with_makevars(c(CFLAGS = "-O3"), system("R CMD SHLIB --preclean -c foo.c"))
unlink(c("foo.c", "foo.so"))
```
