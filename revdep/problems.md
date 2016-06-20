# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.0 (2016-05-03) |
|system   |x86_64, darwin13.4.0         |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/New_York             |
|date     |2016-06-20                   |

## Packages

|package  |*  |version |date       |source                     |
|:--------|:--|:-------|:----------|:--------------------------|
|testthat |   |1.0.2   |2016-04-23 |cran (@1.0.2)              |
|withr    |   |1.0.2   |2016-06-20 |local (jimhester/withr@NA) |

# Check results
1 packages with problems

## tibble (1.0)
Maintainer: Kirill Müller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/hadley/tibble/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  4. Failure: trunc_mat output matches known output (@test-trunc-mat.r#48) -------
  attr(knit, "knit_cacheable") isn't true.
  
  
  testthat results ================================================================
  OK: 190 SKIPPED: 0 FAILED: 4
  1. Failure: trunc_mat output matches known output (@test-trunc-mat.r#37) 
  2. Failure: trunc_mat output matches known output (@test-trunc-mat.r#41) 
  3. Failure: trunc_mat output matches known output (@test-trunc-mat.r#44) 
  4. Failure: trunc_mat output matches known output (@test-trunc-mat.r#48) 
  
  Error: testthat unit tests failed
  Execution halted
```

