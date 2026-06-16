# a5R

<details>

* Version: 0.4.0
* GitHub: https://github.com/belian-earth/a5R
* Source code: https://github.com/cran/a5R
* Date/Publication: 2026-05-14 13:00:07 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::cloud_details(, "a5R")` for more info

</details>

## In both

*   checking whether package ‘a5R’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/a5R/new/a5R.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘a5R’ ...
** package ‘a5R’ successfully unpacked and MD5 sums checked
** using staged installation
Using cargo 1.75.0
Using rustc 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)
Building for CRAN.
Writing `src/Makevars`.
`tools/config.R` has finished.
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
...

Caused by:
  feature `edition2024` is required

  The package requires the Cargo feature called `edition2024`, but that feature is not stabilized in this version of Cargo (1.75.0).
  Consider trying a more recent nightly release.
  See https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#edition-2024 for more information about the status of this feature.
make: *** [Makevars:26: rust/target/release/liba5R.a] Error 101
ERROR: compilation failed for package ‘a5R’
* removing ‘/tmp/workdir/a5R/new/a5R.Rcheck/a5R’


```
### CRAN

```
* installing *source* package ‘a5R’ ...
** package ‘a5R’ successfully unpacked and MD5 sums checked
** using staged installation
Using cargo 1.75.0
Using rustc 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)
Building for CRAN.
Writing `src/Makevars`.
`tools/config.R` has finished.
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
...

Caused by:
  feature `edition2024` is required

  The package requires the Cargo feature called `edition2024`, but that feature is not stabilized in this version of Cargo (1.75.0).
  Consider trying a more recent nightly release.
  See https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#edition-2024 for more information about the status of this feature.
make: *** [Makevars:26: rust/target/release/liba5R.a] Error 101
ERROR: compilation failed for package ‘a5R’
* removing ‘/tmp/workdir/a5R/old/a5R.Rcheck/a5R’


```
# auxvecLASSO

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/auxvecLASSO
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "auxvecLASSO")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# BGmisc

<details>

* Version: 1.6.0.1
* GitHub: https://github.com/R-Computing-Lab/BGmisc
* Source code: https://github.com/cran/BGmisc
* Date/Publication: 2026-03-13 17:00:07 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "BGmisc")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/BGmisc/new/BGmisc.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BGmisc/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/BGmisc/old/BGmisc.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BGmisc/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# bmm

<details>

* Version: 1.3.1
* GitHub: https://github.com/venpopov/bmm
* Source code: https://github.com/cran/bmm
* Date/Publication: 2026-06-05 07:40:02 UTC
* Number of recursive dependencies: 138

Run `revdepcheck::cloud_details(, "bmm")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/bmm/new/bmm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bmm/DESCRIPTION’ ... OK
...
* this is package ‘bmm’ version ‘1.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rtdists’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/bmm/old/bmm.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘bmm/DESCRIPTION’ ... OK
...
* this is package ‘bmm’ version ‘1.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rtdists’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# caugi

<details>

* Version: 1.2.0
* GitHub: https://github.com/frederikfabriciusbjerre/caugi
* Source code: https://github.com/cran/caugi
* Date/Publication: 2026-05-05 14:56:15 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "caugi")` for more info

</details>

## In both

*   checking whether package ‘caugi’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/caugi/new/caugi.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘bnlearn’
    ```

## Installation

### Devel

```
* installing *source* package ‘caugi’ ...
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.80.0.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/tmp/workdir/caugi/new/caugi.Rcheck/caugi’


```
### CRAN

```
* installing *source* package ‘caugi’ ...
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.80.0.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/tmp/workdir/caugi/old/caugi.Rcheck/caugi’


```
# clusterMI

<details>

* Version: 1.6
* GitHub: NA
* Source code: https://github.com/cran/clusterMI
* Date/Publication: 2026-04-03 13:50:02 UTC
* Number of recursive dependencies: 269

Run `revdepcheck::cloud_details(, "clusterMI")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/clusterMI/new/clusterMI.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘clusterMI/DESCRIPTION’ ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘clusterMI’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/clusterMI/new/clusterMI.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/clusterMI/old/clusterMI.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘clusterMI/DESCRIPTION’ ... OK
...
* checking if there is a namespace ... OK
* checking for executable files ... OK
* checking for hidden files and directories ... OK
* checking for portable file names ... OK
* checking for sufficient/correct file permissions ... OK
* checking whether package ‘clusterMI’ can be installed ... ERROR
Installation failed.
See ‘/tmp/workdir/clusterMI/old/clusterMI.Rcheck/00install.out’ for details.
* DONE
Status: 1 ERROR





```
# cppally

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/cppally
* Number of recursive dependencies: 106

Run `revdepcheck::cloud_details(, "cppally")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# easyEWAS

<details>

* Version: 1.0.1
* GitHub: https://github.com/ytwangZero/easyEWAS
* Source code: https://github.com/cran/easyEWAS
* Date/Publication: 2026-03-16 19:10:14 UTC
* Number of recursive dependencies: 282

Run `revdepcheck::cloud_details(, "easyEWAS")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/easyEWAS/new/easyEWAS.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘easyEWAS/DESCRIPTION’ ... OK
...
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/easyEWAS/old/easyEWAS.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘easyEWAS/DESCRIPTION’ ... OK
...
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* DONE
Status: 1 NOTE





```
# freestiler

<details>

* Version: 0.1.7
* GitHub: https://github.com/walkerke/freestiler
* Source code: https://github.com/cran/freestiler
* Date/Publication: 2026-05-12 10:30:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "freestiler")` for more info

</details>

## In both

*   checking whether package ‘freestiler’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/freestiler/new/freestiler.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘freestiler’ ...
** package ‘freestiler’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.77.2.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘freestiler’
* removing ‘/tmp/workdir/freestiler/new/freestiler.Rcheck/freestiler’


```
### CRAN

```
* installing *source* package ‘freestiler’ ...
** package ‘freestiler’ successfully unpacked and MD5 sums checked
** using staged installation
Error in eval(ei, envir) : 
------------------ [UNSUPPORTED RUST VERSION]------------------
- Minimum supported Rust version is 1.77.2.
- Installed Rust version is 1.75.0.
---------------------------------------------------------------
Calls: source -> withVisible -> eval -> eval
Execution halted
ERROR: configuration failed for package ‘freestiler’
* removing ‘/tmp/workdir/freestiler/old/freestiler.Rcheck/freestiler’


```
# ggsql

<details>

* Version: 0.3.3
* GitHub: https://github.com/posit-dev/ggsql-r
* Source code: https://github.com/cran/ggsql
* Date/Publication: 2026-06-03 08:20:23 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::cloud_details(, "ggsql")` for more info

</details>

## In both

*   checking whether package ‘ggsql’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ggsql/new/ggsql.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggsql’ ...
** package ‘ggsql’ successfully unpacked and MD5 sums checked
** using staged installation
2026-06-16 14:50:56 URL:https://release-assets.githubusercontent.com/github-production-release-asset/1213346768/5a7c0166-a4e7-4312-87c2-4ba66d673298?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-06-16T15%3A37%3A10Z&rscd=attachment%3B+filename%3Dvendor.tar.xz.sha256&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-06-16T14%3A36%3A54Z&ske=2026-06-16T15%3A37%3A10Z&sks=b&skv=2018-11-09&sig=4A6hOU%2BzCDHItr8YhsW2oL3v%2Bnn%2FxqbrtC4WW2EO1j4%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MTYyMTc0OSwibmJmIjoxNzgxNjIxNDQ5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.6hdSe29xu9qJIGsnEc7U4dnz0ly8WsaHs8wn3qLY6Cw&response-content-disposition=attachment%3B%20filename%3Dvendor.tar.xz.sha256&response-content-type=application%2Foctet-stream [65/65] -> "/tmp/RtmpyH4ulG/filebb435e8bc3.sha256" [1]
Downloading vendor archive from https://github.com/posit-dev/ggsql-r/releases/download/v0.3.3/vendor.tar.xz
2026-06-16 14:50:56 URL:https://release-assets.githubusercontent.com/github-production-release-asset/1213346768/95bf3db6-701d-4f73-8242-343e76c4fb40?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-06-16T15%3A42%3A47Z&rscd=attachment%3B+filename%3Dvendor.tar.xz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-06-16T14%3A42%3A06Z&ske=2026-06-16T15%3A42%3A47Z&sks=b&skv=2018-11-09&sig=Dw48yLk4rkEwKNPs3RWRvL5HCdYBFdsngo4CFFdYwlU%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MTYyMzI1MCwibmJmIjoxNzgxNjIxNDUwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.QEpTlEv5kUp_cEDV1vCEre_zoUIZVlJEbDXVzOxo2kk&response-content-disposition=attachment%3B%20filename%3Dvendor.tar.xz&response-content-type=application%2Foctet-stream [38545072/38545072] -> "/tmp/RtmpyH4ulG/filebb45c52d17.tar.xz" [1]
Error: 'sha256sum' is not an exported object from 'namespace:tools'
Execution halted
ERROR: configuration failed for package ‘ggsql’
* removing ‘/tmp/workdir/ggsql/new/ggsql.Rcheck/ggsql’


```
### CRAN

```
* installing *source* package ‘ggsql’ ...
** package ‘ggsql’ successfully unpacked and MD5 sums checked
** using staged installation
2026-06-16 14:50:50 URL:https://release-assets.githubusercontent.com/github-production-release-asset/1213346768/5a7c0166-a4e7-4312-87c2-4ba66d673298?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-06-16T15%3A37%3A10Z&rscd=attachment%3B+filename%3Dvendor.tar.xz.sha256&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-06-16T14%3A36%3A54Z&ske=2026-06-16T15%3A37%3A10Z&sks=b&skv=2018-11-09&sig=4A6hOU%2BzCDHItr8YhsW2oL3v%2Bnn%2FxqbrtC4WW2EO1j4%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MTYyMTc0OSwibmJmIjoxNzgxNjIxNDQ5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.6hdSe29xu9qJIGsnEc7U4dnz0ly8WsaHs8wn3qLY6Cw&response-content-disposition=attachment%3B%20filename%3Dvendor.tar.xz.sha256&response-content-type=application%2Foctet-stream [65/65] -> "/tmp/RtmpZYrlKm/file9b7f50ffc4.sha256" [1]
Downloading vendor archive from https://github.com/posit-dev/ggsql-r/releases/download/v0.3.3/vendor.tar.xz
2026-06-16 14:50:50 URL:https://release-assets.githubusercontent.com/github-production-release-asset/1213346768/95bf3db6-701d-4f73-8242-343e76c4fb40?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-06-16T15%3A42%3A47Z&rscd=attachment%3B+filename%3Dvendor.tar.xz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-06-16T14%3A42%3A06Z&ske=2026-06-16T15%3A42%3A47Z&sks=b&skv=2018-11-09&sig=Dw48yLk4rkEwKNPs3RWRvL5HCdYBFdsngo4CFFdYwlU%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MTYyMzI1MCwibmJmIjoxNzgxNjIxNDUwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.QEpTlEv5kUp_cEDV1vCEre_zoUIZVlJEbDXVzOxo2kk&response-content-disposition=attachment%3B%20filename%3Dvendor.tar.xz&response-content-type=application%2Foctet-stream [38545072/38545072] -> "/tmp/RtmpZYrlKm/file9b755f0f63b.tar.xz" [1]
Error: 'sha256sum' is not an exported object from 'namespace:tools'
Execution halted
ERROR: configuration failed for package ‘ggsql’
* removing ‘/tmp/workdir/ggsql/old/ggsql.Rcheck/ggsql’


```
# gratia

<details>

* Version: 0.11.2
* GitHub: https://github.com/gavinsimpson/gratia
* Source code: https://github.com/cran/gratia
* Date/Publication: 2026-02-07 06:10:36 UTC
* Number of recursive dependencies: 178

Run `revdepcheck::cloud_details(, "gratia")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/gratia/new/gratia.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘gratia/DESCRIPTION’ ... OK
...
> detaching 'package:mgcv', 'package:GJRM'
> 
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/gratia/old/gratia.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘gratia/DESCRIPTION’ ... OK
...
> detaching 'package:mgcv', 'package:GJRM'
> 
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# marginaleffects

<details>

* Version: 0.32.0
* GitHub: https://github.com/vincentarelbundock/marginaleffects
* Source code: https://github.com/cran/marginaleffects
* Date/Publication: 2026-02-14 06:40:08 UTC
* Number of recursive dependencies: 489

Run `revdepcheck::cloud_details(, "marginaleffects")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/marginaleffects/new/marginaleffects.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘marginaleffects/DESCRIPTION’ ... OK
...
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘tinytest.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/marginaleffects/old/marginaleffects.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘marginaleffects/DESCRIPTION’ ... OK
...
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘tinytest.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# MiscMetabar

<details>

* Version: 0.16.8
* GitHub: https://github.com/adrientaudiere/MiscMetabar
* Source code: https://github.com/cran/MiscMetabar
* Date/Publication: 2026-06-08 14:30:02 UTC
* Number of recursive dependencies: 470

Run `revdepcheck::cloud_details(, "MiscMetabar")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/MiscMetabar/new/MiscMetabar.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MiscMetabar/DESCRIPTION’ ... OK
...
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/MiscMetabar/old/MiscMetabar.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘MiscMetabar/DESCRIPTION’ ... OK
...
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# mlr3filters

<details>

* Version: 0.9.1
* GitHub: https://github.com/mlr-org/mlr3filters
* Source code: https://github.com/cran/mlr3filters
* Date/Publication: 2026-04-23 16:40:02 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::cloud_details(, "mlr3filters")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/mlr3filters/new/mlr3filters.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mlr3filters/DESCRIPTION’ ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/mlr3filters/old/mlr3filters.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mlr3filters/DESCRIPTION’ ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 2 NOTEs





```
# mlumr

<details>

* Version: 0.1.0
* GitHub: https://github.com/choxos/mlumr
* Source code: https://github.com/cran/mlumr
* Date/Publication: 2026-05-20 08:30:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "mlumr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/mlumr/new/mlumr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mlumr/DESCRIPTION’ ... OK
...
* this is package ‘mlumr’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'copula'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/mlumr/old/mlumr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mlumr/DESCRIPTION’ ... OK
...
* this is package ‘mlumr’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'copula'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# modelbased

<details>

* Version: 0.15.0
* GitHub: https://github.com/easystats/modelbased
* Source code: https://github.com/cran/modelbased
* Date/Publication: 2026-05-10 05:10:20 UTC
* Number of recursive dependencies: 256

Run `revdepcheck::cloud_details(, "modelbased")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modelbased/new/modelbased.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modelbased/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modelbased/old/modelbased.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modelbased/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# multinma

<details>

* Version: 0.9.1
* GitHub: https://github.com/dmphillippo/multinma
* Source code: https://github.com/cran/multinma
* Date/Publication: 2026-04-16 23:10:09 UTC
* Number of recursive dependencies: 153

Run `revdepcheck::cloud_details(, "multinma")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/multinma/new/multinma.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘multinma/DESCRIPTION’ ... OK
...
* this is package ‘multinma’ version ‘0.9.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/multinma/old/multinma.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘multinma/DESCRIPTION’ ... OK
...
* this is package ‘multinma’ version ‘0.9.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# OlinkAnalyze

<details>

* Version: 5.0.0
* GitHub: https://github.com/Olink-Proteomics/OlinkRPackage
* Source code: https://github.com/cran/OlinkAnalyze
* Date/Publication: 2026-03-28 12:00:02 UTC
* Number of recursive dependencies: 234

Run `revdepcheck::cloud_details(, "OlinkAnalyze")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/new/OlinkAnalyze.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/old/OlinkAnalyze.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# outstandR

<details>

* Version: 2.0.0
* GitHub: https://github.com/StatisticsHealthEconomics/outstandR
* Source code: https://github.com/cran/outstandR
* Date/Publication: 2026-06-10 08:40:08 UTC
* Number of recursive dependencies: 160

Run `revdepcheck::cloud_details(, "outstandR")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/outstandR/new/outstandR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘outstandR/DESCRIPTION’ ... OK
...
* this is package ‘outstandR’ version ‘2.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/outstandR/old/outstandR.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘outstandR/DESCRIPTION’ ... OK
...
* this is package ‘outstandR’ version ‘2.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# parameters

<details>

* Version: 0.29.1
* GitHub: https://github.com/easystats/parameters
* Source code: https://github.com/cran/parameters
* Date/Publication: 2026-05-24 12:20:02 UTC
* Number of recursive dependencies: 462

Run `revdepcheck::cloud_details(, "parameters")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/parameters/new/parameters.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘parameters/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/parameters/old/parameters.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘parameters/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# rsdv

<details>

* Version: 0.2.0
* GitHub: https://github.com/kvenkita/rsdv
* Source code: https://github.com/cran/rsdv
* Date/Publication: 2026-06-09 07:00:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::cloud_details(, "rsdv")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/rsdv/new/rsdv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rsdv/DESCRIPTION’ ... OK
...
* this is package ‘rsdv’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/rsdv/old/rsdv.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rsdv/DESCRIPTION’ ... OK
...
* this is package ‘rsdv’ version ‘0.2.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SCpubr

<details>

* Version: 3.0.1
* GitHub: https://github.com/enblacar/SCpubr
* Source code: https://github.com/cran/SCpubr
* Date/Publication: 2026-01-09 15:10:18 UTC
* Number of recursive dependencies: 291

Run `revdepcheck::cloud_details(, "SCpubr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SCpubr/new/SCpubr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/SCpubr/old/SCpubr.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# semanticfa

<details>

* Version: 0.1.0
* GitHub: https://github.com/devon7y/semanticfa
* Source code: https://github.com/cran/semanticfa
* Date/Publication: 2026-06-15 13:00:02 UTC
* Number of recursive dependencies: 197

Run `revdepcheck::cloud_details(, "semanticfa")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/semanticfa/new/semanticfa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semanticfa/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/semanticfa/old/semanticfa.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘semanticfa/DESCRIPTION’ ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes ... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# smoothbp

<details>

* Version: 0.2.7
* GitHub: https://github.com/ABindoff/smoothbp
* Source code: https://github.com/cran/smoothbp
* Date/Publication: 2026-06-16 07:20:02 UTC
* Number of recursive dependencies: 124

Run `revdepcheck::cloud_details(, "smoothbp")` for more info

</details>

## In both

*   checking whether package ‘smoothbp’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/smoothbp/new/smoothbp.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘smoothbp’ ...
** package ‘smoothbp’ successfully unpacked and MD5 sums checked
** using staged installation
Using cargo 1.75.0
Using rustc 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)
Building for CRAN.
Writing `src/Makevars`.
`tools/config.R` has finished.
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
...
export MAKEFLAGS="" && \
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tmp/home/.cargo/bin" && \
RUSTFLAGS=" --print=native-static-libs" cargo build -j 2 --offline --lib --release --manifest-path=./rust/Cargo.toml --target-dir ./rust/target 
error: package `rayon-core v1.13.0` cannot be built because it requires rustc 1.80 or newer, while the currently active rustc version is 1.75.0
Either upgrade to rustc 1.80 or newer, or use
cargo update rayon-core@1.13.0 --precise ver
where `ver` is the latest version of `rayon-core` supporting rustc 1.75.0
make: *** [Makevars:27: rust/target/release/libsmoothbp.a] Error 101
ERROR: compilation failed for package ‘smoothbp’
* removing ‘/tmp/workdir/smoothbp/new/smoothbp.Rcheck/smoothbp’


```
### CRAN

```
* installing *source* package ‘smoothbp’ ...
** package ‘smoothbp’ successfully unpacked and MD5 sums checked
** using staged installation
Using cargo 1.75.0
Using rustc 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)
Building for CRAN.
Writing `src/Makevars`.
`tools/config.R` has finished.
** libs
using C compiler: ‘gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0’
...
export MAKEFLAGS="" && \
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tmp/home/.cargo/bin" && \
RUSTFLAGS=" --print=native-static-libs" cargo build -j 2 --offline --lib --release --manifest-path=./rust/Cargo.toml --target-dir ./rust/target 
error: package `rayon v1.12.0` cannot be built because it requires rustc 1.80 or newer, while the currently active rustc version is 1.75.0
Either upgrade to rustc 1.80 or newer, or use
cargo update rayon@1.12.0 --precise ver
where `ver` is the latest version of `rayon` supporting rustc 1.75.0
make: *** [Makevars:27: rust/target/release/libsmoothbp.a] Error 101
ERROR: compilation failed for package ‘smoothbp’
* removing ‘/tmp/workdir/smoothbp/old/smoothbp.Rcheck/smoothbp’


```
# sprtt

<details>

* Version: 0.3.1
* GitHub: https://github.com/MeikeSteinhilber/sprtt
* Source code: https://github.com/cran/sprtt
* Date/Publication: 2026-05-06 12:20:02 UTC
* Number of recursive dependencies: 165

Run `revdepcheck::cloud_details(, "sprtt")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sprtt/new/sprtt.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sprtt/DESCRIPTION’ ... OK
...
* this is package ‘sprtt’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/sprtt/old/sprtt.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sprtt/DESCRIPTION’ ... OK
...
* this is package ‘sprtt’ version ‘0.3.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# Surrogate

<details>

* Version: 3.4.2
* GitHub: https://github.com/florianstijven/Surrogate-development
* Source code: https://github.com/cran/Surrogate
* Date/Publication: 2026-06-03 15:00:02 UTC
* Number of recursive dependencies: 197

Run `revdepcheck::cloud_details(, "Surrogate")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Surrogate/new/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

Package suggested but not available for checking: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Surrogate/old/Surrogate.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Surrogate/DESCRIPTION’ ... OK
...
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘MBESS’

Package suggested but not available for checking: ‘copula’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# tsitter

<details>

* Version: 0.1.0
* GitHub: https://github.com/r-lib/tsitter
* Source code: https://github.com/cran/tsitter
* Date/Publication: 2026-05-22 09:20:02 UTC
* Number of recursive dependencies: 29

Run `revdepcheck::cloud_details(, "tsitter")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tsitter/new/tsitter.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tsitter/DESCRIPTION’ ... OK
...
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/tsitter/old/tsitter.Rcheck’
* using R version 4.4.0 (2024-04-24)
* using platform: x86_64-pc-linux-gnu
* R was compiled by
    gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
    GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
* running under: Ubuntu 24.04.4 LTS
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tsitter/DESCRIPTION’ ... OK
...
* checking for GNU extensions in Makefiles ... OK
* checking for portable use of $(BLAS_LIBS) and $(LAPACK_LIBS) ... OK
* checking use of PKG_*FLAGS in Makefiles ... OK
* checking compiled code ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# wjake

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/wjake
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "wjake")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
