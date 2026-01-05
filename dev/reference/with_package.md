# Execute code with a modified search path

`with_package()` attaches a package to the search path, executes the
code, then removes the package from the search path. The package
namespace is *not* unloaded however. `with_namespace()` does the same
thing, but attaches the package namespace to the search path, so all
objects (even unexported ones) are also available on the search path.

## Usage

``` r
with_package(
  package,
  code,
  pos = 2,
  lib.loc = NULL,
  character.only = TRUE,
  logical.return = FALSE,
  warn.conflicts = FALSE,
  quietly = TRUE,
  verbose = getOption("verbose")
)

local_package(
  package,
  pos = 2,
  lib.loc = NULL,
  character.only = TRUE,
  logical.return = FALSE,
  warn.conflicts = FALSE,
  quietly = TRUE,
  verbose = getOption("verbose"),
  .local_envir = parent.frame()
)

with_namespace(package, code, warn.conflicts = FALSE)

local_namespace(package, .local_envir = parent.frame(), warn.conflicts = FALSE)

with_environment(
  env,
  code,
  pos = 2L,
  name = format(env),
  warn.conflicts = FALSE
)

local_environment(
  env,
  pos = 2L,
  name = format(env),
  warn.conflicts = FALSE,
  .local_envir = parent.frame()
)
```

## Arguments

- package:

  `[character(1)]`  
  package name to load.

- code:

  `[any]`  
  Code to execute in the temporary environment

- pos:

  the position on the search list at which to attach the loaded
  namespace. Can also be the name of a position on the current search
  list as given by [`search()`](https://rdrr.io/r/base/search.html).

- lib.loc:

  a character vector describing the location of R library trees to
  search through, or `NULL`. The default value of `NULL` corresponds to
  all libraries currently known to
  [`.libPaths()`](https://rdrr.io/r/base/libPaths.html). Non-existent
  library trees are silently ignored.

- character.only:

  a logical indicating whether `package` or `help` can be assumed to be
  character strings.

- logical.return:

  logical. If it is `TRUE`, `FALSE` or `TRUE` is returned to indicate
  success.

- warn.conflicts:

  logical. If `TRUE`, warnings are printed about
  [`conflicts`](https://rdrr.io/r/base/conflicts.html) from attaching
  the new package. A conflict is a function masking a function, or a
  non-function masking a non-function. The default is `TRUE` unless
  specified as `FALSE` in the `conflicts.policy` option.

- quietly:

  a logical. If `TRUE`, no message confirming package attaching is
  printed, and most often, no errors/warnings are printed if package
  attaching fails.

- verbose:

  a logical. If `TRUE`, additional diagnostics are printed.

- .local_envir:

  `[environment]`  
  The environment to use for scoping.

- env:

  `[environment()]`  
  Environment to attach.

- name:

  name to use for the attached database. Names starting with `package:`
  are reserved for [`library`](https://rdrr.io/r/base/library.html).

## Value

`[any]`  
The results of the evaluation of the `code` argument.

## See also

[`withr`](https://withr.r-lib.org/dev/reference/withr.md) for examples

## Examples

``` r
if (FALSE) { # \dontrun{
with_package("ggplot2", {
  ggplot(mtcars) + geom_point(aes(wt, hp))
})
} # }
```
