# asympDiag

<details>

* Version: 0.3.2
* GitHub: https://github.com/Alvaro-Kothe/asympDiag
* Source code: https://github.com/cran/asympDiag
* Date/Publication: 2026-02-15 19:00:02 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::cloud_details(, "asympDiag")` for more info

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
       1. ├─base::suppressWarnings(...) at test-simulate_wald_pvalues.R:99:3
       2. │ └─base::withCallingHandlers(...)
       3. └─asympDiag::simulate_wald_pvalues(fit, nsim = 5) at test-simulate_wald_pvalues.R:101:5
       4.   ├─base::plot(out, which = ncoef + 1)
       5.   └─asympDiag:::plot.AD_pvalues(out, which = ncoef + 1)
      
      [ FAIL 1 | WARN 0 | SKIP 3 | PASS 166 ]
      Error:
      ! Test failures.
      Execution halted
    ```

# igraph

<details>

* Version: 2.3.2
* GitHub: https://github.com/igraph/rigraph
* Source code: https://github.com/cran/igraph
* Date/Publication: 2026-05-29 07:00:08 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::cloud_details(, "igraph")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(igraph)
      
      Attaching package: 'igraph'
      
      The following object is masked from 'package:testthat':
      
    ...
      Actual output:
      x | IGRAPH 1134862 D--B 15 8 -- Bipartite Gnm random graph
        | + attr: name (g/c), m (g/n), type (v/l)
        | + edges from 1134862:
        | [1] 12-> 4 12-> 5 12-> 8 13-> 5 14-> 1 14-> 3 15-> 9 15->10
      
      [ FAIL 5 | WARN 0 | SKIP 119 | PASS 6234 ]
      Error:
      ! Test failures.
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘graph’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 23.9Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        doc    1.2Mb
        help   3.6Mb
        libs  17.1Mb
    ```

