## revdepcheck results

We checked 614 reverse dependencies (578 from CRAN + 36 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 8 new problems
 * We failed to check 0 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* goodpractice
  checking whether the package can be loaded ... ERROR
  checking whether the package can be loaded with stated dependencies ... WARNING
  checking whether the package can be unloaded cleanly ... WARNING
  checking whether the namespace can be loaded with stated dependencies ... WARNING
  checking whether the namespace can be unloaded cleanly ... WARNING
  checking loading without being on the library search path ... WARNING
  checking R code for possible problems ... NOTE

* lintr
  checking whether the package can be loaded ... ERROR
  checking examples ... ERROR
  checking whether the package can be loaded with stated dependencies ... WARNING
  checking whether the package can be unloaded cleanly ... WARNING
  checking whether the namespace can be loaded with stated dependencies ... WARNING
  checking whether the namespace can be unloaded cleanly ... WARNING
  checking loading without being on the library search path ... WARNING
  checking Rd files ... WARNING
  checking for unstated dependencies in examples ... WARNING
  checking startup messages can be suppressed ... NOTE
  checking R code for possible problems ... NOTE

* mlr3oml
  checking dependencies in R code ... NOTE

* mlr3pipelines
  checking dependencies in R code ... NOTE

* personalr
  checking dependencies in R code ... NOTE

* rhino
  checking dependencies in R code ... NOTE

* testthat
  checking re-building of vignette outputs ... ERROR

* webfakes
  checking dependencies in R code ... NOTE

