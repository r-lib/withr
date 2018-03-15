# batchtools

Version: 0.9.8

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘doMPI’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Rmpi’
    
    
    
    
    
    
    ```

# caret

Version: 6.0-78

## In both

*   checking Rd cross-references ... WARNING
    ```
    ...
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        R        2.9Mb
        data     1.5Mb
        models   2.4Mb
    ```

# DeepBlueR

Version: 1.2.10

## In both

*   checking examples ... ERROR
    ```
    ...
    + }
    Called method: deepblue_list_experiments
    Reported status was: okay
    Called method: deepblue_list_experiments
    Reported status was: okay
    Called method: deepblue_list_experiments
    Reported status was: okay
    > 
    > deepblue_enrich_region_overlap(
    +   query_id=filtered_query_id,
    +   background_query=rg_10kb_tilling,
    +   datasets=histones_datasets,
    +   genome="grch38")
    Called method: deepblue_enrich_region_overlap
    Reported status was: error
    Error in deepblue_enrich_region_overlap(query_id = filtered_query_id,  : 
      Command enrich_region_overlap does not exists.
    Execution halted
    
    
    
    ```

*   R CMD check timed out
    

# dplyr

Version: 0.7.4

## In both

*   checking tests ...
    ```
    ...
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: eval_bare(get_expr(quo), get_env(quo))
      4: summarise(gdf, out = 1:2)
      5: summarise.tbl_df(gdf, out = 1:2) at .../revdep/checks/dplyr/new/dplyr.Rcheck/00_pkg_src/dplyr/R/manip.r:172
      6: summarise_impl(.data, dots) at .../revdep/checks/dplyr/new/dplyr.Rcheck/00_pkg_src/dplyr/R/tbl-df.r:98
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 2670 SKIPPED: 6 FAILED: 3
      1. Error: mutate() supports unquoted values (@test-mutate.r#721) 
      2. Failure: summarise() supports unquoted values (@test-summarise.r#980) 
      3. Error: summarise() supports unquoted values (@test-summarise.r#985) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    
    
    
    
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        libs   3.6Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    
    
    ```

# drake

Version: 5.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘igraph’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# fakemake

Version: 1.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘igraph’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# fs

Version: 1.2.0

## In both

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# ggExtra

Version: 0.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘grDevices’
      All declared Imports should be used.
    
    
    
    
    
    
    
    
    
    
    
    
    
    ```

# harvestr

Version: 0.7.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    --smart/-S has been removed.  Use +smart or -smart extension instead.
    For example: pandoc -f markdown+smart -t markdown-smart.
    Try pandoc --help for more information.
    Error: processing vignette 'harvestr.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 2
    Execution halted
    
    
    
    ```

# miniCRAN

Version: 0.2.11

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘igraph’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
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

# RPostgres

Version: 1.0-4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘withr’
      All declared Imports should be used.
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ```

# skimr

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    
    
    
    
    
    
    
    
    
    
    
    
    ```

# styler

Version: 1.0.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘styler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: create_node_from_nested_root
    > ### Title: Convert a nested tibble into a node tree
    > ### Aliases: create_node_from_nested_root
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    > if (getRversion() >= 3.2) {
    + code <- "a <- function(x) { if(x > 1) { 1+1 } else {x} }"
    + nested_pd <- styler:::compute_parse_data_nested(code)
    + initialized <- styler:::pre_visit(nested_pd, c(default_style_guide_attributes))
    + styler:::create_node_from_nested_root(initialized, structure_only = FALSE)
    + }
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘igraph’
    Calls: <Anonymous> ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
    ...
    
    
    
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 50 SKIPPED: 4 FAILED: 92
      1. Error: reindent function declaration (@test-fun_dec.R#2) 
      2. Error: indention on one-liner curley only is not changed (@test-indention_curly.R#4) 
      3. Error: indention with multi-line curley only is correct (@test-indention_curly.R#11) 
      4. Error: indention with multi-line curley and round is correct (@test-indention_curly.R#19) 
      5. Error: complete styling via top level api is correct (round, curly, spacing) (@test-indention_curly.R#29) 
      6. Error: multiple round brackets don't cause extraindention (@test-indention_multiple.R#4) 
      7. Error: multiple curly brackets don't cause extraindention (@test-indention_multiple.R#15) 
      8. Error: multiple curly and round brackets don't cause extraindention (@test-indention_multiple.R#23) 
      9. Error: multiple curly and round brackets overall test (@test-indention_multiple.R#32) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

