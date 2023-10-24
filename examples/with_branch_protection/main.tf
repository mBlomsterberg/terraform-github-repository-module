

module "with_branch_protection" {
    source = "../.."

    token = ""
    owner = ""
    
    name        = "example-repository"
    description = "This is an example of a repository with branch protection."
    topics      = ["terraform-managed", "module", "github"]

    collaborator_users = [
        {
            user_id    = "example-user"
            permission = "maintain"
        },
    ]

    collaborator_teams = [
        {
            team_id    = "maintainer-team"
            permission = "maintain"
        },
        {
            team_id    = "admin-team"
            permission = "admin"
        },
    ]

    branch_protection = {
        required_pull_request_reviews = {
            dismiss_stale_reviews = true
            dismissal_users = ["example-user"]
            dismissal_teams = ["maintainer-team"]

            require_code_owner_reviews = true
            required_approving_review_count = 1

            bypass_pull_request_allowances = {
                users = []
                teams = ["admin-team"]
            }
        }   
    }

}