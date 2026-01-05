# Temporary files and directories

Temporarily create a file or directory, which will automatically deleted
once you're finished with it.

## Usage

``` r
with_tempfile(
  new,
  code,
  envir = parent.frame(),
  .local_envir = parent.frame(),
  pattern = "file",
  tmpdir = tempdir(),
  fileext = ""
)

local_tempfile(
  new = NULL,
  lines = NULL,
  envir = parent.frame(),
  .local_envir = parent.frame(),
  pattern = "file",
  tmpdir = tempdir(),
  fileext = ""
)

with_tempdir(
  code,
  clean = TRUE,
  pattern = "file",
  tmpdir = tempdir(),
  fileext = ""
)

local_tempdir(
  pattern = "file",
  tmpdir = tempdir(),
  fileext = "",
  .local_envir = parent.frame(),
  clean = TRUE
)
```

## Arguments

- new:

  `[character vector]`  
  (Deprecated for `local_tempfile()`) Names of temporary file handles to
  create.

- code:

  `[any]`  
  Code to execute in the temporary environment

- envir:

  `[environment]`  
  Deprecated in favor of `.local_envir`.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

- pattern:

  a non-empty character vector giving the initial part of the name.

- tmpdir:

  a non-empty character vector giving the directory name.

- fileext:

  a non-empty character vector giving the file extension.

- lines:

  Optionally, supply a character vector of lines to be written to
  `path`. This is useful if you want to seed the file with some default
  content.

- clean:

  `[logical(1)]`  
  A logical indicating if the temporary directory should be deleted
  after use (`TRUE`, default) or left alone (`FALSE`).

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

## Examples

``` r
# local_tempfile() is the easiest to use because it returns a path
local({
  path1 <<- local_tempfile(lines = c("x,y", "1,2"))
  readLines(path1)
})
#> [1] "x,y" "1,2"
# the file is deleted automatically
file.exists(path1)
#> [1] FALSE

# with_tempfile() is a bit trickier; the first argument gives the name
# of a variable that will contain the path:
with_tempfile("path2", {
  print(path2)
  write.csv(iris, path2)
  file.size(path2)
})
#> [1] "/tmp/RtmpvIFsFU/file1c6711559ee8"
#> [1] 4821

# Note that this variable is only available in the scope of with_tempfile
try(path2)
#> Error in eval(expr, envir) : object 'path2' not found
```
