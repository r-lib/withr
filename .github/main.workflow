workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {

  uses = "r-lib/ghactions/actions/install-deps@v0.4.1"
}

action "Document Package" {
  needs = [
    "Install Dependencies"
  ]
  uses = "r-lib/ghactions/actions/document@v0.4.1"
  args = [
    "--after-code=commit"
  ]
  secrets = [
    "GITHUB_TOKEN"
  ]
}

