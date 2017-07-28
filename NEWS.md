# 2.0.0

- Each `with_` function now has a `local_` variant, which reset at the end of
  their local scope, generally at the end of the function body.

- New functions `with_seed()` and `with_preserve_seed()` for running code with
  a given random seed (#45, @krlmlr).

# 1.0.2
- `with_makevars()` gains an `assignment` argument to allow specifying
  additional assignment types.

# 1.0.1
- Relaxed R version requirement to 3.0.2 (#35, #39).
- New `with_output_sink()` and `with_message_sink()` (#24).

# 1.0.0

First Public Release
