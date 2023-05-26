locals {
    branch_protection_users = ["${data.github_user.current.login}"]
    branch_protection_teams = var.collaborator_teams.*.team_id



    ## CHECKS
    # dismissal_teams only if collaborator 
}


resource "github_branch_protection_v3" "this" {
  repository     = github_repository.this.name
  branch         = var.default_branch != null ? github_branch_default.default.0.branch : "main"
  enforce_admins = var.branch_protection != null ? var.branch_protection.enforce_admins : true

  # required_status_checks {
  #   strict   = false
  #   checks = [
  #     "ci/check:824642007264"
  #   ]
  # }

  dynamic "required_pull_request_reviews" {
    for_each =  (var.branch_protection != null ? 
                  var.branch_protection.required_pull_request_reviews != null ? 
                      [var.branch_protection.required_pull_request_reviews] : 
                  [] : 
                [])
    content {
    dismiss_stale_reviews = var.branch_protection.required_pull_request_reviews.dismiss_stale_reviews
    require_code_owner_reviews =  var.branch_protection.required_pull_request_reviews.require_code_owner_reviews
    required_approving_review_count = var.branch_protection.required_pull_request_reviews.required_approving_review_count

    dismissal_users = concat(var.branch_protection.required_pull_request_reviews.dismissal_users,local.branch_protection_users)
    dismissal_teams = var.branch_protection.required_pull_request_reviews.dismissal_teams 

    dynamic "bypass_pull_request_allowances" {
      for_each = (var.branch_protection != null ? 
                  var.branch_protection.required_pull_request_reviews != null ? 
                    var.branch_protection.required_pull_request_reviews.bypass_pull_request_allowances != null ?   
                      [var.branch_protection.required_pull_request_reviews.bypass_pull_request_allowances] : 
                    [] : 
                  [] : 
                [])
      content {
      users = var.branch_protection.required_pull_request_reviews.bypass_pull_request_allowances.users 
      teams = var.branch_protection.required_pull_request_reviews.bypass_pull_request_allowances.teams 
      # apps  = ["foo-app"]
      }
    }
    }
  }

  restrictions {
    users = local.branch_protection_users
    teams = local.branch_protection_teams
    # apps  = ["foo-app"]
  }

  lifecycle {
    replace_triggered_by = [
        github_repository_collaborators.collaborators
    ]
  }

  depends_on = [
    github_repository_file.files,
  ]
}


resource "github_branch_protection_v3" "branches" {
  for_each    = toset(var.repository_branches)
  repository  = github_repository.this.name
  branch      = each.value

  depends_on = [
    github_branch.this
  ]
}