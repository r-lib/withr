# callr

<details>

* Version: 3.4.4
* Source code: https://github.com/cran/callr
* URL: https://github.com/r-lib/callr#readme
* BugReports: https://github.com/r-lib/callr/issues
* Date/Publication: 2020-09-07 21:20:03 UTC
* Number of recursive dependencies: 57

Run `cloud_details(, "callr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4. libpath in system, R_LIBS and .Renviron (@test-libpath.R#142) - `new` argument of local_tempfile() is deprecated.
        Use `path <- local_tempfile()` instead.
      
      ══ Failed ══════════════════════════════════════════════════════════════════════
      ── 1. Error: messages in callr::r do not crash session (@test-messages.R#5)  ───
      callr subprocess failed: 'match' requires vector arguments
      Backtrace:
       1. callr::r(...) testthat/test-messages.R:5:2
       2. callr:::get_result(output = out, options)
       3. throw(newerr, parent = remerr[[2]])
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      No one is perfect!
      Error: Test failures
      Execution halted
    ```

# cliapp

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/cliapp
* URL: https://github.com/r-lib/cliapp#readme
* BugReports: https://github.com/r-lib/cliapp/issues
* Date/Publication: 2018-12-16 14:40:05 UTC
* Number of recursive dependencies: 44

Run `cloud_details(, "cliapp")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cliapp-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cli_alert
    > ### Title: CLI alerts
    > ### Aliases: cli_alert cli_alert_success cli_alert_danger cli_alert_warning
    > ###   cli_alert_info
    > 
    > ### ** Examples
    > 
    > 
    > cli_alert("Cannot lock package library.")
    → Cannot lock package library.
    Error in match(x, table, nomatch = 0L) : 
      'match' requires vector arguments
    Calls: cli_alert ... cli_server_default -> cli_server_default_safe -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      -- 5. Error: user's override  --------------------------------------------------
      'match' requires vector arguments
      Backtrace:
      
      == testthat results  ===========================================================
      [ OK: 114 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: events are properly generated (@test-subprocess.R#25) 
      2. Error: subprocess with default handler (@test-subprocess.R#53) 
      3. Failure: output in child process (@test-subprocess.R#117) 
      4. Failure: output in child process (@test-subprocess.R#118) 
      5. Error: user's override 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# languageserver

<details>

* Version: 0.3.6
* Source code: https://github.com/cran/languageserver
* URL: https://github.com/REditorSupport/languageserver
* Date/Publication: 2020-05-25 06:30:03 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "languageserver")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(languageserver)
      > test_check("languageserver")
      ── 1. Error: Language Server launches  ─────────────────────────────────────────
      attempt to apply non-function
      Backtrace:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 49 | SKIPPED: 43 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Language Server launches 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘callr’ ‘collections’ ‘desc’ ‘parallel’ ‘repr’
      All declared Imports should be used.
    ```

