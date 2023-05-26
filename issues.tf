
# resource "github_repository_milestone" "test" {
#   owner = split("/", "${github_repository.test.full_name}")[0]
#   repository = github_repository.test.name
#   title = "v1.0.0"
#   description = "General Availability"
#   due_date = "2022-11-22"
#   state = "open"
# }


resource "github_issue" "example" {
    count = var.has_issues ? 1 : 0
    repository       = github_repository.this.name
    title            = "How to report an issue in the '${github_repository.this.name}' repository"
    body             = <<EOT
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Desktop (please complete the following information):**
 - OS: [e.g. iOS]
 - Browser [e.g. chrome, safari]
 - Version [e.g. 22]

**Smartphone (please complete the following information):**
 - Device: [e.g. iPhone6]
 - OS: [e.g. iOS8.1]
 - Browser [e.g. stock browser, safari]
 - Version [e.g. 22]

**Additional context**
Add any other context about the problem here.
EOT

    labels           = ["bug", "documentation"]
    # assignees        = ["bob-github"]
    # milestone_number = github_repository_milestone.test.number
}