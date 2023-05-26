

resource "github_branch_default" "default"{
  count = var.default_branch == null ? 0 : 1
  repository = github_repository.this.name
  branch     = var.default_branch
  rename     = true
}

resource "github_branch" "this" {
  for_each = toset(distinct(compact(var.repository_branches)))
  repository = github_repository.this.name
  branch     = each.value
}