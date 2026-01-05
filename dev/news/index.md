# Changelog

## withr (development version)

## withr 3.0.2

CRAN release: 2024-10-28

- [`local_language()`](https://withr.r-lib.org/dev/reference/with_language.md)
  now never warns when set to `"C"`
  ([\#254](https://github.com/r-lib/withr/issues/254)). This is a
  cross-platform and silent way of disabling
  [`gettext()`](https://rdrr.io/r/base/gettext.html) translations.

## withr 3.0.1

CRAN release: 2024-07-31

- Fixes for CRAN checks.

## withr 3.0.0

CRAN release: 2024-01-16

### Performance of withr

- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) is now a
  thin wrapper around
  [`base::on.exit()`](https://rdrr.io/r/base/on.exit.html). This is
  possible thanks to two contributions that we made to R 3.5:

  - We added an argument for LIFO cleanup: `on.exit(after = FALSE)`.
  - Calling [`sys.on.exit()`](https://rdrr.io/r/base/sys.parent.html)
    elsewhere than top-level didn’t work. This is needed for manual
    invocation with
    [`deferred_run()`](https://withr.r-lib.org/dev/reference/defer.md).

  Following this change,
  [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) is now
  much faster (although still slower than
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html) which is a
  primitive function and about as fast as it gets). This also increases
  the compatibility of
  [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) with
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html) (all handlers are
  now run in the expected order even if they are registered with
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html)) and standalone
  versions of
  [`defer()`](https://withr.r-lib.org/dev/reference/defer.md).

### Breaking change

- When [`source()`](https://rdrr.io/r/base/source.html) is used with a
  local environment, as opposed to
  [`globalenv()`](https://rdrr.io/r/base/environment.html) (the
  default), you now need to set `options(withr.hook_source = TRUE)` to
  get proper withr support (running
  [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) or
  `local_` functions at top-level of a script). This support is disabled
  by default in local environments to avoid a performance penalty in
  normal usage of withr features.

### Other features and bugfixes

- [`deferred_run()`](https://withr.r-lib.org/dev/reference/defer.md) now
  reports the number of executed expressions with a message.

- [`deferred_run()`](https://withr.r-lib.org/dev/reference/defer.md) can
  now be run at any point in a knitr file
  ([\#235](https://github.com/r-lib/withr/issues/235)).

- [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  now writes `lines` in UTF-8
  ([\#210](https://github.com/r-lib/withr/issues/210)) and always uses
  `\n` for newlines
  ([\#216](https://github.com/r-lib/withr/issues/216)).

- [`local_pdf()`](https://withr.r-lib.org/dev/reference/devices.md) and
  friends now correctly restore to the previously active device
  ([\#138](https://github.com/r-lib/withr/issues/138)).

- [`local_()`](https://withr.r-lib.org/dev/reference/with_.md) now works
  even if withr isn’t attached
  ([\#207](https://github.com/r-lib/withr/issues/207)).

- [`local_par()`](https://withr.r-lib.org/dev/reference/with_par.md) and
  [`with_par()`](https://withr.r-lib.org/dev/reference/with_par.md) now
  work if you don’t set any parameters
  ([\#238](https://github.com/r-lib/withr/issues/238)).

- [`with_language()`](https://withr.r-lib.org/dev/reference/with_language.md)
  now properly resets the translation cache
  ([\#213](https://github.com/r-lib/withr/issues/213)).

- Fixes for Debian packaging.

## withr 2.5.2

CRAN release: 2023-10-30

- Fixes for CRAN checks.

## withr 2.5.1

CRAN release: 2023-09-26

- Fixes for CRAN checks.

## withr 2.5.0

CRAN release: 2022-03-03

- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) and all
  `local_*()` functions now work when run inside of a `.Rmd`. The
  deferred expressions are executed when knitr exits.

- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) and
  `local_` functions now work within
  [`source()`](https://rdrr.io/r/base/source.html). The deferred
  expressions are executed when
  [`source()`](https://rdrr.io/r/base/source.html) exits.

- [`with_()`](https://withr.r-lib.org/dev/reference/with_.md) and
  [`local_()`](https://withr.r-lib.org/dev/reference/with_.md) gain a
  `get` argument. Supply a getter function to create `with` and `local`
  functions that are robust to early exits.

  When supplied, this restoration pattern is used:

      old <- get()
      on.exit(set(old))
      set(new)
      action()

  Instead of:

      old <- set(new)
      on.exit(set(old))
      action()

  This ensures proper restoration of the old state when an early exit
  occurs during `set()` (for instance when a deprecation warning is
  caught, see [\#191](https://github.com/r-lib/withr/issues/191)).

- These `with_` and `local_` functions are now robust to early exits
  (see next bullet):

  - `_locale()`
  - `_envvar()`
  - `_libpaths()`
  - `_options()`
  - `_par()`
  - `_path()`
  - `_seed()`

- [`with_namespace()`](https://withr.r-lib.org/dev/reference/with_package.md)
  and
  [`local_namespace()`](https://withr.r-lib.org/dev/reference/with_package.md)
  now pass `warn.conflicts` to
  [`attach()`](https://rdrr.io/r/base/attach.html)
  ([@kyleam](https://github.com/kyleam),
  [\#185](https://github.com/r-lib/withr/issues/185)).

- [`local_rng_version()`](https://withr.r-lib.org/dev/reference/with_rng_version.md)
  and
  [`local_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  no longer warn when restoring `sample.kind` to `"Rounding"`
  ([\#167](https://github.com/r-lib/withr/issues/167)).

- [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  now preserves the current values of
  [`RNGkind()`](https://rdrr.io/r/base/Random.html)
  ([\#167](https://github.com/r-lib/withr/issues/167)).

- [`with_collate()`](https://withr.r-lib.org/dev/reference/with_collate.md)
  is no longer affected by the `LC_COLLATE` environment variable set to
  “C” ([\#179](https://github.com/r-lib/withr/issues/179)).

- Local evaluations in the
  [`globalenv()`](https://rdrr.io/r/base/environment.html) (as opposed
  to top-level ones) are now unwound in the same way as regular
  environments.

- [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  gains a lines argument so, if desired, you can pre-fill the temporary
  file with some data.

## withr 2.4.3

CRAN release: 2021-11-30

- Lionel Henry is the new maintainer.

- Handlers registered with the global environment (as happens when
  [`local_()`](https://withr.r-lib.org/dev/reference/with_.md) is run at
  the top-level, outside a function) are now automatically run when the
  R session ends ([\#173](https://github.com/r-lib/withr/issues/173)).

- New
  [`with_language()`](https://withr.r-lib.org/dev/reference/with_language.md)
  and
  [`local_language()`](https://withr.r-lib.org/dev/reference/with_language.md)
  to temporarily control the language used for translations
  ([\#180](https://github.com/r-lib/withr/issues/180)).

- [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  now caches the check for R version, so is now faster
  ([\#170](https://github.com/r-lib/withr/issues/170))

- [`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  and
  [`local_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  now eagerly evaluate the `path` argument
  ([\#169](https://github.com/r-lib/withr/issues/169))

## withr 2.4.2

CRAN release: 2021-04-18

- [`local_options()`](https://withr.r-lib.org/dev/reference/with_options.md)
  now lets you set an option to `NULL` as intended
  ([\#156](https://github.com/r-lib/withr/issues/156))

- [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  argument `envir` is deprecated, in favor of `.local_envir`. All withr
  functions except
  [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  used `.local_envir` to specify environments, so this makes this
  function consistent with the rest.
  ([\#157](https://github.com/r-lib/withr/issues/157))

- [`with_environment()`](https://withr.r-lib.org/dev/reference/with_package.md)
  now passing `pos` and `warn.conflicts` to
  [`attach()`](https://rdrr.io/r/base/attach.html), as intended
  ([\#161](https://github.com/r-lib/withr/issues/161)).

- [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  now also sets the RNG via new arguments `.rng_kind`,
  `.rng_normal_kind` and `.rng_sample_kind`
  ([\#162](https://github.com/r-lib/withr/issues/162),
  [@AshesITR](https://github.com/AshesITR)).

- [`with_timezone()`](https://withr.r-lib.org/dev/reference/with_timezone.md)
  now works after recent changes to
  [`Sys.timezone()`](https://rdrr.io/r/base/timezones.html) in R-devel
  ([\#165](https://github.com/r-lib/withr/issues/165))

## withr 2.4.1

CRAN release: 2021-01-26

- Tests which require `capabilities("cairo")` are now skipped.

## withr 2.4.0

CRAN release: 2021-01-16

- withr is now licensed as MIT
  ([\#154](https://github.com/r-lib/withr/issues/154)).

- Tests for
  [`with_cairo_pdf()`](https://withr.r-lib.org/dev/reference/devices.md)
  and
  [`with_cairo_ps()`](https://withr.r-lib.org/dev/reference/devices.md)
  have been removed, as they fail if Cairo is not available, such as
  with M1 macOS systems
  ([\#158](https://github.com/r-lib/withr/issues/158))

- [`local_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  is now exported ([\#153](https://github.com/r-lib/withr/issues/153))

## withr 2.3.0

CRAN release: 2020-09-22

### Deprecations

- [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  argument `new` is deprecated, in favor of returning the path to the
  new tempfile. calls like `local_tempfile("xyz")` should be replaced
  with `xyx <- local_tempfile()` in your code
  ([\#141](https://github.com/r-lib/withr/issues/141)).

### New features

- New
  [`local_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  function and
  [`local_preserve_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  functions to correspond to
  [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  and
  [`with_preserve_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  ([\#139](https://github.com/r-lib/withr/issues/139)).

- New
  [`local_tempdir()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  function added to create a temp directory
  ([\#140](https://github.com/r-lib/withr/issues/140))

- `local_*()` functions now take dots (`...`), which can simplify calls
  in some cases, e.g. you can now use `local_options(foo = "bar")`
  rather than `local_options(c(foo = "bar"))`.

### Minor improvements and fixes

- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) now throws
  an error if an error occurs in the deferred expression
  ([\#148](https://github.com/r-lib/withr/issues/148))

- [`with_file()`](https://withr.r-lib.org/dev/reference/with_file.md)
  and
  [`local_file()`](https://withr.r-lib.org/dev/reference/with_file.md)
  can now work if the file is actually a directory
  ([\#144](https://github.com/r-lib/withr/issues/144)).

## withr 2.2.0

CRAN release: 2020-04-20

- [`defer()`](https://withr.r-lib.org/dev/reference/defer.md) can set
  deferred events on `.GlobalEnv` to facilitate the interactive
  development of code inside a function or test. Helpers
  [`deferred_run()`](https://withr.r-lib.org/dev/reference/defer.md)
  (and
  [`deferred_clear()`](https://withr.r-lib.org/dev/reference/defer.md))
  provide a way to explicity run and clear (or just clear) deferred
  events ([\#76](https://github.com/r-lib/withr/issues/76),
  [@jennybc](https://github.com/jennybc)).

- [`with_connection()`](https://withr.r-lib.org/dev/reference/with_connection.md)
  now works when existing objects or connections exist with the same
  names ([\#120](https://github.com/r-lib/withr/issues/120))

- [`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  now uses
  [`tools::makevars_user()`](https://rdrr.io/r/tools/makevars.html) to
  determine the default user makevars file
  ([\#77](https://github.com/r-lib/withr/issues/77),
  [@siddharthab](https://github.com/siddharthab)).

- [`with_options()`](https://withr.r-lib.org/dev/reference/with_options.md)
  no longer uses [`do.call()`](https://rdrr.io/r/base/do.call.html), so
  optiosn are not evaluated on exit
  ([\#73](https://github.com/r-lib/withr/issues/73),
  [@mtmorgan](https://github.com/mtmorgan)).

- [`with_package()`](https://withr.r-lib.org/dev/reference/with_package.md)
  no longer has the `help` argument
  ([\#94](https://github.com/r-lib/withr/issues/94),
  [@wendtke](https://github.com/wendtke)).

- [`with_package()`](https://withr.r-lib.org/dev/reference/with_package.md)
  now does not try to detach the package if it is already attached
  before calling
  [`with_package()`](https://withr.r-lib.org/dev/reference/with_package.md)
  ([\#107](https://github.com/r-lib/withr/issues/107))

- [`with_preserve_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  now restores `.Random.seed` if it is not set originally
  ([\#124](https://github.com/r-lib/withr/issues/124)).

- Add
  [`with_rng_version()`](https://withr.r-lib.org/dev/reference/with_rng_version.md)
  and
  [`local_rng_version()`](https://withr.r-lib.org/dev/reference/with_rng_version.md)
  functions to change the version of the RNG
  ([\#90](https://github.com/r-lib/withr/issues/90),
  [@gaborcsardi](https://github.com/gaborcsardi)).

- [`with_svg()`](https://withr.r-lib.org/dev/reference/devices.md)
  documentation now is consistent across R versions
  ([\#129](https://github.com/r-lib/withr/issues/129))

- Add
  [`with_timezone()`](https://withr.r-lib.org/dev/reference/with_timezone.md)
  and
  [`local_timezone()`](https://withr.r-lib.org/dev/reference/with_timezone.md)
  functions to change the time zone
  ([\#92](https://github.com/r-lib/withr/issues/92),
  [@gaborcsardi](https://github.com/gaborcsardi)).

- [`with_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  and
  [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  now delete recursively directories on exit
  ([\#84](https://github.com/r-lib/withr/issues/84),
  [@meta00](https://github.com/meta00)).

## withr 2.1.2

CRAN release: 2018-03-15

- [`set_makevars()`](https://withr.r-lib.org/dev/reference/set_makevars.md)
  is now exported ([\#68](https://github.com/r-lib/withr/issues/68),
  [@gaborcsardi](https://github.com/gaborcsardi)).

- [`with_temp_libpaths()`](https://withr.r-lib.org/dev/reference/with_temp_libpaths.md)
  gains an `action` argument, to specify how the temporary library path
  will be added ([\#66](https://github.com/r-lib/withr/issues/66),
  [@krlmlr](https://github.com/krlmlr)).

## withr 2.1.1

CRAN release: 2017-12-19

- Fixes test failures with testthat 2.0.0

- [`with_file()`](https://withr.r-lib.org/dev/reference/with_file.md)
  function to automatically remove files.

## withr 2.1.0

CRAN release: 2017-11-01

- [`with_connection()`](https://withr.r-lib.org/dev/reference/with_connection.md)
  function to automatically close R file connections.

- [`with_db_connection()`](https://withr.r-lib.org/dev/reference/with_db_connection.md)
  function to automatically disconnect from DBI database connections.

- `with_gctorture2` command to run code with gctorture2, useful for
  testing ([\#47](https://github.com/r-lib/withr/issues/47)).

- [`with_package()`](https://withr.r-lib.org/dev/reference/with_package.md),
  [`with_namespace()`](https://withr.r-lib.org/dev/reference/with_package.md)
  and
  [`with_environment()`](https://withr.r-lib.org/dev/reference/with_package.md)
  (and equivalent locals) functions added, to run code with a modified
  object search path ([\#38](https://github.com/r-lib/withr/issues/38),
  [\#48](https://github.com/r-lib/withr/issues/48)).

- Add
  [`with_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  and
  [`local_tempfile()`](https://withr.r-lib.org/dev/reference/with_tempfile.md)
  functions to create temporary files which are cleanup up afterwards.
  ([\#32](https://github.com/r-lib/withr/issues/32))

- Remove the `code` argument from `local_` functions
  ([\#50](https://github.com/r-lib/withr/issues/50)).

## withr 2.0.0

CRAN release: 2017-07-28

- Each `with_` function now has a `local_` variant, which reset at the
  end of their local scope, generally at the end of the function body.

- New functions
  [`with_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  and
  [`with_preserve_seed()`](https://withr.r-lib.org/dev/reference/with_seed.md)
  for running code with a given random seed
  ([\#45](https://github.com/r-lib/withr/issues/45),
  [@krlmlr](https://github.com/krlmlr)).

## withr 1.0.2

CRAN release: 2016-06-20

- [`with_makevars()`](https://withr.r-lib.org/dev/reference/with_makevars.md)
  gains an `assignment` argument to allow specifying additional
  assignment types.

## withr 1.0.1

CRAN release: 2016-02-04

- Relaxed R version requirement to 3.0.2
  ([\#35](https://github.com/r-lib/withr/issues/35),
  [\#39](https://github.com/r-lib/withr/issues/39)).
- New
  [`with_output_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md)
  and
  [`with_message_sink()`](https://withr.r-lib.org/dev/reference/with_sink.md)
  ([\#24](https://github.com/r-lib/withr/issues/24)).

## withr 1.0.0

CRAN release: 2015-09-23

- First Public Release
