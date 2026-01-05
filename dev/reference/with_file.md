# Files which delete themselves

Create files, which are then automatically removed afterwards.

## Usage

``` r
with_file(file, code)

local_file(.file, ..., .local_envir = parent.frame())
```

## Arguments

- file, .file:

  `[named list]`  
  Files to create.

- code:

  `[any]`  
  Code to execute in the temporary environment

- ...:

  Additional (possibly named) arguments of files to create.

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
with_file("file1", {
  writeLines("foo", "file1")
  readLines("file1")
})

with_file(list("file1" = writeLines("foo", "file1")), {
  readLines("file1")
})
```
