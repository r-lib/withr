#' @include with_.R

# Makevars --------------------------------------------------------------------

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

#' Makevars variables
#'
#' Temporarily change contents of an existing \code{Makevars} file.
#'
#' @details If no \code{Makevars} file exists or the fields in \code{new} do
#' not exist in the existing \code{Makevars} file then the fields are added to
#' the new file.  Existing fields which are not included in \code{new} are
#' appended unchanged.  Fields which exist in \code{Makevars} and in \code{new}
#' are modified to use the value in \code{new}.
#'
#' @template with
#' @param new \code{[named character]}\cr New variables and their values
#' @param path \code{[character(1)]}\cr location of existing \code{Makevars} file to modify.
#' @export
with_makevars <- function(new, code, path = file.path("~", ".R", "Makevars")) {
  makevars_file <- tempfile()
  on.exit(unlink(makevars_file), add = TRUE)
  with_envvar(c(R_MAKEVARS_USER = makevars_file), {
    set_makevars(new, path, makevars_file)
    force(code)
  })
}
