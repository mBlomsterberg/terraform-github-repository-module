# Wrapper for module: `terraform-github-repository-module`

The configuration in this directory contains an implementation of a single module wrapper pattern, which allows managing several copies of a module in places where using the native Terraform 0.13+ `for_each` feature is not feasible (e.g., with Terragrunt).

You may want to use a single Terragrunt configuration file to manage multiple resources without duplicating `terragrunt.hcl` files for each copy of the same module.

This wrapper does not implement any extra functionality.

```hcl
inputs = {

    # Default values for all repositories
    defaults = {    
        token = ""
        owner = ""

        enable_aws_trust = false

        repository_branches = ["main", "develop"]

        collaborator_teams  = [
            {
                team_id     = "some-team"
                permission  = "admin"
            },
        ]

        environments = [
            {
                environment = "dev"
                reviewers   = {
                    teams = ["some-team"]
                }
            },
            {
                environment = "prod"
            }
        ]

        github_repository_autolink_reference = {
            key_prefix = "Issue-"
            target_url_template = "https://www.example.com/issues/{{.Issue}}"
        }
    }

    items = {
        first-repository = {
            # omitted... can be any argument supported by the module
            description      = "This is my first repository."
            topics           = ["github-repository", "terraform-state"]
            homepage_url     = "https://www.example.com"
        },
        second-repository = {
            enable_aws_trust = true
            description      = "This is my second repository."
            topics           = ["github-repository", "terraform-state"]
            homepage_url     = "https://www.example.com"
        
            environments     = [
                {
                    environment = "sandbox"
                }
            ]
        },
    }
}

```