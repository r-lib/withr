workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@bc9b6b4cba39c28f651fdfc16ffdab98678da4b9"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@bc9b6b4cba39c28f651fdfc16ffdab98678da4b9"
  needs = [
    "Install Dependencies"
  ]
  args = [
    "--after-code=commit"
  ]
  secrets = [
    "GITHUB_TOKEN"
  ]
}
