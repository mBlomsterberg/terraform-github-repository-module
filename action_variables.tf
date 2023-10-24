# resource "github_actions_environment_variable" "example_variable" {
#   repository       = data.github_repository.repo.name
#   environment      = github_repository_environment.repo_environment.environment
#   variable_name    = "example_variable_name"
#   value            = "example_variable_value"
# }

# resource "github_actions_variable" "example_variable" {
#   repository       = "example_repository"
#   variable_name    = "example_variable_name"
#   value            = "example_variable_value"
# }