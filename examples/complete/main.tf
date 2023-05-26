

module "complete" {
    source = "../.."

    token = ""
    owner = ""
    
    ### REPOSITORY
    name         = "repository-complete-configuration"
    description  = "This is a repository with all configurations enabled"
    homepage_url = "https://www.example.com"
    topics       = ["terraform-managed", "random-team","complete-example"]

    visibility           = "PUBLIC"
    is_template          = false

    has_issues           = true
    has_discussions      = false
    has_projects         = false
    has_wiki             = false

    allow_merge_commit   = true
    allow_squash_merge   = true
    allow_rebase_merge   = false
    allow_auto_merge     = false

    squash_merge_commit_title   = "PR_TITLE"
    squash_merge_commit_message = "BLANK"

    merge_commit_title     = "PR_TITLE"
    merge_commit_message   = "BLANK"
    delete_branch_on_merge = false
    allow_update_branch    = false

    auto_init = false

    archive_on_destroy   = true
    gitignore_template   = "Haskell"
    license_template     = "mit"

    vulnerability_alerts                    = true
    ignore_vulnerability_alerts_during_read = true

    ### TEAMPLATE
    template = {
        owner = "example-owner"
        repository = "example-repository-standard"
    }

    ### COLLABORATORS
    collaborator_users = [
        {
            username   = "random-user"
            permission = "read"
        },
    ]

    collaborator_teams = [
        {
            team_id    = "maintaine-team"
            permission = "maintain"
        },
        {
            team_id    = "admin-team"
            permission = "admin"
        },
    ]

    ### AUTOLINK
    github_repository_autolink_reference = {
        key_prefix = "TEAM-"
        target_url_template = "https://ORG.atlassian.net/browse/TEAM-<num>"
    }

    ### BRANCHs
    repository_branches = ["development","staging"]

    branch_protection = {

        required_pull_request_reviews = {
            dismiss_stale_reviews = true
            dismissal_users = ["random-user","maintainer-user"]
            dismissal_teams = ["maintainer-team"]

            require_code_owner_reviews = true
            required_approving_review_count = 1

            bypass_pull_request_allowances = {
                users = ["admin-user"]
                teams = ["admin-team"]
            }
        }   
    }

    ### ENVIRONMENTS
    environments = [
        {
            environment = "dev"

            reviewers = {
                users = ["random-user","maintainer-user"]
                teams = ["maintainer-team"]
            }

            deployment_branch_policy = {
                protected_branches     = true
                custom_branch_policies = false
            }
        },
        {
            environment = "prod"
            wait_timer  = 5

            reviewers = {
                users = ["admin-user"]
                teams = ["admin-team"]
            }

            deployment_branch_policy = {
                protected_branches     = true
                custom_branch_policies = false
            }
        }
    ]

}