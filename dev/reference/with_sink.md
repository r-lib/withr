# Output redirection

Temporarily divert output to a file via
[`sink()`](https://rdrr.io/r/base/sink.html). For sinks of type
`message`, an error is raised if such a sink is already active.

## Usage

``` r
with_output_sink(new, code, append = FALSE, split = FALSE)

local_output_sink(
  new = list(),
  append = FALSE,
  split = FALSE,
  .local_envir = parent.frame()
)

with_message_sink(new, code, append = FALSE)

local_message_sink(new = list(), append = FALSE, .local_envir = parent.frame())
```

## Arguments

- new:

  `[character(1)|connection]`  
  A writable [connection](https://rdrr.io/r/base/connections.html) or a
  character string naming the file to write to. Passing `NULL` will
  throw an error.

- code:

  `[any]`  
  Code to execute in the temporary environment

- append:

  logical. If `TRUE`, output will be appended to `file`; otherwise, it
  will overwrite the contents of `file`.

- split:

  logical: if `TRUE`, output will be sent to the new sink and to the
  current output stream, like the Unix program `tee`.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

[`sink()`](https://rdrr.io/r/base/sink.html)
