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
      cannot open file '/tmp/RtmpKeEwV5/fileb911a9320f5': No such file or directory
    Error in file(con, "r") : cannot open the connection
    Calls: <Anonymous> ... read_lines -> withCallingHandlers -> readLines -> file
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘data.table’
    ```

# rsi

<details>

* Version: 0.1.0
* GitHub: https://github.com/Permian-Global-Research/rsi
* Source code: https://github.com/cran/rsi
* Date/Publication: 2024-01-10 14:00:02 UTC
* Number of recursive dependencies: 78

Run `revdepcheck::cloud_details(, "rsi")` for more info

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
       3. │   └─rlang::eval_bare(values, get_env(fn))
       4. ├─base::unique(...)
       5. ├─base::unlist(spectral_indices(download_indices = FALSE, update_cache = FALSE)$platforms)
       6. └─rsi::spectral_indices(download_indices = FALSE, update_cache = FALSE)
       7.   ├─tibble::as_tibble(readRDS(indices_path))
       8.   └─base::readRDS(indices_path)
      
      [ FAIL 1 | WARN 1 | SKIP 18 | PASS 49 ]
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

