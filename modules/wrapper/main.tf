

module "wrapper" {
    source = "../.."

    for_each = var.items

    token = try(each.value.token, var.defaults.token)
    owner = try(each.value.owner, var.defaults.owner)
    codeowners = try(each.value.codeowners, var.defaults.codeowners, "")

    enable_aws_trust       = try(each.value.enable_aws_trust, var.defaults.enable_aws_trust, false)
    ignore_files_generated = try(each.value.ignore_files_generated, var.defaults.ignore_files_generated, false)

    name         = each.key // try("${var.defaults.name_prefix}-${each.key}", each.key)
    description  = try(each.value.description, var.defaults.description, "")
    visibility   = try(each.value.visibility, var.defaults.visibility, "public")
    topics       = try(each.value.topics, var.defaults.topics,[])
    homepage_url = try(each.value.homepage_url, var.defaults.homepage_url, "")

    has_discussions = try(each.value.has_discussions, var.defaults.has_discussions, false)
    has_issues      = try(each.value.has_issues, var.defaults.has_issues, false)
    has_projects    = try(each.value.has_projects, var.defaults.has_projects, false)
    has_wiki        = try(each.value.has_wiki, var.defaults.has_wiki, false)
    pages           = try(each.value.pages, var.defaults.pages, null)

    archive_on_destroy    = try(each.value.archive_on_destroy, var.defaults.archive_on_destroy, false)
    is_template           = try(each.value.is_template, var.defaults.is_template, false)
    security_and_analysis = try(each.value.security_and_analysis, var.defaults.security_and_analysis, null)
    vulnerability_alerts  = try(each.value.vulnerability_alerts, var.defaults.vulnerability_alerts, true)

    ignore_vulnerability_alerts_during_read = try(each.value.ignore_vulnerability_alerts_during_read, var.defaults.ignore_vulnerability_alerts_during_read, false)

    allow_auto_merge    = try(each.value.allow_auto_merge, var.defaults.allow_auto_merge, false)
    allow_merge_commit  = try(each.value.allow_merge_commit, var.defaults.allow_merge_commit, true)
    allow_rebase_merge  = try(each.value.allow_rebase_merge, var.defaults.allow_rebase_merge, false)
    allow_squash_merge  = try(each.value.allow_squash_merge, var.defaults.allow_squash_merge, true)
    allow_update_branch = try(each.value.allow_update_branch, var.defaults.allow_update_branch, false)

    merge_commit_title = try(each.value.merge_commit_title, var.defaults.merge_commit_title, "PR_TITLE")
    merge_commit_message = try(each.value.merge_commit_message, var.defaults.merge_commit_message, "BLANK")
    squash_merge_commit_message = try(each.value.squash_merge_commit_message, var.defaults.squash_merge_commit_message, "BLANK")
    squash_merge_commit_title = try(each.value.squash_merge_commit_title, var.defaults.squash_merge_commit_title, "PR_TITLE")

    gitignore_template = try(each.value.gitignore_template, var.defaults.gitignore_template, null)
    license_template   = try(each.value.license_template, var.defaults.license_template, "mit")
    
    auto_init = try(each.value.auto_init, var.defaults.auto_init, false)
    template  = try(each.value.template, var.defaults.template, null)
    github_repository_autolink_reference = try(each.value.github_repository_autolink_reference, var.defaults.github_repository_autolink_reference, null)

    repository_branches  = try(each.value.repository_branches, var.defaults.repository_branches, [])
    default_branch       = try(each.value.default_branch, var.defaults.default_branch, null)
    environments         = try(each.value.environments, var.defaults.environments, [])
    secrets              = try(each.value.secrets, var.defaults.secrets, [])

    branch_protection      = try(each.value.branch_protection, var.defaults.branch_protection, null)
    delete_branch_on_merge = try(each.value.delete_branch_on_merge, var.defaults.delete_branch_on_merge, false)

    github_team        = try(each.value.github_team, var.defaults.github_team, null)
    collaborator_users = try(each.value.collaborator_users, var.defaults.collaborator_users, [])
    collaborator_teams = try(each.value.collaborator_teams, var.defaults.collaborator_teams, [])

}