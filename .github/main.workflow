workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@e3996339bf3364fb8e78b605c4ce6231adad9cba"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@e3996339bf3364fb8e78b605c4ce6231adad9cba"
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
