


# resource "github_repository_webhook" "foo" {
#   repository = github_repository.repo.name

#   name = "web"

#   configuration {
#     url          = "https://google.de/"
#     content_type = "form"
#     insecure_ssl = false
#   }

#   active = false

#   events = ["issues"]
# }