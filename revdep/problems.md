# batchtools

Version: 0.9.6

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      4. Failure: cf ssh (@test_ClusterFunctionsSSH.R#22) ----------------------------
      findNotDone(reg = reg) not equal to findJobs(ids = 2, reg = reg).
      Different number of rows
      
      
      testthat results ================================================================
      OK: 1233 SKIPPED: 6 FAILED: 4
      1. Failure: cf ssh (@test_ClusterFunctionsSSH.R#13) 
      2. Failure: cf ssh (@test_ClusterFunctionsSSH.R#13) 
      3. Failure: cf ssh (@test_ClusterFunctionsSSH.R#21) 
      4. Failure: cf ssh (@test_ClusterFunctionsSSH.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Rmpi’
    ```

# caret

Version: 6.0-77

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        R        2.9Mb
        data     1.5Mb
        models   2.4Mb
    ```

# covr

Version: 3.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      x[115]: S4.R<\\/a>\"],[38],[6],[6],[0],[\"2\"]],\"container\":\"<table class=\\\"d
      x[115]: isplay\\\">\\n  <thead>\\n    <tr>\\n      <th>Coverage<\\/th>\\n      ...
      y[115]: "          <script type=\"application/json\" data-for=\"htmlwidget-eaef49d
      y[115]: 4a484bc22a8b4\">{\"x\":{\"filter\":\"none\",\"data\":[[\"<div class=\\\"co
      y[115]: verage-box coverage-high\\\">100.00\\u003c/div>\"],[\"<a href=\\\"#\\\">R/
      y[115]: TestS4.R\\u003c/a>\"],[38],[6],[6],[0],[\"2\"]],\"container\":\"<table cla
      y[115]: ss=\\\"display\\\">\\n  <thead>\\n    <tr>\\n      <th>Coverage\\u003c/...
      
      
      testthat results ================================================================
      OK: 239 SKIPPED: 0 FAILED: 1
      1. Failure: it works with coverage objects (@test-report.R#28) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# DBItest

Version: 1.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘desc’
      All declared Imports should be used.
    ```

# DeepBlueR

Version: 1.2.10

## In both

*   R CMD check timed out
    

# dplyr

Version: 0.7.4

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# ggExtra

Version: 0.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘grDevices’
      All declared Imports should be used.
    ```

# pathological

Version: 0.1-2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘R.utils’
    ```

# processx

Version: 2.0.0.1

## In both

*   checking compiled code ... NOTE
    ```
    File ‘processx/libs/processx.so’:
      Found non-API call to R: ‘R_new_custom_connection’
    
    Compiled code should not call non-API entry points in R.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# readat

Version: 1.2.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    sfread: no visible binding for global variable ‘header’
      (.../revdep/checks/readat/new/readat.Rcheck/00_pkg_src/readat/R/sfread.R:54)
    sfread: no visible binding for global variable ‘nrows’
      (.../revdep/checks/readat/new/readat.Rcheck/00_pkg_src/readat/R/sfread.R:54)
    Undefined global functions or variables:
      header nrows
    ```

