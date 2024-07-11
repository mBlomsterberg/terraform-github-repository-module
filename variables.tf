
variable "token" {
    type = string
    description = "(Optional) A GitHub OAuth / Personal Access Token."
    default = null
}

variable "owner" {
    type = string
    description = "(Optional) This is the target GitHub organization or individual user account to manage."
    default = null
}

variable "codeowners" {
    type = list(string)
    description = "(Optional) This is the target team or individual user account that manages the code in the repository."
    default = null
} 

variable "collaborator_users"{
        type = list(object({
        permission = optional(string, "read")
        username = optional(string, "")
    }))
    description = "(Optional) The list of user names that is added as collaborators to the repository."
    default = []
}

variable "collaborator_teams"{
    type = list(object({
        permission = optional(string, "read")
        team_id = optional(string, "")
    }))
    description = "(Optional) The list of team names that is added as collaborators to the repository."
    default = []
}

## REPOSITORY
variable "name" {
    type = string
    description = "(Required) The name of the repository."
}

variable "description" {
    type = string
    description = "(Optional) A description of the repository."
    default = "Terraform created GitHub Repository"
}

variable "homepage_url" {
    type = string
    description = "(Optional) URL of a page describing the project."
    default = ""
}

variable "visibility" {
    type = string
    description = "(Optional) Can be public or private or internal."
    default = "public"
}

variable "is_template" {
    type = bool
    description = "(Optional) Set to true to tell GitHub that this is a template repository."
    default = false
}

variable "has_issues" {
    type = bool
    description = "(Optional) Set to true to enable the GitHub Issues features on the repository."
    default = false
}

variable "has_discussions" {
    type = bool
    description = "(Optional) Set to true to enable GitHub Discussions on the repository."
    default = false
}

variable "has_projects" {
    type = bool
    description = "(Optional) Set to true to enable the GitHub Projects features on the repository."
    default = false
}

variable "has_wiki" {
    type = bool
    description = "(Optional) Set to true to enable the GitHub Wiki features on the repository."
    default = false
}

variable "allow_merge_commit" {
    type = bool
    description = "(Optional) Set to false to disable merge commits on the repository."
    default = true
}

variable "allow_squash_merge" {
    type = bool
    description = "(Optional) Set to false to disable squash merges on the repository."
    default = true
}

variable "allow_rebase_merge" {
    type = bool
    description = "(Optional) Set to false to disable rebase merges on the repository."
    default = false
}

variable "allow_auto_merge" {
    type = bool
    description = "(Optional) Set to true to allow auto-merging pull requests on the repository."
    default = false
}

variable "squash_merge_commit_title" {
    type = string
    description = "(Optional) Can be PR_TITLE or COMMIT_OR_PR_TITLE for a default squash merge commit title."
    default = "PR_TITLE"
}

variable "squash_merge_commit_message" {
    type = string
    description = "(Optional) Can be PR_BODY, COMMIT_MESSAGES, or BLANK for a default squash merge commit message."
    default = "BLANK"
}

variable "merge_commit_title" {
    type = string
    description = "(Optional) Can be PR_TITLE or MERGE_MESSAGE for a default merge commit title."
    default = "PR_TITLE"
}

variable "merge_commit_message" {
    type = string
    description = "(Optional) Can be PR_BODY, PR_TITLE, or BLANK for a default merge commit message."
    default = "BLANK"
}

variable "delete_branch_on_merge" {
    type = bool
    description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to false."
    default = false
}

variable "allow_update_branch" {
    type = bool
    description = "(Optional) Set to true to always suggest updating pull request branches."
    default = false
}

variable "auto_init" {
    type = bool
    description = "(Optional) Set to true to produce an initial commit in the repository."
    default = false
}

variable "archive_on_destroy" {
    type = bool
    description = "(Optional) Set to true to archive the repository instead of deleting on destroy."
    default = true
}

variable "gitignore_template" {
    type = string
    description = "(Optional) Use the name of the template without the extension. For example, \"Haskell\"."
    default = null
}

variable "license_template" {
    type = string
    description = "(Optional) Use the name of the template without the extension. Default is \"mit\"."
    default = "mit"
}

variable "topics" {
    type = list(string)
    description = "(Optional) The list of topics of the repository."
    default = []
}

variable "vulnerability_alerts" {
    type = bool
    description = "(Optional) Set to true to enable security alerts for vulnerable dependencies."
    default = false
}

variable "ignore_vulnerability_alerts_during_read" {
    type = bool
    description = "(Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read."
    default = false
}

variable "template" {
    type = object({
        owner      = string
        repository = string
        include_all_branches = optional(bool, false)
    })
    description = "(Optional) Use a template repository to create this resource."
    default = null
}

variable "pages" {
    type = object({
      branch = string
      path   = optional(string, "/")
      cname  = optional(string, "")
    })
    description = "(Optional) The repository's GitHub Pages configuration."
    default = null
}

variable "security_and_analysis" {
    type = object({
      advanced_security = optional(string, "disabled")
      secret_scanning   = optional(string, "disabled")
      secret_scanning_push_protection  = optional(string, "disabled")
    })
    description = "(Optional) The repository's security and analysis configuration."
    default = null
}

variable "github_repository_autolink_reference" {
    type = object({
        key_prefix = string
        target_url_template = string
        is_alphanumeric = optional(bool, false)
    })
    description = "(Optional) This allows you to create an autolink reference."
    default = null
}




## BRANCHES
variable "default_branch" {
    type = string
    description = "(Optional) Set to true to produce an initial commit in the repository."
    default = null
}

variable "repository_branches" {
    type = list(string)
    description = "(Optional) The list of branche names to create in the repository."
    default = []
}


## BRANCH PROTECTION
variable "branch_protection" {
    type = object({
        branch = optional(string, null)
        enforce_admins = optional(bool, true)
        required_status_checks = optional(object({
            strict = optional(bool,false)
            checks = optional(list(string), [])
        }))
        required_pull_request_reviews = optional(object({
            dismiss_stale_reviews = optional(bool,true)
            dismissal_users = optional(list(string),[])
            dismissal_teams = optional(list(string),[])
            require_code_owner_reviews =  optional(bool,false)
            required_approving_review_count = optional(number,0)
            bypass_pull_request_allowances = optional(object({
                users = optional(list(string),[""])
                teams = optional(list(string),[""])
                apps  = optional(list(string),[])
            }), null)
        }), {})
    })
    description = "(Optional) The repository's default branch protection configuration."
    default = null
}



## ENVIRONMENTS
variable "environments" {
    type = list(object({
        environment = string
        wait_timer = optional(number,0)
        reviewers = optional(object({
            users = optional(list(string),[])
            teams = optional(list(string),[])
        }), null)
        deployment_branch_policy = optional(object({
            protected_branches = optional(bool, false)
            custom_branch_policies = optional(bool,false)
        }),null)

    }))
    description = "(Optional) The repository's environment configurations."
    default = []
}
