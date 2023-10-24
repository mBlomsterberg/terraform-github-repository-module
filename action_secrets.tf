

resource "github_actions_secret" "personal_token" {
  repository       = github_repository.this.name
  secret_name      = "PAT"
  plaintext_value  = var.token
}

# resource "github_actions_secret" "example_secret" {
#   repository       = "example_repository"
#   secret_name      = "example_secret_name"
#   plaintext_value  = var.some_secret_string
# }

# resource "github_actions_environment_secret" "test_secret" {
#   repository       = github_repository.this.name
#   environment      = github_repository_environment.repo_environment.environment
#   secret_name      = "test_secret_name"
#   plaintext_value  = "%s"
#   encrypted_value  = ""
# }