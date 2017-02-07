#' @include with_.R

# Makevars --------------------------------------------------------------------

set_makevars <- function(variables,
                         old_path = file.path("~", ".R", "Makevars"),
                         new_path = tempfile(),
                         assignment = c("=", ":=", "?=", "+=")) {
  if (length(variables) == 0) {
    return()
  }
  stopifnot(is.named(variables))

  assignment <- match.arg(assignment)

  old <- NULL
  if (file.exists(old_path)) {
    lines <- readLines(old_path)
    old <- lines
    for (var in names(variables)) {
      loc <- grep(paste(c("^[[:space:]]*", var, "[[:space:]]*", "="), collapse = ""), lines)
      if (length(loc) == 0) {
        lines <- append(lines, paste(sep = assignment, var, variables[var]))
      } else if(length(loc) == 1) {
        lines[loc] <- paste(sep = assignment, var, variables[var])
      } else {
        stop("Multiple results for ", var, " found, something is wrong.", .call = FALSE)
      }
    }
  } else {
    lines <- paste(names(variables), variables, sep = assignment)
  }

  if (!identical(old, lines)) {
    writeLines(con = new_path, lines)
  }

  old
}

#' Makevars variables
#'
#' Temporarily change contents of an existing `Makevars` file.
#'
#' @details If no `Makevars` file exists or the fields in `new` do
#' not exist in the existing `Makevars` file then the fields are added to
#' the new file.  Existing fields which are not included in `new` are
#' appended unchanged.  Fields which exist in `Makevars` and in `new`
#' are modified to use the value in `new`.
#'
#' @template with
#' @param new `[named character]`\cr New variables and their values
#' @param path `[character(1)]`\cr location of existing `Makevars` file to modify.
#' @param assignment `[character(1)]`\cr assignment type to use.
#' @export
with_makevars <- function(new, code, path = file.path("~", ".R", "Makevars"), assignment = c("=", ":=", "?=", "+=")) {
  assignment <- match.arg(assignment)
  makevars_file <- tempfile()
  on.exit(unlink(makevars_file), add = TRUE)
  with_envvar(c(R_MAKEVARS_USER = makevars_file), {
    set_makevars(new, path, makevars_file, assignment = assignment)
    force(code)
  })
}

local_makevars <- function(new, path = file.path("~", ".R", "Makevars"), assignment = c("=", ":=", "?=", "+="), .local_envir = parent.frame()) {
  assignment <- match.arg(assignment)
  makevars_file <- tempfile()
  defer(unlink(makevars_file), envir = .local_envir)
  local_envvar(c(R_MAKEVARS_USER = makevars_file), .local_envir = .local_envir)
  set_makevars(new, path, makevars_file, assignment = assignment)
}
