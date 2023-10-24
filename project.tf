


# resource "github_organization_project" "project" {
#   name = "A Organization Project"
#   body = "This is an organization project."
# }

# resource "github_project_column" "column" {
#   project_id = github_organization_project.project.id
#   name       = "a column"
# }

# resource "github_project_card" "card" {
#   column_id = github_project_column.column.column_id
#   note        = "## Unaccepted 👇"
# }

# resource "github_repository_project" "project" {
#   name       = "A Repository Project"
#   repository = "${github_repository.example.name}"
#   body       = "This is a repository project."
# }

# resource "github_repository_milestone" "example" {
#   owner      = "example-owner"
#   repository = "example-repository"
#   title      = "v1.1.0"
#   description = ""
#   due_date = ""
#   state  = ""
# }

