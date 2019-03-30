workflow "Publish master to gh-pages" {
  resolves = [
    "publish-hugo-site",
  ]
  on = "push"
}

action "Filter branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "publish-hugo-site" {
  uses = "pinkkis/page-publisher@master"
  env = {
    TARGET_REPO = "pinkkis/poisonvial.com"
    CNAME = "poisonvial.com"
  }
  secrets = [
    "GITHUB_TOKEN",
  ]
  args = "gh-pages"
  needs = ["Filter branch"]
}
