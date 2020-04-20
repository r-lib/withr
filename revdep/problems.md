# anyLib

<details>

* Version: 1.0.5
* Source code: https://github.com/cran/anyLib
* Date/Publication: 2018-11-05 15:00:03 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"anyLib")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘curl’ ‘httr’
      All declared Imports should be used.
    ```

# batchtools

<details>

* Version: 0.9.13
* Source code: https://github.com/cran/batchtools
* URL: https://github.com/mllg/batchtools
* BugReports: https://github.com/mllg/batchtools/issues
* Date/Publication: 2020-03-19 23:00:02 UTC
* Number of recursive dependencies: 74

Run `revdep_details(,"batchtools")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: 'base64url', 'checkmate', 'progress'
    
    Packages suggested but not available:
      'debugme', 'doParallel', 'doMPI', 'foreach', 'future',
      'future.batchtools', 'knitr', 'parallelMap', 'ranger', 'rmarkdown',
      'testthat', 'tibble'
    
    VignetteBuilder package required for checking but not installed: ‘knitr’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# BiocManager

<details>

* Version: 1.30.10
* Source code: https://github.com/cran/BiocManager
* BugReports: https://github.com/Bioconductor/BiocManager/issues
* Date/Publication: 2019-11-16 05:40:09 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"BiocManager")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages suggested but not available:
      'BiocStyle', 'BiocVersion', 'remotes', 'testthat', 'curl', 'knitr'
    
    VignetteBuilder package required for checking but not installed: ‘knitr’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# cabinets

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/cabinets
* Date/Publication: 2020-01-27 15:10:02 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"cabinets")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘here’ ‘withr’
      All declared Imports should be used.
    ```

# caret

<details>

* Version: 6.0-84
* Source code: https://github.com/cran/caret
* URL: https://github.com/topepo/caret/
* BugReports: https://github.com/topepo/caret/issues
* Date/Publication: 2019-04-27 04:50:03 UTC
* Number of recursive dependencies: 163

Run `revdep_details(,"caret")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        R        1.1Mb
        data     1.5Mb
        models   2.4Mb
    ```

# conflr

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/conflr
* URL: https://line.github.io/conflr/, https://github.com/line/conflr
* BugReports: https://github.com/line/conflr/issues
* Date/Publication: 2020-04-08 12:50:02 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"conflr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# datarobot

<details>

* Version: 2.17.0
* Source code: https://github.com/cran/datarobot
* Date/Publication: 2020-02-22 05:50:07 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"datarobot")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        doc       2.3Mb
        extdata   5.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘curl’
      All declared Imports should be used.
    ```

# detrendr

<details>

* Version: 0.6.5
* Source code: https://github.com/cran/detrendr
* URL: https://rorynolan.github.io/detrendr, https://www.github.com/rorynolan/detrendr
* BugReports: https://www.github.com/rorynolan/detrendr/issues
* Date/Publication: 2020-03-16 19:50:02 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"detrendr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        libs   6.7Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# devtools

<details>

* Version: 2.2.2.9000
* Source code: https://github.com/cran/devtools
* URL: https://devtools.r-lib.org/, https://github.com/r-lib/devtools
* BugReports: https://github.com/r-lib/devtools/issues
* Number of recursive dependencies: 101

Run `revdep_details(,"devtools")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      callr subprocess failed: Vignette re-building failed.
      Backtrace:
       1. devtools::build_vignettes(pkg)
       2. callr::r(...)
       3. callr:::get_result(output = out, options)
       4. throw(newerr, parent = remerr[[2]])
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 54 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: Sweave vignettes copied into doc (@test-vignettes.R#13) 
      2. Error: Built files are updated (@test-vignettes.R#30) 
      3. Error: Extra files copied and removed (@test-vignettes.R#84) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# dm

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/dm
* Date/Publication: 2020-03-12 17:30:02 UTC
* Number of recursive dependencies: 116

Run `revdep_details(,"dm")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Evaluating list_of_data_ts_parent_and_child_src
      Evaluating t1_src
      Evaluating t3_src
      ── 1. Failure: check_cardinality_...() functions are checking the cardinality co
      `map2(...)` produced warnings.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 739 | SKIPPED: 42 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: check_cardinality_...() functions are checking the cardinality correctly? (@test-check-cardinalities.R#7) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      In file(filename, "r", encoding = encoding) :
        cannot open file '/Users/tobiasschieferdecker/git/cynkra/dm/.Rprofile': No such file or directory
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DT’
      All declared Imports should be used.
    ```

# dplyr

<details>

* Version: 0.8.5
* Source code: https://github.com/cran/dplyr
* URL: http://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr
* BugReports: https://github.com/tidyverse/dplyr/issues
* Date/Publication: 2020-03-07 12:20:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"dplyr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 31.1Mb
      sub-directories of 1Mb or more:
        libs  28.7Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# encryptr

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/encryptr
* URL: https://github.com/SurgicalInformatics/encryptr
* BugReports: https://github.com/SurgicalInformatics/encryptr/issues
* Date/Publication: 2019-04-25 07:10:03 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"encryptr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

# exuber

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/exuber
* URL: https://github.com/kvasilopoulos/exuber
* BugReports: https://github.com/kvasilopoulos/exuber/issues
* Date/Publication: 2019-07-15 09:40:07 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"exuber")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   2.5Mb
        libs   2.2Mb
    ```

# fs

<details>

* Version: 1.4.1
* Source code: https://github.com/cran/fs
* URL: http://fs.r-lib.org, https://github.com/r-lib/fs
* BugReports: https://github.com/r-lib/fs/issues
* Date/Publication: 2020-04-04 00:30:02 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"fs")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 3368 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 14 ]
      1. Failure: file_access: checks for file read and write ability (@test-access.R#14) 
      2. Failure: file_access: checks for file read and write ability (@test-access.R#15) 
      3. Failure: dir_ls: warns if fail == FALSE (@test-list.R#78) 
      4. Failure: dir_ls: warns if fail == FALSE (@test-list.R#78) 
      5. Failure: dir_ls: warns if fail == FALSE (@test-list.R#78) 
      6. Failure: dir_map: warns if fail == FALSE (@test-list.R#111) 
      7. Failure: dir_map: warns if fail == FALSE (@test-list.R#111) 
      8. Failure: dir_map: warns if fail == FALSE (@test-list.R#111) 
      9. Failure: dir_walk: warns if fail == FALSE (@test-list.R#161) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘purrr’
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# ggExtra

<details>

* Version: 0.9
* Source code: https://github.com/cran/ggExtra
* URL: https://github.com/daattali/ggExtra
* BugReports: https://github.com/daattali/ggExtra/issues
* Date/Publication: 2019-08-27 04:30:02 UTC
* Number of recursive dependencies: 110

Run `revdep_details(,"ggExtra")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘R6’ ‘grDevices’ ‘scales’ ‘utils’
      All declared Imports should be used.
    ```

# ggforce

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/ggforce
* URL: https://ggforce.data-imaginist.com
* BugReports: https://github.com/thomasp85/ggforce/issues
* Date/Publication: 2019-08-20 09:50:05 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"ggforce")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 23.4Mb
      sub-directories of 1Mb or more:
        help   1.1Mb
        libs  21.5Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘withr’
      All declared Imports should be used.
    ```

# ggplot2

<details>

* Version: 3.3.0.9000
* Source code: https://github.com/cran/ggplot2
* URL: http://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
* BugReports: https://github.com/tidyverse/ggplot2/issues
* Number of recursive dependencies: 149

Run `revdep_details(,"ggplot2")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘mgcv’
      All declared Imports should be used.
    ```

# ggridges

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/ggridges
* URL: https://github.com/clauswilke/ggridges
* Date/Publication: 2018-09-27 15:20:03 UTC
* Number of recursive dependencies: 113

Run `revdep_details(,"ggridges")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6242 marked UTF-8 strings
    ```

# ggspatial

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/ggspatial
* URL: https://github.com/paleolimbot/ggspatial
* BugReports: https://github.com/paleolimbot/ggspatial/issues
* Date/Publication: 2018-12-14 21:10:04 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"ggspatial")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: 'ggplot2', 'rosm', 'tibble', 'tidyr'
    
    Packages suggested but not available:
      'prettymapr', 'testthat', 'dplyr', 'ggrepel', 'stars', 'covr'
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggthemes

<details>

* Version: 4.2.0
* Source code: https://github.com/cran/ggthemes
* URL: http://github.com/jrnold/ggthemes
* BugReports: http://github.com/jrnold/ggthemes
* Date/Publication: 2019-05-13 09:10:03 UTC
* Number of recursive dependencies: 122

Run `revdep_details(,"ggthemes")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# htmltools

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/htmltools
* URL: https://github.com/rstudio/htmltools
* BugReports: https://github.com/rstudio/htmltools/issues
* Date/Publication: 2019-10-04 23:00:08 UTC
* Number of recursive dependencies: 28

Run `revdep_details(,"htmltools")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘knitr’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘shiny’
    ```

# igraph

<details>

* Version: 1.2.4.1
* Source code: https://github.com/cran/igraph
* URL: http://igraph.org
* BugReports: https://github.com/igraph/igraph/issues
* Date/Publication: 2019-04-22 06:57:32 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"igraph")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: 'magrittr', 'pkgconfig'
    
    Packages suggested but not available:
      'ape', 'digest', 'graph', 'igraphdata', 'rgl', 'scales', 'testthat'
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ijtiff

<details>

* Version: 2.0.5
* Source code: https://github.com/cran/ijtiff
* URL: https://docs.ropensci.org/ijtiff, https://www.github.com/ropensci/ijtiff#readme
* BugReports: https://www.github.com/ropensci/ijtiff/issues
* Date/Publication: 2020-04-06 05:30:02 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"ijtiff")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available:
      'checkmate', 'dplyr', 'filesstrings', 'fs', 'magrittr', 'purrr',
      'Rcpp', 'readr', 'rlang', 'stringr'
    
    Packages suggested but not available:
      'abind', 'covr', 'EBImage', 'knitr', 'pacman', 'rmarkdown',
      'spelling', 'testthat', 'tiff'
    
    VignetteBuilder package required for checking but not installed: ‘knitr’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# IOHanalyzer

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/IOHanalyzer
* URL: http://iohprofiler.liacs.nl, https://github.com/IOHprofiler/IOHAnalyzer
* BugReports: https://github.com/IOHprofiler/IOHAnalyzer/issues
* Date/Publication: 2020-01-10 15:30:03 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"IOHanalyzer")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        data   1.4Mb
        libs   2.8Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘bsplus’ ‘colourpicker’ ‘kableExtra’ ‘markdown’ ‘reshape2’
      ‘shinydashboard’ ‘shinyjs’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 75 marked UTF-8 strings
    ```

# irace

<details>

* Version: 3.4.1
* Source code: https://github.com/cran/irace
* URL: http://iridia.ulb.ac.be/irace, https://github.com/MLopez-Ibanez/irace
* BugReports: https://github.com/MLopez-Ibanez/irace/issues
* Date/Publication: 2020-03-31 13:40:03 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"irace")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages suggested but not available:
      'Rmpi', 'knitr', 'testthat', 'mlr', 'ParamHelpers', 'devtools'
    
    VignetteBuilder package required for checking but not installed: ‘knitr’
    
    Files named as vignettes but with no recognized vignette engine:
       ‘inst/doc/irace-package.Rnw’
    (Is a VignetteBuilder field missing?)
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# jwutil

<details>

* Version: 1.2.3
* Source code: https://github.com/cran/jwutil
* URL: https://github.com/jackwasey/jwutil
* BugReports: https://github.com/jackwasey/jwutil/issues
* Date/Publication: 2019-05-06 19:10:03 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"jwutil")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        libs   5.9Mb
    ```

# languageserver

<details>

* Version: 0.3.5
* Source code: https://github.com/cran/languageserver
* URL: https://github.com/REditorSupport/languageserver
* Date/Publication: 2020-03-22 03:50:02 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"languageserver")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘callr’ ‘collections’ ‘repr’
      All declared Imports should be used.
    ```

# mlflow

<details>

* Version: 1.7.0
* Source code: https://github.com/cran/mlflow
* URL: https://github.com/mlflow/mlflow
* BugReports: https://github.com/mlflow/mlflow/issues
* Date/Publication: 2020-03-03 06:00:02 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"mlflow")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required and available but unsuitable version: ‘stringi’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# mudata2

<details>

* Version: 1.1.2
* Source code: https://github.com/cran/mudata2
* URL: https://paleolimbot.github.io/mudata2, https://github.com/paleolimbot/mudata2
* BugReports: https://github.com/paleolimbot/mudata2/issues
* Date/Publication: 2020-03-20 20:20:03 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"mudata2")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 881 | SKIPPED: 2 | WARNINGS: 8 | FAILED: 12 ]
      1. Error: mudata_prepare_column and mudata_parse_column are opposites (@test-mudata-io.R#267) 
      2. Error: mudata_prepare_tbl works as intended (@test-mudata-io.R#311) 
      3. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test-mudata-io.R#345) 
      4. Failure: as_* functions produce the expected output type (@test-types.R#210) 
      5. Failure: wkt parsing returns an sf::sfc (@test-types.R#252) 
      6. Failure: wkt parsing works when there are parsing errors/NA values (@test-types.R#259) 
      7. Error: wkt parsing works when there are parsing errors/NA values (@test-types.R#261) 
      8. Failure: wkt parsing works with zero-length input (@test-types.R#285) 
      9. Failure: objects generate the correct type strings (@test-types.R#306) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# pins

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/pins
* URL: https://github.com/rstudio/pins
* BugReports: https://github.com/rstudio/pins/issues
* Date/Publication: 2020-04-07 18:50:02 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"pins")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 36 marked UTF-8 strings
    ```

# pkgdown

<details>

* Version: 1.4.1.9000
* Source code: https://github.com/cran/pkgdown
* URL: https://pkgdown.r-lib.org, https://github.com/r-lib/pkgdown
* BugReports: https://github.com/r-lib/pkgdown/issues
* Number of recursive dependencies: 86

Run `revdep_details(,"pkgdown")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘usethis’
    ```

# pkgmaker

<details>

* Version: 0.31.1
* Source code: https://github.com/cran/pkgmaker
* URL: https://renozao.github.io/pkgmaker
* BugReports: http://github.com/renozao/pkgmaker/issues
* Date/Publication: 2020-03-19 13:00:07 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"pkgmaker")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available:
      'registry', 'digest', 'stringi', 'magrittr', 'stringr', 'xtable',
      'bibtex', 'assertthat'
    
    Packages suggested but not available:
      'devtools', 'roxygen2', 'RUnit', 'testthat', 'knitr', 'rmarkdown',
      'yaml', 'Biobase'
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pkgnet

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/pkgnet
* URL: https://github.com/uptake/pkgnet, https://uptake.github.io/pkgnet/
* BugReports: https://github.com/uptake/pkgnet/issues
* Date/Publication: 2020-04-06 10:10:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"pkgnet")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pkgdown’
    ```

# proffer

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/proffer
* URL: https://github.com/r-prof/proffer, https://r-prof.github.io/proffer
* BugReports: https://github.com/r-prof/proffer/issues
* Date/Publication: 2020-03-23 02:20:04 UTC
* Number of recursive dependencies: 35

Run `revdep_details(,"proffer")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: 'profile', 'RProtoBuf'
    
    Package suggested but not available: ‘testthat’
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# profile

<details>

* Version: 1.0
* Source code: https://github.com/cran/profile
* URL: https://github.com/r-prof/profile, https://r-prof.github.io/profile
* BugReports: https://github.com/r-prof/profile/issues
* Date/Publication: 2018-01-05 10:19:17 UTC
* Number of recursive dependencies: 34

Run `revdep_details(,"profile")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘tibble’
    
    Packages suggested but not available: 'RProtoBuf', 'testthat'
    
    The suggested packages are required for a complete check.
    Checking can be attempted without them by setting the environment
    variable _R_CHECK_FORCE_SUGGESTS_ to a false value.
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# raws.profile

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/raws.profile
* Date/Publication: 2019-01-04 10:50:06 UTC
* Number of recursive dependencies: 32

Run `revdep_details(,"raws.profile")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘withr’
      All declared Imports should be used.
    ```

# dataonderivatives

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/dataonderivatives
* URL: https://imanuelcostigan.github.io/dataonderivatives, https://github.com/imanuelcostigan/dataonderivatives
* BugReports: https://github.com/imanuelcostigan/dataonderivatives/issues
* Date/Publication: 2018-02-10 07:45:42 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"dataonderivatives")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      4. Failure: CME SDR file parses (@test-cme.R#22) -------------------------------
      nrow(cme(lubridate::ymd(20161213), "FX")) > 0 isn't true.
      
      
      testthat results ================================================================
      OK: 23 SKIPPED: 0 FAILED: 4
      1. Failure: BSDR API accesible (@test-bsdr.R#6) 
      2. Failure: BSDR API accesible (@test-bsdr.R#8) 
      3. Failure: BSDR API accesible (@test-bsdr.R#9) 
      4. Failure: CME SDR file parses (@test-cme.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stats’
      All declared Imports should be used.
    ```

# RSQLServer

<details>

* Version: NA
* Source code: https://github.com/cran/RSQLServer
* Number of recursive dependencies: 0

Run `revdep_details(,"RSQLServer")` for more info

</details>

## In both

*   checking whether package `RSQLServer' can be installed ... ERROR
    ```
    Installation failed.
    See `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/00install.out' for details.
    ```

## Installation

### Devel

```
* installing *source* package `RSQLServer' ...
** package `RSQLServer' successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package `RSQLServer'
* removing `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/RSQLServer'

```
### CRAN

```
* installing *source* package `RSQLServer' ...
** package `RSQLServer' successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package `RSQLServer'
* removing `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/RSQLServer'

```
# dataonderivatives

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/dataonderivatives
* URL: https://imanuelcostigan.github.io/dataonderivatives, https://github.com/imanuelcostigan/dataonderivatives
* BugReports: https://github.com/imanuelcostigan/dataonderivatives/issues
* Date/Publication: 2018-02-10 07:45:42 UTC
* Number of recursive dependencies: 48

Run `revdep_details(,"dataonderivatives")` for more info

</details>

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      4. Failure: CME SDR file parses (@test-cme.R#22) -------------------------------
      nrow(cme(lubridate::ymd(20161213), "FX")) > 0 isn't true.
      
      
      testthat results ================================================================
      OK: 23 SKIPPED: 0 FAILED: 4
      1. Failure: BSDR API accesible (@test-bsdr.R#6) 
      2. Failure: BSDR API accesible (@test-bsdr.R#8) 
      3. Failure: BSDR API accesible (@test-bsdr.R#9) 
      4. Failure: CME SDR file parses (@test-cme.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stats’
      All declared Imports should be used.
    ```

# RSQLServer

<details>

* Version: NA
* Source code: https://github.com/cran/RSQLServer
* Number of recursive dependencies: 0

Run `revdep_details(,"RSQLServer")` for more info

</details>

## In both

*   checking whether package `RSQLServer' can be installed ... ERROR
    ```
    Installation failed.
    See `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/00install.out' for details.
    ```

## Installation

### Devel

```
* installing *source* package `RSQLServer' ...
** package `RSQLServer' successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package `RSQLServer'
* removing `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/RSQLServer'

```
### CRAN

```
* installing *source* package `RSQLServer' ...
** package `RSQLServer' successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/dplyr/dbplyr/revdep/library/RSQLServer/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package `RSQLServer'
* removing `/Users/hadley/Documents/dplyr/dbplyr/revdep/checks/RSQLServer/new/RSQLServer.Rcheck/RSQLServer'

```
# rdoc

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/rdoc
* URL: https://github.com/mdequeljoe/rdoc
* BugReports: https://github.com/mdequeljoe/rdoc/issues
* Date/Publication: 2019-05-16 11:10:03 UTC
* Number of recursive dependencies: 26

Run `revdep_details(,"rdoc")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# roxygen2md

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/roxygen2md
* URL: https://roxygen2md.r-lib.org, https://github.com/r-lib/roxygen2md
* BugReports: https://github.com/r-lib/roxygen2md/issues
* Date/Publication: 2019-06-17 15:40:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"roxygen2md")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘withr’
      All declared Imports should be used.
    ```

# RPostgres

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/RPostgres
* URL: https://rpostgres.r-dbi.org, https://github.com/r-dbi/RPostgres
* BugReports: https://github.com/r-dbi/RPostgres/issues
* Date/Publication: 2019-12-18 09:50:02 UTC
* Number of recursive dependencies: 37

Run `revdep_details(,"RPostgres")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        libs   5.8Mb
    ```

# secret

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/secret
* URL: https://github.com/gaborcsardi/secret#readme
* BugReports: https://github.com/gaborcsardi/secret/issues
* Date/Publication: 2017-06-17 14:33:35 UTC
* Number of recursive dependencies: 47

Run `revdep_details(,"secret")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘secret-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_travis_user
    > ### Title: Add a user via their Travis repo.
    > ### Aliases: add_travis_user
    > 
    > ### ** Examples
    > 
    > vault <- file.path(tempdir(), ".vault")
    > create_vault(vault)
    > 
    > add_travis_user("gaborcsardi/secret", vault = vault)
    Error in open.connection(con, "rb") : HTTP error 404.
    Calls: add_travis_user ... parse_and_simplify -> parseJSON -> parse_con -> open -> open.connection
    Execution halted
    ```

# skimr

<details>

* Version: 2.0
* Source code: https://github.com/cran/skimr
* URL: https://docs.ropensci.org/skimr (website), https://github.com/ropensci/skimr
* BugReports: https://github.com/ropensci/skimr/issues
* Number of recursive dependencies: 70

Run `revdep_details(,"skimr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘vctrs’
      All declared Imports should be used.
    ```

# surveydata

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/surveydata
* URL: https://github.com/andrie/surveydata, https://andrie.github.io/surveydata/index.html
* BugReports: https://github.com/andrie/surveydata/issues
* Date/Publication: 2020-02-04 16:10:02 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"surveydata")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘surveydata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dplyr-surveydata
    > ### Title: Methods to support dplyr verbs.
    > ### Aliases: dplyr-surveydata mutate.surveydata as.tbl.surveydata
    > ###   select.surveydata filter arrange.surveydata summarise.surveydata
    > ###   summarize.surveydata slice.surveydata
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    > withr::with_package("dplyr", help = "dplyr", {
    +   membersurvey %>% 
    +     as.tbl() %>% 
    +     .[c("id", "Q1", "Q2")] %>% 
    +     filter(Q2 == 2009)
    + })
    Error in withr::with_package("dplyr", help = "dplyr", { : 
      unused argument (help = "dplyr")
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("surveydata")
      ── 1. Error: encoding functions work as expected (@test-06-encoding.R#9)  ──────
      unsupported conversion from 'NA' to 'UTF-8'
      Backtrace:
       1. testthat::expect_equal(encToInt("\\xfa"), c(92, 120, 102, 97))
       4. surveydata::encToInt("\\xfa")
       6. base::iconv(x, from = encoding[1], to = "UTF-8")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 211 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: encoding functions work as expected (@test-06-encoding.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# testextra

<details>

* Version: 0.1.0.1
* Source code: https://github.com/cran/testextra
* URL: https://github.com/RDocTaskForce/testextra
* BugReports: https://github.com/RDocTaskForce/testextra/issues
* Date/Publication: 2019-12-18 09:15:29 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"testextra")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘stringi’ ‘utils’
      All declared Imports should be used.
    ```

# testthat

<details>

* Version: 2.3.2.9000
* Source code: https://github.com/cran/testthat
* URL: http://testthat.r-lib.org, https://github.com/r-lib/testthat
* BugReports: https://github.com/r-lib/testthat/issues
* Number of recursive dependencies: 77

Run `revdep_details(,"testthat")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        libs   4.1Mb
    ```

# themis

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/themis
* URL: https://github.com/tidymodels/themis
* BugReports: https://github.com/tidymodels/themis/issues
* Date/Publication: 2020-01-13 15:30:02 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"themis")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyselect’
      All declared Imports should be used.
    ```

# tikzDevice

<details>

* Version: 0.12.3
* Source code: https://github.com/cran/tikzDevice
* URL: https://github.com/daqana/tikzDevice
* BugReports: https://github.com/daqana/tikzDevice/issues
* Date/Publication: 2019-08-07 11:50:02 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"tikzDevice")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    
    	{\\tiny Hello \\LaTeX!}
    
    Run the following commands for diagnosis:
    
    	tikzTest()
    	tikzTest("{\\\\tiny Hello \\\\LaTeX!}")
    
    Common reasons for failure include:
      * The string contains a character which is special to LaTeX unless
        escaped properly, such as % or $.
      * The string makes use of LaTeX commands provided by a package and
        the tikzDevice was not told to load the package.
    
    The TeX and log files used for the calculation can help diagnose the
    problem. If these files are missing, rerun the plot and make sure to
    keep the R session open.
    TeX file: tikzStringWidthCalc.tex
    Log file: tikzStringWidthCalc.log
    Calls: getLatexStrWidth -> getMetricsFromLatex
    Execution halted
    ```

# usethis

<details>

* Version: 1.6.0
* Source code: https://github.com/cran/usethis
* URL: https://usethis.r-lib.org, https://github.com/r-lib/usethis
* BugReports: https://github.com/r-lib/usethis/issues
* Date/Publication: 2020-04-09 04:50:02 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"usethis")` for more info

</details>

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘devtools’
    ```

# vdiffr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/vdiffr
* URL: https://github.com/r-lib/vdiffr
* BugReports: https://github.com/r-lib/vdiffr/issues
* Date/Publication: 2019-06-24 16:30:03 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"vdiffr")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘freetypeharfbuzz’
      All declared Imports should be used.
    ```

# vroom

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/vroom
* URL: https://github.com/r-lib/vroom
* BugReports: https://github.com/r-lib/vroom/issues
* Date/Publication: 2020-01-13 22:40:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"vroom")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.1Mb
      sub-directories of 1Mb or more:
        libs  14.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘usethis’
    ```

# ymlthis

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/ymlthis
* URL: https://ymlthis.r-lib.org, https://github.com/r-lib/ymlthis
* BugReports: https://github.com/r-lib/ymlthis/issues
* Date/Publication: 2020-02-03 23:00:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"ymlthis")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘miniUI’ ‘shinyBS’
      All declared Imports should be used.
    ```

