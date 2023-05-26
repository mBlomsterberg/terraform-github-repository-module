

locals {
    user_env_list = flatten([
        for env, details in var.environments : [
            for user in details.reviewers.users : {
                env   = details.environment
                user  = user
            }
        ]
    ])

    user_translated_list = { for k, v in data.github_user.user_ids : k => v.id }

    team_env_list = flatten([
        for env, details in var.environments : [
            for team in details.reviewers.teams : {
                env   = details.environment
                team  = team
            }
        ]
    ])

    team_translated_list = { for k, v in data.github_team.team_ids : k => v.id }
}

data "github_user" "user_ids" {
    for_each = { for ue in local.user_env_list : "${ue.env}.${ue.user}" => ue.user }
    username = each.value
}

data "github_team" "team_ids" {
    for_each = { for ue in local.team_env_list : "${ue.env}.${ue.team}" => ue.team }
    slug = each.value
}


resource "github_repository_environment" "this" {
  for_each = {for k,v in var.environments: v.environment => v}
  environment  = each.value.environment
  repository   = github_repository.this.name
  wait_timer   = each.value.wait_timer

  dynamic "reviewers" {
    for_each = each.value.reviewers != null ? [each.value.reviewers] : []
    content {
        teams = [for k, v in local.team_translated_list : v if substr(k, 0, length(each.value.environment)) == each.value.environment]
        users = [for k, v in local.user_translated_list : v if substr(k, 0, length(each.value.environment)) == each.value.environment]
    }
  }

  dynamic "deployment_branch_policy" {
    for_each = each.value.deployment_branch_policy != null ? [each.value.deployment_branch_policy] : []
    content {
        protected_branches     = deployment_branch_policy.value.protected_branches
        custom_branch_policies = deployment_branch_policy.value.custom_branch_policies
    }
  }

  depends_on = [
    github_repository_collaborators.collaborators
  ]
}