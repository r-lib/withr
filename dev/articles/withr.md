# Changing and restoring state

``` r
library(withr)
```

This article explains the type of problem withr solves and shows typical
patterns of usage. It also compares withr’s functionality to the
[`on.exit()`](https://rdrr.io/r/base/on.exit.html) function from base R.

## It’s dangerous to change state

Whenever possible, it is desirable to write so-called **pure**
functions. The property we focus on here is that the function should not
change the surrounding R landscape, i.e. it should not change things
like the search path, global options, or the working directory. If the
behaviour of *other* functions differs before and after running your
function, you’ve modified the landscape. Changing the landscape is bad
because it makes code much harder to understand.

Here’s a `sloppy()` function that prints a number with a specific number
of significant digits, by adjusting R’s global “digits” option.

``` r
sloppy <- function(x, sig_digits) {
  options(digits = sig_digits)
  print(x)
}

pi
#> [1] 3.141593

sloppy(pi, 2)
#> [1] 3.1

pi
#> [1] 3.1
```

Notice how `pi` prints differently before and after the call to
`sloppy()`? Calling `sloppy()` has a side effect: it changes the
“digits” option globally, not just within its own scope of operations.
This is what we want to avoid.

*Don’t worry, we’re restoring global state (specifically, the “digits”
option) behind the scenes here.*

Sometimes you cannot avoid modifying the state of the world, in which
case you just have to make sure that you put things back the way you
found them. This is what the withr package is for.

## The base solution: `on.exit()`

The first function to know about is base R’s
[`on.exit()`](https://rdrr.io/r/base/on.exit.html). Inside your function
body, every time you do something that should be undone **on exit**, you
immediately register the cleanup code with
`on.exit(expr, add = TRUE)`[¹](#fn1).

`neat()` is an improvement over `sloppy()`, because it uses
[`on.exit()`](https://rdrr.io/r/base/on.exit.html) to ensure that the
“digits” option is restored to its original value.

``` r
neat <- function(x, sig_digits) {
  op <- options(digits = sig_digits)
  on.exit(options(op), add = TRUE)
  print(x)
}

pi
#> [1] 3.141593

neat(pi, 2)
#> [1] 3.1

pi
#> [1] 3.141593
```

[`on.exit()`](https://rdrr.io/r/base/on.exit.html) also works when you
exit the function abnormally, i.e. due to error. This is why official
tools, like [`on.exit()`](https://rdrr.io/r/base/on.exit.html), are a
better choice than any do-it-yourself solution to this problem.

[`on.exit()`](https://rdrr.io/r/base/on.exit.html) is a very useful
function, but it’s not very flexible. The withr package provides an
extensible [`on.exit()`](https://rdrr.io/r/base/on.exit.html)-inspired
toolkit.

## `defer()` is the foundation of withr

[`defer()`](https://withr.r-lib.org/dev/reference/defer.md) is the core
function of withr and is very much like
[`on.exit()`](https://rdrr.io/r/base/on.exit.html), i.e. it schedules
the execution of arbitrary code when the current function exits:

``` r
neater <- function(x, sig_digits) {
  op <- options(digits = sig_digits)
  defer(options(op))
  print(x)
}

pi
#> [1] 3.141593

neater(pi, 2)
#> [1] 3.1

pi
#> [1] 3.141593
```

[`withr::defer()`](https://withr.r-lib.org/dev/reference/defer.md) is
basically a drop-in substitute for
[`on.exit()`](https://rdrr.io/r/base/on.exit.html), but with three key
differences we explore below:

1.  Different default behaviour around the effect of a series of two or
    more calls
2.  Control over the environment the deferred events are associated with
3.  Ability to work with the global environment

Here we focus on using withr inside your functions. See the blog post
[Self-cleaning test
fixtures](https://www.tidyverse.org/blog/2020/04/self-cleaning-test-fixtures/)
or the testthat vignette [Test
fixtures](https://testthat.r-lib.org/articles/test-fixtures.html) for
how to use withr inside tests.

## Last-in, first-out

If you make more than one call to
[`defer()`](https://withr.r-lib.org/dev/reference/defer.md), by default,
it **adds** expressions to the **top** of the stack of deferred actions.

``` r
defer_stack <- function() {
  cat("put on socks\n")
  defer(cat("take off socks\n"))
  
  cat("put on shoes\n")
  defer(cat("take off shoes\n"))
}
defer_stack()
#> put on socks
#> put on shoes
#> take off shoes
#> take off socks
```

In contrast, by default, a subsequent call to
[`on.exit()`](https://rdrr.io/r/base/on.exit.html) **overwrites** the
deferred actions registered in the previous call.

``` r
on_exit_last_one_wins <- function() {
  cat("put on socks\n")
  on.exit(cat("take off socks\n"))
  
  cat("put on shoes\n")
  on.exit(cat("take off shoes\n"))
}
on_exit_last_one_wins()
#> put on socks
#> put on shoes
#> take off shoes
```

Oops, we still have our socks on! The last-in, first-out, stack-like
behaviour of [`defer()`](https://withr.r-lib.org/dev/reference/defer.md)
tends to be what you want in most applications.

To get such behaviour with
[`on.exit()`](https://rdrr.io/r/base/on.exit.html), remember to call it
with `add = TRUE, after = FALSE`[²](#fn2).

``` r
on_exit_stack <- function() {
  cat("put on socks\n")
  on.exit(cat("take off socks\n"), add = TRUE, after = FALSE)
  
  cat("put on shoes\n")
  on.exit(cat("take off shoes\n"), add = TRUE, after = FALSE)
}
on_exit_stack()
#> put on socks
#> put on shoes
#> take off shoes
#> take off socks
```

Conversely, if you want
[`defer()`](https://withr.r-lib.org/dev/reference/defer.md) to have
first-in, first-out behaviour, specify `priority = "last"`.

``` r
defer_queue <- function() {
  cat("Adam gets in line for ice cream\n")
  defer(cat("Adam gets ice cream\n"), priority = "last")

  cat("Beth gets in line for ice cream\n")
  defer(cat("Beth gets ice cream\n"), priority = "last")
}
defer_queue()
#> Adam gets in line for ice cream
#> Beth gets in line for ice cream
#> Adam gets ice cream
#> Beth gets ice cream
```

## “Local” functions (and “with” functions)

Both [`on.exit()`](https://rdrr.io/r/base/on.exit.html) and
[`withr::defer()`](https://withr.r-lib.org/dev/reference/defer.md)
schedule actions to be executed when a certain environment goes out of
scope, most typically the execution environment of a function. But the
`envir` argument of
[`withr::defer()`](https://withr.r-lib.org/dev/reference/defer.md) lets
you specify a *different* environment, which makes it possible to create
customised [`on.exit()`](https://rdrr.io/r/base/on.exit.html)
extensions.

Let’s look at the `neater()` function again.

``` r
neater <- function(x, sig_digits) {
  op <- options(digits = sig_digits) # record orig. "digits" & change "digits"
  defer(options(op))                 # schedule restoration of "digits"
  
  print(x)
}
```

The first two lines are typical
[`on.exit()`](https://rdrr.io/r/base/on.exit.html) maneuvers where, in
some order, you record an original state, arrange for its eventual
restoration, and change it. In real life, this can be much more involved
and you might want to wrap this logic up into a helper function. You
can’t wrap [`on.exit()`](https://rdrr.io/r/base/on.exit.html) in this
way, because there’s no way to reach back up into the correct parent
frame and schedule cleanup there. But with
[`defer()`](https://withr.r-lib.org/dev/reference/defer.md), we can!
Here is such a custom helper, called `local_digits()`.

``` r
local_digits <- function(sig_digits, envir = parent.frame()) {
  op <- options(digits = sig_digits)
  defer(options(op), envir = envir)
}
```

We can use `local_digits()` to keep any manipulation of `digits` local
to a function.

``` r
neato <- function(x, digits) {
  local_digits(digits)
  print(x)
}

pi
#> [1] 3.141593

neato(pi, 2)
#> [1] 3.1

neato(pi, 4)
#> [1] 3.142
```

You can even call `local_digits()` multiple times inside a function.
Each call to `local_digits()` is in effect until the next or until the
function exits, which ever comes first.

``` r
neatful <- function(x) {
  local_digits(1)
  print(x)
  local_digits(3)
  print(x)
  local_digits(5)
  print(x)
}

neatful(pi)
#> [1] 3
#> [1] 3.14
#> [1] 3.1416
```

Certain state changes, such as modifying global options, come up so
often that withr offers pre-made helpers. These helpers come in two
forms: `local_*()` functions, like the one we just made, and `with_*()`
functions, which we explain below. Here are the state change helpers in
withr that you are most likely to find useful:

| Do / undo this              | withr functions                                                                                                                                      |
|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set an R option             | [`local_options()`](https://withr.r-lib.org/dev/reference/with_options.md),[`with_options()`](https://withr.r-lib.org/dev/reference/with_options.md) |
| Set an environment variable | [`local_envvar()`](https://withr.r-lib.org/dev/reference/with_envvar.md), [`with_envvar()`](https://withr.r-lib.org/dev/reference/with_envvar.md)    |
| Change working directory    | [`local_dir()`](https://withr.r-lib.org/dev/reference/with_dir.md), [`with_dir()`](https://withr.r-lib.org/dev/reference/with_dir.md)                |
| Set a graphics parameter    | [`local_par()`](https://withr.r-lib.org/dev/reference/with_par.md), [`with_par()`](https://withr.r-lib.org/dev/reference/with_par.md)                |

We didn’t really need to write our own `local_digits()` helper, because
the built-in
[`withr::local_options()`](https://withr.r-lib.org/dev/reference/with_options.md)
also gets the job done:

``` r
neatest <- function(x, sig_digits) {
  local_options(list(digits = sig_digits))
  print(x)
}

pi
#> [1] 3.141593

neatest(pi, 2)
#> [1] 3.1

neatest(pi, 4)
#> [1] 3.142
```

The `local_*()` functions target a slightly different use case from the
`with_*()` functions, which are inspired by base R’s
[`with()`](https://rdrr.io/r/base/with.html) function:

- `with_*()` functions are best for executing a small snippet of code
  with a modified state

  ``` r
  neat_with <- function(x, sig_digits) {
    # imagine lots of code here
    withr::with_options(
      list(digits = sig_digits),
      print(x)
    )
    # ... and a lot more code here
  }
  ```

- `local_*()` functions are best for modifying state “from now until the
  function exits”

  ``` r
  neat_local <- function(x, sig_digits) {
    withr::local_options(list(digits = sig_digits))
    print(x)
    # imagine lots of code here
  }
  ```

It’s best to minimize the footprint of your state modifications.
Therefore, use `with_*()` functions where you can. But when this forces
you to put lots of (indented) code inside `with_*()`, e.g. most of your
function’s body, then it’s better to use `local_*()`.

## Deferring events on the global environment

Here is one last difference between
[`withr::defer()`](https://withr.r-lib.org/dev/reference/defer.md) and
[`on.exit()`](https://rdrr.io/r/base/on.exit.html): the ability to defer
events on the global environment[³](#fn3).

At first, it sounds pretty weird to propose scheduling deferred actions
on the global environment. It’s not ephemeral, the way function
execution environments are. It goes out of scope very rarely, i.e. when
you exit R. Why would you want this?

The answer is: for development purposes.

If you are developing functions or tests that use withr, it’s very
useful to be able to execute that code interactively, without error, and
with the ability to trigger the deferred events. It’s hard to develop
with functions that work one way inside a function, but another way in
the global environment (or, worse, throw an error).

Here’s how [`defer()`](https://withr.r-lib.org/dev/reference/defer.md)
(and all functions based on it) works in an interactive session.

``` r
library(withr)

defer(print("hi"))

pi
#> [1] 3.141593

# this adds another deferred event, but does not re-message
local_digits(3)

pi
#> [1] 3.14

deferred_run()
#> [1] "hi"
#> Ran 2/2 deferred expressions

pi
#> [1] 3.141593
```

Note that because this example is running in a vignette, it doesn’t look
exactly the same as what you’ll see interactively. When you defer events
on the global environment for the first time, you get this message that
alerts you to the situation:

``` r
defer(print("hi"))
#> Setting global deferred event(s).
#> i These will be run:
#>   * Automatically, when the R session ends.
#>   * On demand, if you call `withr::deferred_run()`.
#> i Use `withr::deferred_clear()` to clear them without executing.
```

If you add subsequent events, the message is *not* repeated. Since the
global environment isn’t perishable, like a test environment is, you
have to call
[`deferred_run()`](https://withr.r-lib.org/dev/reference/defer.md)
explicitly to execute the deferred events. You can also clear them,
without running, with
[`deferred_clear()`](https://withr.r-lib.org/dev/reference/defer.md).

------------------------------------------------------------------------

1.  It’s too bad `add = TRUE` isn’t the default, because you almost
    always want this. Without it, each call to
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) clobbers the
    effect of previous calls.

2.  Note: the `after` argument of
    [`on.exit()`](https://rdrr.io/r/base/on.exit.html) first appeared in
    R 3.5.0.

3.  This feature first appeared in withr v2.2.0.
