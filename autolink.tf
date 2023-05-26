resource "github_repository_autolink_reference" "autolink" {
  count = var.github_repository_autolink_reference != null ? 1 : 0
  repository = github_repository.this.name
  is_alphanumeric = var.github_repository_autolink_reference["is_alphanumeric"]
  key_prefix = var.github_repository_autolink_reference["key_prefix"]
  target_url_template = var.github_repository_autolink_reference["target_url_template"]
}

