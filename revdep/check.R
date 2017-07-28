library("revdepcheck")

revdep_check(num_workers = 8, "..")
revdep_report_summary("..", file = "README.md")
revdep_report_problems("..", file = "problems.md")
