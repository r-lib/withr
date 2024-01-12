# cloudfs

<details>

* Version: 0.1.2
* GitHub: https://github.com/g6t/cloudfs
* Source code: https://github.com/cran/cloudfs
* Date/Publication: 2023-10-18 15:30:08 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "cloudfs")` for more info

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
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
       3. │   └─testthat:::quasi_capture(...)
       4. │     ├─testthat (local) .capture(...)
       5. │     │ └─base::withCallingHandlers(...)
       6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       7. └─testthat::with_mocked_bindings(...)
       8.   └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 2 | WARN 0 | SKIP 2 | PASS 2 ]
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
      [ FAIL 2 | WARN 0 | SKIP 28 | PASS 119 ]
      
      ══ Skipped tests (28) ══════════════════════════════════════════════════════════
    ...
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Failure ('test-topic-index.R:31:3'): can find topic in attached packages ────
      find_rdname_attached("unit") (`actual`) not equal to list(rdname = "unit", package = "grid") (`expected`).
      
      `actual` is NULL
      `expected` is a list
      
      [ FAIL 2 | WARN 0 | SKIP 28 | PASS 119 ]
      Error: Test failures
      Execution halted
    ```

# epidatr

<details>

* Version: 1.0.0
* GitHub: https://github.com/cmu-delphi/epidatr
* Source code: https://github.com/cran/epidatr
* Date/Publication: 2023-09-19 14:10:02 UTC
* Number of recursive dependencies: 89

Run `revdepcheck::cloud_details(, "epidatr")` for more info

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
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Error ('test-epidatacall.R:143:1'): classic only fetch ──────────────────────
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'content'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 8 | WARN 3 | SKIP 0 | PASS 160 ]
      Error: Test failures
      Execution halted
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
      [ FAIL 29 | WARN 8 | SKIP 82 | PASS 214 ]
      
    ...
      ── Error ('test-response_process.R:53:3'): HTML error is offered as a file ─────
      Error in `readLines(path_to_html_error)`: 'con' is not a connection
      Backtrace:
          ▆
       1. └─testthat::expect_snapshot(...) at test-response_process.R:53:3
       2.   └─rlang::cnd_signal(state$error)
      
      [ FAIL 29 | WARN 8 | SKIP 82 | PASS 214 ]
      Error: Test failures
      Execution halted
    ```

# gmailr

<details>

* Version: 2.0.0
* GitHub: https://github.com/r-lib/gmailr
* Source code: https://github.com/cran/gmailr
* Date/Publication: 2023-06-30 05:40:02 UTC
* Number of recursive dependencies: 57

Run `revdepcheck::cloud_details(, "gmailr")` for more info

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
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-gm_auth.R:28:1'): gm_auth() errors informatively ───────────────
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'gm_default_oauth_client'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 1 | WARN 0 | SKIP 21 | PASS 60 ]
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
      
      [ FAIL 37 | WARN 0 | SKIP 82 | PASS 404 ]
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
      cannot open file '/tmp/RtmpLavXx8/filecb46c69db2c': No such file or directory
    Error in file(con, "r") : cannot open the connection
    Calls: <Anonymous> ... read_lines -> withCallingHandlers -> readLines -> file
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘data.table’
    ```

# odbc

<details>

* Version: 1.4.1
* GitHub: https://github.com/r-dbi/odbc
* Source code: https://github.com/cran/odbc
* Date/Publication: 2023-12-21 05:40:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "odbc")` for more info

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
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Error ('test-odbc-config.R:28:1'): odbcListConfig errors informatively with unexpected odbcinst output ──
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'system'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 9 | WARN 0 | SKIP 18 | PASS 44 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.5Mb
      sub-directories of 1Mb or more:
        libs  12.6Mb
    ```

# paws.common

<details>

* Version: 0.7.0
* GitHub: https://github.com/paws-r/paws
* Source code: https://github.com/cran/paws.common
* Date/Publication: 2024-01-09 06:40:02 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "paws.common")` for more info

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
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
    ...
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_credential_providers.R:59:1'): config_file_provider ────────────
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'get_assume_role_with_web_identity_creds'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 1 | WARN 0 | SKIP 10 | PASS 920 ]
      Error: Test failures
      Execution halted
    ```

# reprex

<details>

* Version: 2.1.0
* GitHub: https://github.com/tidyverse/reprex
* Source code: https://github.com/cran/reprex
* Date/Publication: 2024-01-11 08:30:04 UTC
* Number of recursive dependencies: 81

Run `revdepcheck::cloud_details(, "reprex")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(reprex)
      > 
      > if (rmarkdown::pandoc_available("2.0.0")) {
      +   test_check("reprex")
      + }
    ...
      ── Error ('test-utils.R:2:3'): locate_input() works ────────────────────────────
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'reprex_clipboard'
      Backtrace:
          ▆
       1. └─testthat::with_mocked_bindings(...) at test-utils.R:2:3
       2.   └─rlang (local) `<fn>`(`<env>`) at test-utils.R:2:3
      
      [ FAIL 1 | WARN 0 | SKIP 65 | PASS 58 ]
      Error: Test failures
      Execution halted
    ```

# rsconnect

<details>

* Version: 1.2.0
* GitHub: https://github.com/rstudio/rsconnect
* Source code: https://github.com/cran/rsconnect
* Date/Publication: 2023-12-15 03:20:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "rsconnect")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(rsconnect)
      > 
      > test_check("rsconnect")
      Starting 2 test processes
      [ FAIL 18 | WARN 0 | SKIP 144 | PASS 628 ]
      
    ...
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Error ('test-servers.R:188:1'): findServer() errors/prompts of multiple servers present ──
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'servers'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 18 | WARN 0 | SKIP 144 | PASS 628 ]
      Error: Test failures
      Execution halted
    ```

# shiny.telemetry

<details>

* Version: 0.2.0
* GitHub: https://github.com/Appsilon/shiny.telemetry
* Source code: https://github.com/cran/shiny.telemetry
* Date/Publication: 2023-11-16 15:30:02 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "shiny.telemetry")` for more info

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
       2.   └─rlang (local) `<fn>`(`<env>`) at test-telemetry-integration-sqlite.R:10:3
      ── Error ('test-telemetry.R:136:3'): Telemetry tests with mock data_storage layer ──
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'observeEvent'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 3 | WARN 0 | SKIP 16 | PASS 87 ]
      Error: Test failures
      Execution halted
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
      [ FAIL 44 | WARN 0 | SKIP 74 | PASS 828 ]
      
      ══ Skipped tests (74) ══════════════════════════════════════════════════════════
    ...
      ── Error ('test-try-again.R:8:1'): tries multiple times ────────────────────────
      Error in `call_type(call)`: corrupt language object
      ── Error ('test-verify-output.R:15:1'): can record all types of output ─────────
      Error in `call_type(call)`: corrupt language object
      ── Error ('test-verify-output.R:41:1'): can't record plots ─────────────────────
      Error in `call_type(call)`: corrupt language object
      
      [ FAIL 44 | WARN 0 | SKIP 74 | PASS 828 ]
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

# usethis

<details>

* Version: 2.2.2
* GitHub: https://github.com/r-lib/usethis
* Source code: https://github.com/cran/usethis
* Date/Publication: 2023-07-06 00:20:02 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "usethis")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(usethis)
      > 
      > test_check("usethis")
      [ FAIL 31 | WARN 0 | SKIP 103 | PASS 615 ]
      
    ...
       1. └─rlang (local) `<fn>`(`<env>`)
      ── Error ('test-version.R:47:1'): use_version() updates (development version) directly ──
      Error in `env_bind0(.env, old)`: cannot change value of locked binding for 'cran_version'
      Backtrace:
          ▆
       1. └─rlang (local) `<fn>`(`<env>`)
      
      [ FAIL 31 | WARN 0 | SKIP 103 | PASS 615 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
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
      
      [ FAIL 1 | WARN 0 | SKIP 63 | PASS 177 ]
      Error: Test failures
      Execution halted
    ```

