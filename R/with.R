#' Execute code in temporarily altered environment.
#'
#' @param new values for setting
#' @param code code to execute in that environment
#'
#' @name with_something
#' @examples
#' getwd()
#' in_dir(tempdir(), getwd())
#' getwd()
#'
#' Sys.getenv("HADLEY")
#' with_envvar(c("HADLEY" = 2), Sys.getenv("HADLEY"))
#' Sys.getenv("HADLEY")
#'
#' with_envvar(c("A" = 1),
#'   with_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
#' )
NULL

with_something <- function(set, reset = set, ...) {
  extra_args <- list(...)
  if (length(extra_args) > 0 && !is.named(extra_args)) {
    stop("Only named arguments supported in the ... argument to with_something", call. = FALSE)
  }

  extra_args_names <- names(extra_args)
  extra_args_args <- setNames(lapply(extra_args_names, as.name), extra_args_names)
  set_call <- as.call(c(list(as.name("set"), as.name("new")), extra_args_args))

  append_to_formals(eval(bquote(function(new, code) {
    old <- .(set_call)
    on.exit(reset(old))
    force(code)
  })), extra_args)
}

append_to_formals <- function(f, extra_args) {
  formals(f) <- c(formals(f), extra_args)
  f
}

merge_new <- function(old, new, action, merge_fun = c) {
  action <- match.arg(action, c("replace", "prefix", "suffix"))

  if (action == "suffix") {
    new <- merge_fun(old, new)
  } else if (action == "prefix") {
    new <- merge_fun(new, old)
  }
  new
}

is.named <- function(x) {
  !is.null(names(x)) && all(names(x) != "")
}

# env ------------------------------------------------------------------------

set_envvar <- function(envs, action = "replace") {
  if (length(envs) == 0) return()

  stopifnot(is.named(envs))
  stopifnot(is.character(action), length(action) == 1)
  action <- match.arg(action, c("replace", "prefix", "suffix"))

  # if there are duplicated entries keep only the last one
  envs <- envs[!duplicated(names(envs), fromLast = TRUE)]

  old <- Sys.getenv(names(envs), names = TRUE, unset = NA)
  set <- !is.na(envs)

  both_set <- set & !is.na(old)
  if (any(both_set)) {
    if (action == "prefix") {
      envs[both_set] <- paste(envs[both_set], old[both_set])
    } else if (action == "suffix") {
      envs[both_set] <- paste(old[both_set], envs[both_set])
    }
  }

  if (any(set))  do.call("Sys.setenv", as.list(envs[set]))
  if (any(!set)) Sys.unsetenv(names(envs)[!set])

  invisible(old)
}

#' @describeIn with_something environmental variables
#' @param action (for \code{with_envvar} and \code{with_path} only): should new values
#'    \code{"replace"}, \code{"suffix"}, \code{"prefix"} existing values?
#'    (For \code{with_envvar}, this refers to environmental variables with the same name.)
#' @details if \code{NA} is used as a value with \code{with_envvar} those
#' environment variables will be unset.  If there are any duplicated variable
#' names only the last one is used.
#' @export
with_envvar <- with_something(set_envvar, action = "replace")

# locale ---------------------------------------------------------------------

set_locale <- function(cats) {
  stopifnot(is.named(cats), is.character(cats))

  old <- vapply(names(cats), Sys.getlocale, character(1))

  mapply(Sys.setlocale, names(cats), cats)
  invisible(old)
}

#' @describeIn with_something any locale setting
#' @export
with_locale <- with_something(set_locale)

# collate --------------------------------------------------------------------

set_collate <- function(locale) set_locale(c(LC_COLLATE = locale))[[1]]

#' @describeIn with_something collation order
#' @export
with_collate <- with_something(set_collate)

# working directory ----------------------------------------------------------

#' @describeIn with_something working directory
#' @aliases with_dir
#' @export
in_dir <- with_dir <- with_something(setwd)


# lib ------------------------------------------------------------------------

set_libpaths <- function(paths, action) {
  paths <- normalizePath(paths, mustWork = TRUE)

  old <- .libPaths()
  paths <- merge_new(old, paths, action)

  .libPaths(paths)
  invisible(old)
}

#' @describeIn with_something library paths, replacing current libpaths
#' @export
with_libpaths <- with_something(set_libpaths, .libPaths, action = "replace")

# options --------------------------------------------------------------------

set_options <- function(new_options) {
  do.call(options, as.list(new_options))
}

#' @describeIn with_something options
#' @export
with_options <- with_something(set_options)

# par ------------------------------------------------------------------------

#' @describeIn with_something graphics parameters
#' @export
with_par <- with_something(par)

# path -----------------------------------------------------------------------

#' @describeIn with_something PATH environment variable
#' @export
with_path <- with_something(set_path, function(old) set_path(old, "replace"), action = "prefix")

set_makevars <- function(variables,
                         old_path = file.path("~", ".R", "Makevars"),
                         new_path = tempfile()) {
  if (length(variables) == 0) {
    return()
  }
  stopifnot(is.named(variables))

  old <- NULL
  if (file.exists(old_path)) {
    lines <- readLines(old_path)
    old <- lines
    for (var in names(variables)) {
      loc <- grep(paste(c("^[[:space:]]*", var, "[[:space:]]*", "="), collapse = ""), lines)
      if (length(loc) == 0) {
        lines <- append(lines, paste(sep = "=", var, variables[var]))
      } else if(length(loc) == 1) {
        lines[loc] <- paste(sep = "=", var, variables[var])
      } else {
        stop("Multiple results for ", var, " found, something is wrong.", .call = FALSE)
      }
    }
  } else {
    lines <- paste(names(variables), variables, sep = "=")
  }

  if (!identical(old, lines)) {
    writeLines(con = new_path, lines)
  }

  old
}

#' @describeIn with_something Makevars variables
#' @param path location of existing makevars to modify.
#' @details If no existing makevars file exists or the fields in \code{new} do
#' not exist in the existing \code{Makevars} file then the fields are added to
#' the new file.  Existing fields which are not included in \code{new} are
#' appended unchanged.  Fields which exist in \code{Makevars} and in \code{new}
#' are modified to use the value in \code{new}.
#' @export
with_makevars <- function(new, code, path = file.path("~", ".R", "Makevars")) {
  makevars_file <- tempfile()
  on.exit(unlink(makevars_file), add = TRUE)
  with_envvar(c(R_MAKEVARS_USER = makevars_file), {
      set_makevars(new, path, makevars_file)
      force(code)
  })
}
