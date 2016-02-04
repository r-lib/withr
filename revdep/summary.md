# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.3 (2015-12-10) |
|system   |x86_64, darwin15.2.0         |
|ui       |unknown                      |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/New_York             |
|date     |2016-02-04                   |

## Packages

|package | * |version |date |source | * |
|:-------|:--|:-------|:----|:------|:--|

# Check results
1 checked out of 1 dependencies

## devtools (1.10.0)
Maintainer: Hadley Wickham <hadley@rstudio.com>
Bug reports: https://github.com/hadley/devtools/issues

```
checking foreign function calls ... NOTE
Registration problem:
  Evaluating ‘dll$foo’ during check gives error
‘object 'dll' not found’:
   .C(dll$foo, 0L)
See chapter ‘System and foreign language interfaces’ in the ‘Writing R
Extensions’ manual.
```
```
checking R code for possible problems ... NOTE
Found the following calls to attach():
File ‘devtools/R/package-env.r’:
  attach(NULL, name = pkg_env_name(pkg))
File ‘devtools/R/shims.r’:
  attach(e, name = "devtools_shims", warn.conflicts = FALSE)
See section ‘Good practice’ in ‘?attach’.
```
```
DONE
Status: 2 NOTEs
```
