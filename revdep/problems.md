# arrow

<details>

* Version: 14.0.0.2
* GitHub: https://github.com/apache/arrow
* Source code: https://github.com/cran/arrow
* Date/Publication: 2023-12-02 01:30:03 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::cloud_details(, "arrow")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # Licensed to the Apache Software Foundation (ASF) under one
      > # or more contributor license agreements.  See the NOTICE file
      > # distributed with this work for additional information
      > # regarding copyright ownership.  The ASF licenses this file
      > # to you under the Apache License, Version 2.0 (the
      > # "License"); you may not use this file except in compliance
      > # with the License.  You may obtain a copy of the License at
    ...
       10.       └─testthat:::waldo_compare(...)
       11.         └─testthat:::local_reporter_output()
       12.           └─reporter$local_user_output(.env)
       13.             └─testthat::local_reproducible_output(...)
       14.               └─withr::local_language(lang, .local_envir = .env)
       15.                 └─withr:::check_language_envvar("LANG")
      
      [ FAIL 99 | WARN 6462 | SKIP 79 | PASS 6367 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 147.3Mb
      sub-directories of 1Mb or more:
        R       8.0Mb
        libs  138.6Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘readr’
    ```

# crosstable

<details>

* Version: 0.7.0
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2023-11-12 20:43:19 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
      ── Failure ('test-selection.R:57:3'): crosstable with external character vector ──
      `.` produced warnings.
      Backtrace:
          ▆
       1. ├─... %>% expect_silent() at test-selection.R:57:3
       2. └─testthat::expect_silent(.)
      
      [ FAIL 2 | WARN 380 | SKIP 38 | PASS 327 ]
      Error: Test failures
      Execution halted
    ```

# data.validator

<details>

* Version: 0.2.1
* GitHub: https://github.com/Appsilon/data.validator
* Source code: https://github.com/cran/data.validator
* Date/Publication: 2023-12-11 10:20:06 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::cloud_details(, "data.validator")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(data.validator)
      > 
      > report_test <- function() {
      +   dat <- data.frame(
      +     V1 = c(1, 2, 3),
      +     V2 = c("a", "b", "c")
    ...
      No columns selected, using all columns.
      No columns selected, using all columns.
      No columns selected, using all columns.
      No columns selected, using all columns.
      No columns selected, using all columns.
      [ FAIL 0 | WARN 106 | SKIP 0 | PASS 104 ]
      
      [ FAIL 0 | WARN 106 | SKIP 0 | PASS 104 ]
      Error: Tests generated warnings
      Execution halted
    ```

# DBItest

<details>

* Version: 1.8.0
* GitHub: https://github.com/r-dbi/DBItest
* Source code: https://github.com/cran/DBItest
* Date/Publication: 2023-12-21 14:30:02 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "DBItest")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘DBItest.Rmd’ using rmarkdown
    
    Quitting from lines 166-167 [simple] (DBItest.Rmd)
    Error: processing vignette 'DBItest.Rmd' failed with diagnostics:
    Test failed
    --- failed re-building ‘DBItest.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘DBItest.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dials

<details>

* Version: 1.2.0
* GitHub: https://github.com/tidymodels/dials
* Source code: https://github.com/cran/dials
* Date/Publication: 2023-04-03 15:30:10 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::cloud_details(, "dials")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(dials)
      Loading required package: scales
      > 
      > if (requireNamespace("xml2")) {
      +   test_check("dials", reporter = MultiReporter$new(reporters = list(JunitReporter$new(file = "test-results.xml"), CheckReporter$new())))
      + } else {
      +   test_check("dials")
      + }
      Loading required namespace: xml2
      Error in UseMethod("xml_add_child") : 
        no applicable method for 'xml_add_child' applied to an object of class "NULL"
      Calls: test_check ... o_apply -> lapply -> FUN -> <Anonymous> -> <Anonymous>
      Execution halted
    ```

# dm

<details>

* Version: 1.0.9
* GitHub: https://github.com/cynkra/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2024-01-08 12:00:05 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > 
      > # Need to use qualified call, this is checked in helper-print.R
      > testthat::test_check("dm")
      Loading required package: dm
      
      Attaching package: 'dm'
    ...
      • draw-dm/nycflight-dm.svg
      • draw-dm/single-empty-table-dm.svg
      • draw-dm/table-desc-1-dm.svg
      • draw-dm/table-desc-2-dm.svg
      • draw-dm/table-desc-3-dm.svg
      • draw-dm/table-desc-4-dm.svg
      • draw-dm/table-uk-1-dm.svg
      • draw-dm/table-uk-2-dm.svg
      Error: Test failures
      Execution halted
    ```

# downlit

<details>

* Version: 0.4.3
* GitHub: https://github.com/r-lib/downlit
* Source code: https://github.com/cran/downlit
* Date/Publication: 2023-06-29 22:40:08 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::cloud_details(, "downlit")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(downlit)
      > 
      > test_check("downlit")
      [ FAIL 2 | WARN 291 | SKIP 28 | PASS 119 ]
      
      ══ Skipped tests (28) ══════════════════════════════════════════════════════════
    ...
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Failure ('test-topic-index.R:31:3'): can find topic in attached packages ────
      find_rdname_attached("unit") (`actual`) not equal to list(rdname = "unit", package = "grid") (`expected`).
      
      `actual` is NULL
      `expected` is a list
      
      [ FAIL 2 | WARN 291 | SKIP 28 | PASS 119 ]
      Error: Test failures
      Execution halted
    ```

# dplyr

<details>

* Version: 1.1.4
* GitHub: https://github.com/tidyverse/dplyr
* Source code: https://github.com/cran/dplyr
* Date/Publication: 2023-11-17 16:50:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "dplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(dplyr)
      
      Attaching package: 'dplyr'
      
      The following object is masked from 'package:testthat':
      
    ...
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-rows.R:161:3'): rows_update() works ──────────────────────────
      `expect_identical(...)` produced warnings.
      ── Failure ('test-rows.R:258:3'): rows_patch() works ───────────────────────────
      `expect_identical(...)` produced warnings.
      
      [ FAIL 2 | WARN 5031 | SKIP 329 | PASS 2860 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# exuber

<details>

* Version: 1.0.2
* GitHub: https://github.com/kvasilopoulos/exuber
* Source code: https://github.com/cran/exuber
* Date/Publication: 2023-03-22 23:10:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "exuber")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(exuber)
      > 
      > test_check("exuber")
      [ FAIL 2 | WARN 54 | SKIP 4 | PASS 199 ]
      
    ...
       29.                           └─testthat:::waldo_compare(before, after, x_arg = "before", y_arg = "after")
       30.                             └─testthat:::local_reporter_output()
       31.                               └─reporter$local_user_output(.env)
       32.                                 └─testthat::local_reproducible_output(...)
       33.                                   └─withr::local_language(lang, .local_envir = .env)
       34.                                     └─withr:::check_language_envvar("LANG")
      
      [ FAIL 2 | WARN 54 | SKIP 4 | PASS 199 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        libs   4.4Mb
    ```

# gargle

<details>

* Version: 1.5.2
* GitHub: https://github.com/r-lib/gargle
* Source code: https://github.com/cran/gargle
* Date/Publication: 2023-07-20 18:50:08 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "gargle")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(gargle)
      > 
      > test_check("gargle")
      [ FAIL 29 | WARN 501 | SKIP 82 | PASS 214 ]
      
    ...
      ── Error ('test-response_process.R:53:3'): HTML error is offered as a file ─────
      Error in `readLines(path_to_html_error)`: 'con' is not a connection
      Backtrace:
          ▆
       1. └─testthat::expect_snapshot(...) at test-response_process.R:53:3
       2.   └─rlang::cnd_signal(state$error)
      
      [ FAIL 29 | WARN 501 | SKIP 82 | PASS 214 ]
      Error: Test failures
      Execution halted
    ```

# httr2

<details>

* Version: 1.0.0
* GitHub: https://github.com/r-lib/httr2
* Source code: https://github.com/cran/httr2
* Date/Publication: 2023-11-14 13:53:23 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "httr2")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(httr2)
      
      Attaching package: 'httr2'
      
      The following objects are masked from 'package:testthat':
      
    ...
      out[[3]] inherits from 'httr2_response' not 'httr2_http_404'.
      ── Failure ('test-sequential.R:56:3'): on_error = 'return' returns error ───────
      out[[4]] (`actual`) not equal to NULL (`expected`).
      
      `actual` is an S3 object of class <httr2_response>, a list
      `expected` is NULL
      
      [ FAIL 37 | WARN 877 | SKIP 82 | PASS 404 ]
      Error: Test failures
      Execution halted
    ```

# lintr

<details>

* Version: 3.1.1
* GitHub: https://github.com/r-lib/lintr
* Source code: https://github.com/cran/lintr
* Date/Publication: 2023-11-07 16:10:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "lintr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘lintr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_r_string
    > ### Title: Extract text from 'STR_CONST' nodes
    > ### Aliases: get_r_string
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
    + # more importantly, extract strings under R>=4 raw strings
    + ## Don't show: 
    + }) # examplesIf
    > tmp <- withr::local_tempfile(lines = "c('a', 'b')")
    > expr_as_xml <- get_source_expressions(tmp)$expressions[[1L]]$xml_parsed_content
    Warning in file(con, "r") :
      cannot open file '/tmp/RtmpvdTETg/filecb67a5916f4': No such file or directory
    Error in file(con, "r") : cannot open the connection
    Calls: <Anonymous> ... read_lines -> withCallingHandlers -> readLines -> file
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘data.table’
    ```

# mockr

<details>

* Version: 0.2.1
* GitHub: https://github.com/krlmlr/mockr
* Source code: https://github.com/cran/mockr
* Date/Publication: 2023-02-01 12:20:02 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "mockr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(mockr)
      
      Attaching package: 'mockr'
      
      The following objects are masked from 'package:testthat':
      
    ...
      `expect_null(with_mock())` produced unexpected warnings.
      Expected match: Not (?:mocking|evaluating) anything
      Actual values:
      * Not mocking anything. Please use named arguments to specify the functions you want to mock.
      * Not evaluating anything. Please use unnamed arguments to specify expressions you want to evaluate.
      * Changing language has no effect when envvar LANG='C.UTF-8'
      
      [ FAIL 1 | WARN 27 | SKIP 0 | PASS 51 ]
      Error: Test failures
      Execution halted
    ```

# move2

<details>

* Version: 0.2.7
* GitHub: NA
* Source code: https://github.com/cran/move2
* Date/Publication: 2023-12-13 11:30:02 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "move2")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(move2)
      > 
      > 
      > test_check("move2")
      Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1; sf_use_s2() is TRUE
      Joining with `by = join_by(`individual-local-identifier`)`
    ...
      ── Failure ('test-mt_filter_unique.R:64:3'): Filtering with additional columns ──
      `expect_identical(...)` produced warnings.
      ── Failure ('test-mt_filter_unique.R:65:3'): Filtering with additional columns ──
      `expect_identical(...)` produced warnings.
      ── Failure ('test-mt_stack.R:187:3'): duplicate individuals rename ─────────────
      `expect_identical(...)` produced warnings.
      
      [ FAIL 5 | WARN 637 | SKIP 14 | PASS 655 ]
      Error: Test failures
      Execution halted
    ```

# rlang

<details>

* Version: 1.1.3
* GitHub: https://github.com/r-lib/rlang
* Source code: https://github.com/cran/rlang
* Date/Publication: 2024-01-10 12:00:02 UTC
* Number of recursive dependencies: 70

Run `revdepcheck::cloud_details(, "rlang")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘sink.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # Workaround for loadNamespace() failure on R 3.2
      > requireNamespace("rlang")
      Loading required namespace: rlang
      > 
      > library("testthat")
      > library("rlang")
    ...
       10.     └─testthat:::waldo_compare(...)
       11.       └─testthat:::local_reporter_output()
       12.         └─reporter$local_user_output(.env)
       13.           └─testthat::local_reproducible_output(...)
       14.             └─withr::local_language(lang, .local_envir = .env)
       15.               └─withr:::check_language_envvar("LANG")
      
      [ FAIL 8 | WARN 5680 | SKIP 251 | PASS 3867 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘winch’
    ```

# RSQLite

<details>

* Version: 2.3.4
* GitHub: https://github.com/r-dbi/RSQLite
* Source code: https://github.com/cran/RSQLite
* Date/Publication: 2023-12-08 00:10:13 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "RSQLite")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/tests.html
      > # * https://testthat.r-lib.org/reference/test_package.html#special-files
    ...
       61.           └─reporter$local_user_output(.env)
       62.             └─testthat::local_reproducible_output(...)
       63.               └─withr::local_language(lang, .local_envir = .env)
       64.                 └─withr:::check_language_envvar("LANG")
      
      [ FAIL 1 | WARN 843 | SKIP 7 | PASS 685 ]
      Error: Test failures
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.4Mb
      sub-directories of 1Mb or more:
        libs  13.6Mb
    ```

# sass

<details>

* Version: 0.4.8
* GitHub: https://github.com/rstudio/sass
* Source code: https://github.com/cran/sass
* Date/Publication: 2023-12-06 05:00:02 UTC
* Number of recursive dependencies: 59

Run `revdepcheck::cloud_details(, "sass")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(sass)
      > 
      > test_check("sass")
      [ FAIL 1 | WARN 307 | SKIP 4 | PASS 188 ]
      
      ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
    ...
       12.           └─reporter$local_user_output(.env)
       13.             └─testthat::local_reproducible_output(...)
       14.               └─withr::local_language(lang, .local_envir = .env)
       15.                 └─withr:::check_language_envvar("LANG")
      
      [ FAIL 1 | WARN 307 | SKIP 4 | PASS 188 ]
      Deleting unused snapshots:
      • font-objects/font-css
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc    1.7Mb
        libs   3.4Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# testthat

<details>

* Version: 3.2.1
* GitHub: https://github.com/r-lib/testthat
* Source code: https://github.com/cran/testthat
* Date/Publication: 2023-12-02 11:50:05 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "testthat")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-catch.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("testthat")
      Starting 2 test processes
      [ FAIL 43 | WARN 798 | SKIP 32 | PASS 601 ]
      
      ══ Skipped tests (32) ══════════════════════════════════════════════════════════
    ...
      • R4.1/snapshot-file/version.txt
      • R4.2/snapshot-file/version.txt
      • R4.3/snapshot-file/version.txt
      • snapshot-file/a.txt
      • snapshot-file/foo.csv
      • snapshot-file/foo.png
      • snapshot-file/foo.r
      • snapshot-file/secret.txt
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘custom-expectation.Rmd’ using rmarkdown
    --- finished re-building ‘custom-expectation.Rmd’
    
    --- re-building ‘parallel.Rmd’ using rmarkdown
    --- finished re-building ‘parallel.Rmd’
    
    --- re-building ‘skipping.Rmd’ using rmarkdown
    --- finished re-building ‘skipping.Rmd’
    
    ...
    --- failed re-building ‘test-fixtures.Rmd’
    
    --- re-building ‘third-edition.Rmd’ using rmarkdown
    --- finished re-building ‘third-edition.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘test-fixtures.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 12.0Mb
      sub-directories of 1Mb or more:
        R      1.9Mb
        libs   8.5Mb
    ```

# vegawidget

<details>

* Version: 0.4.3
* GitHub: https://github.com/vegawidget/vegawidget
* Source code: https://github.com/cran/vegawidget
* Date/Publication: 2023-09-03 04:40:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "vegawidget")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vegawidget)
      > 
      > test_check("vegawidget")
      
      Attaching package: 'rlang'
      
    ...
        'test-to-image.R:78:3', 'test-to-image.R:100:3', 'test-to-vega.R:6:3',
        'test-vega-version.R:3:3', 'test-vegaspec.R:86:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-rlang-check.R:14:3'): rlang functions work and are silent ────
      `expect_identical(NULL %||% 4, 4)` produced warnings.
      
      [ FAIL 1 | WARN 141 | SKIP 10 | PASS 101 ]
      Error: Test failures
      Execution halted
    ```

# vetiver

<details>

* Version: 0.2.5
* GitHub: https://github.com/rstudio/vetiver-r
* Source code: https://github.com/cran/vetiver
* Date/Publication: 2023-11-16 22:50:02 UTC
* Number of recursive dependencies: 217

Run `revdepcheck::cloud_details(, "vetiver")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vetiver)
      > 
      > test_check("vetiver")
      Loading required package: ggplot2
      Loading required package: lattice
      
    ...
      Backtrace:
          ▆
       1. └─testthat::describe(...) at test-rsconnect.R:3:1
       2.   └─base::eval(substitute(code), describe_environment)
       3.     └─base::eval(substitute(code), describe_environment)
       4.       └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 1 | WARN 414 | SKIP 63 | PASS 177 ]
      Error: Test failures
      Execution halted
    ```

# vroom

<details>

* Version: 1.6.5
* GitHub: https://github.com/tidyverse/vroom
* Source code: https://github.com/cran/vroom
* Date/Publication: 2023-12-05 23:50:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "vroom")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vroom)
      
      Attaching package: 'vroom'
      
      The following object is masked from 'package:testthat':
    ...
        9.     └─testthat:::waldo_compare(...)
       10.       └─testthat:::local_reporter_output()
       11.         └─reporter$local_user_output(.env)
       12.           └─testthat::local_reproducible_output(...)
       13.             └─withr::local_language(lang, .local_envir = .env)
       14.               └─withr:::check_language_envvar("LANG")
      
      [ FAIL 1 | WARN 875 | SKIP 13 | PASS 1084 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 27.5Mb
      sub-directories of 1Mb or more:
        libs  25.9Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘readr’
    ```

