

locals {

    sa_user = "${data.github_user.current.login}" != var.owner ? [{
        permission = "admin"
        username   = "${data.github_user.current.login}"
    }] : []

    users = concat(local.sa_user, var.collaborator_users)
}


resource "github_repository_collaborators" "collaborators" {
  repository = github_repository.this.name

  dynamic "user" {
    for_each = toset(local.users)
    content {
        permission = user.value.permission
        username  = user.value.username
    }
  }

  dynamic "team" {
    for_each = toset(var.collaborator_teams)
    content {
        permission = team.value.permission
        team_id = team.value.team_id
    }
  }
}

# resource "github_team_settings" "code_review_settings" {
#   team_id    = github_team.some_team.id
#   review_request_delegation {
#       algorithm = "ROUND_ROBIN"  // ROUND_ROBIN and LOAD_BALANCE
#       member_count = 1
#       notify = true
#   }
# }