# goodpractice

<details>

* Version: 1.0.4
* GitHub: https://github.com/mangothecat/goodpractice
* Source code: https://github.com/cran/goodpractice
* Date/Publication: 2022-08-30 19:00:02 UTC
* Number of recursive dependencies: 73

Run `revdepcheck::cloud_details(, "goodpractice")` for more info

</details>

## Newly broken

*   checking whether the package can be loaded ... ERROR
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package has a loading problem: see the messages for
    details.
    ```

*   checking whether the package can be loaded with stated dependencies ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package (or one of its dependent packages) has an
    unstated dependence on a standard package.  All dependencies must be
    declared in DESCRIPTION.
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    ```

*   checking loading without being on the library search path ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package has a loading problem when not on .libPaths:
    see the messages for details.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
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

*   checking whether the package can be loaded ... ERROR
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package has a loading problem: see the messages for
    details.
    ```

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
      cannot open file '/tmp/Rtmp3mj1XV/filed0eeb39fdc': No such file or directory
    Error in file(con, "r") : cannot open the connection
    Calls: <Anonymous> ... read_lines -> withCallingHandlers -> readLines -> file
    Execution halted
    ```

*   checking whether the package can be loaded with stated dependencies ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package (or one of its dependent packages) has an
    unstated dependence on a standard package.  All dependencies must be
    declared in DESCRIPTION.
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking whether the namespace can be unloaded cleanly ... WARNING
    ```
    ---- unloading
    ```

*   checking loading without being on the library search path ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package has a loading problem when not on .libPaths:
    see the messages for details.
    ```

*   checking Rd files ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

*   checking for unstated dependencies in examples ... WARNING
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

*   checking startup messages can be suppressed ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    
    It looks like this package (or a package it requires) has a startup
    message which cannot be suppressed: see ?packageStartupMessage.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘data.table’
    ```

# mlr3oml

<details>

* Version: 0.9.0
* GitHub: https://github.com/mlr-org/mlr3oml
* Source code: https://github.com/cran/mlr3oml
* Date/Publication: 2023-09-13 12:30:02 UTC
* Number of recursive dependencies: 71

Run `revdepcheck::cloud_details(, "mlr3oml")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

# mlr3pipelines

<details>

* Version: 0.5.0-2
* GitHub: https://github.com/mlr-org/mlr3pipelines
* Source code: https://github.com/cran/mlr3pipelines
* Date/Publication: 2023-12-08 22:20:03 UTC
* Number of recursive dependencies: 163

Run `revdepcheck::cloud_details(, "mlr3pipelines")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘mlr3pipelines-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: mlr_pipeops_encodelmer
    > ### Title: Impact Encoding with Random Intercept Models
    > ### Aliases: mlr_pipeops_encodelmer PipeOpEncodeLmer
    > 
    > ### ** Examples
    > 
    > library("mlr3")
    ...
    +     x = factor(c("a", "a", "a", "b", "b")),
    +     y = factor(c("a", "a", "b", "b", "b"))),
    +   "x")
    > 
    > poe$train(list(task))[[1]]$data()
    Error in initializePtr() : 
      function 'cholmod_factor_ldetA' not provided by package 'Matrix'
    This happened PipeOp encodelmer's $train()
    Calls: <Anonymous> ... <Anonymous> -> initializePtr -> .Call -> .handleSimpleError -> h
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > if (requireNamespace("testthat", quietly = TRUE)) {
      +   library("checkmate")
      +   library("testthat")
      +   library("mlr3")
      +   library("paradox")
      +   library("mlr3pipelines")
      +   test_check("mlr3pipelines")
    ...
       27. │                                     ├─methods::initialize(value, ...)
       28. │                                     └─methods::initialize(value, ...)
       29. │                                       └─.Object$initialize(...)
       30. │                                         └─lme4 (local) initializePtr()
       31. └─base::.handleSimpleError(...)
       32.   └─mlr3pipelines (local) h(simpleError(msg, call))
      
      [ FAIL 1 | WARN 9 | SKIP 79 | PASS 12761 ]
      Error: Test failures
      Execution halted
    ```

# personalr

<details>

* Version: 1.0.3
* GitHub: https://github.com/mrcaseb/personalr
* Source code: https://github.com/cran/personalr
* Date/Publication: 2022-08-11 22:00:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "personalr")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

# rhino

<details>

* Version: 1.5.0
* GitHub: https://github.com/Appsilon/rhino
* Source code: https://github.com/cran/rhino
* Date/Publication: 2023-09-06 14:00:02 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "rhino")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
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

# webfakes

<details>

* Version: 1.3.0
* GitHub: https://github.com/r-lib/webfakes
* Source code: https://github.com/cran/webfakes
* Date/Publication: 2023-12-11 04:20:02 UTC
* Number of recursive dependencies: 49

Run `revdepcheck::cloud_details(, "webfakes")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... NOTE
    ```
    Error in fun(pkgname, pkgpath) : 
      cannot add bindings to a locked environment
    ```

