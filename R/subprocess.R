#' Run R commands in a R subprocess
#'
#' this function runs a R subprocess with expressions given in ..., trying to
#' replicate as much of the calling environment as possible, then returning the
#' results to the calling environment.
#' @param code expression to call in the subprocess
#' @param calling_env the environment of the calling function.
#' @param global_env the global environment to load in the subprocess.
#' @param clean whether to clean the Rout files generated from the subprocess.
#' @param quiet whether to echo the R command run.
subprocess <- function(code, calling_env = parent.frame(),
                            global_env = .GlobalEnv, # nolint
                            quiet = TRUE,
                            clean = TRUE) {
  tmp_calling_env <- tempfile()
  tmp_global_env <- tempfile()

  tmp_code <- tempfile()
  tmp_objs <- tempfile()

  saveRDS(code, file = tmp_code)

  saveRDS(calling_env, file = tmp_calling_env)

  save(list = ls(envir = global_env, all.names = TRUE),
       envir = global_env,
       file = tmp_global_env)

  tmp_source <- tempfile()

  command <- sprintf(
    paste(sep = "\n",
      "load('%s')",
      ".code <- readRDS('%s')",
      "fun <- function() {",
      "    for(.expr in .code) {",
      "      eval(.expr)",
      "    }",
      "  .new_objs <- ls(environment())",
      "  if (length(.new_objs) > 0) {",
      "    save(list = .new_objs, file = '%s')",
      "  }",
      "  invisible(.new_objs)",
      "}",
      ".env <- readRDS('%s')",
      "environment(fun) <- .env",
      "fun()"),
    normalizePath(tmp_global_env, winslash = "/", mustWork = FALSE),
    normalizePath(tmp_code, winslash = "/", mustWork = FALSE),
    normalizePath(tmp_objs, winslash = "/", mustWork = FALSE),
    normalizePath(tmp_calling_env, winslash = "/", mustWork = FALSE)
  )

  writeChar(con = tmp_source, command, eos = NULL)
  output <- R(options=c("-f", tmp_source, "--slave"),
                             path = ".",
                             quiet = quiet)

  rout_file <- paste0(basename(tmp_source), ".Rout")
  if (clean) {
    if (file.exists(rout_file)) {
      unlink(rout_file)
    } else if (!quiet) {
        message(rout_file, " does not exist")
    }
  }

  if (file.exists(tmp_objs)) {
    load(envir = calling_env, file = tmp_objs)
  } else if (!quiet) {
        message(tmp_objs, " does not exist")
  }
}
