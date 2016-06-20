## Test environments
* OS X El Capitan, R 3.3.0
* ubuntu 12.04 (on travis-ci), R 3.2.5, 3.3.0, R-devel
* Windows Server 2012 R2 (x64), R 3.3.0
* win-builder (devel and release)

## R CMD check results
There were no NOTEs, ERRORs or WARNINGs.

## Downstream dependencies
* I ran R CMD check on all 8 downstream dependencies of withr
  Summary at: https://github.com/jimhester/withr/blob/master/revdep/summary.md

* There was 1 ERROR in tibble that is unrelated to the changes in withr.
