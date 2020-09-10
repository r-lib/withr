## R CMD check results
There were no NOTEs, ERRORs or WARNINGs.

## revdepcheck results

We checked 150 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 2 new problems
 * We failed to check 1 packages

Issues with CRAN packages are summarised below.

Full Summary at: https://github.com/r-lib/withr/tree/master/revdep#readme

### New problems
(This reports the first line of each new failure)

* callr
  checking tests ... ERROR

* cliapp
  checking examples ... ERROR
  checking tests ... ERROR

Both of these problems were due to a bug in the cliapp package, reported and fixed by https://github.com/r-lib/cliapp/pull/15

### Failed to check

* batchtools (NA)
