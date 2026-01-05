# DBMS Connections which disconnect themselves.

Connections to Database Management Systems which automatically
disconnect. In particular connections which are created with
[`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html) and
closed with
[`DBI::dbDisconnect()`](https://dbi.r-dbi.org/reference/dbDisconnect.html).

## Usage

``` r
with_db_connection(con, code)

local_db_connection(con, .local_envir = parent.frame())
```

## Arguments

- con:

  For `with_db_connection()` a named list with the connection(s) to
  create. For `local_db_connection()` the code to create a single
  connection, which is then returned.

- code:

  `[any]`  
  Code to execute in the temporary environment

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
db <- tempfile()
with_db_connection(
  list(con = DBI::dbConnect(RSQLite::SQLite(), db)), {
    DBI::dbWriteTable(con, "mtcars", mtcars)
})

head_db_table <- function(...) {
  con <- local_db_connection(DBI::dbConnect(RSQLite::SQLite(), db))
  head(DBI::dbReadTable(con, "mtcars"), ...)
}
head_db_table()
#>    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
unlink(db)
```
